%%%-------------------------------------------------------------------
%%% File    : oms.erl
%%% Author  : Evgeniy Khramtsov <ekhramtsov@process-one.net>
%%% Description : 
%%%
%%% Created :  4 Dec 2009 by Evgeniy Khramtsov <ekhramtsov@process-one.net>
%%%-------------------------------------------------------------------
-module(oms).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/0, stop/1, get_so_path/0]).

-define(DEFAULT_LOG_PATH, "oms.log").

-include("oms.hrl").
-include("p1_logger.hrl").

%%====================================================================
%% Application callbacks
%%====================================================================
start() ->
    application:start(oms).

start(_Type, _StartArgs) ->
    application:start(sasl),
    init_logger(),
    ?INFO_MSG("starting OneTeam Media Server (c) 2008-2010, ProcessOne",
	      []),
    case load_drivers() of
	ok ->
	    init_mnesia(),
	    case oms_sup:start_link() of
		{ok, _Sup} = Res ->
		    ?INFO_MSG("OneTeam Media Server ~s is started "
			      "in the node ~p", [?OMS_VERSION, node()]),
		    Res;
		Err ->
		    Err
	    end;
	Err ->
	    Err
    end.

stop() ->
    application:stop(oms).

stop(_State) ->
    ok.

get_so_path() ->
    case os:getenv("OMS_SO_PATH") of
	false ->
	    case code:priv_dir(oms) of
		{error, _} ->
		    ".";
		Path ->
		    Path
	    end;
	Path ->
	    Path
    end.

%%====================================================================
%% Internal functions
%%====================================================================
init_logger() ->
    %% loglevel: Verbosity of log files generated by application.
    %% 0: No application log at all (not recommended)
    %% 1: Critical
    %% 2: Error
    %% 3: Warning
    %% 4: Info
    %% 5: Debug
    p1_loglevel:set(4),
    LogPath = get_log_path(),
    error_logger:add_report_handler(p1_logger_h, LogPath).

get_log_path() ->
    case application:get_env(oms, log_path) of
	{ok, Path} ->
	    Path;
	undefined ->
	    case os:getenv("OMS_LOG_PATH") of
		false ->
		    ?DEFAULT_LOG_PATH;
		Path ->
		    Path
	    end
    end.

load_drivers() ->
    Driver = rtmp_codec_drv,
    case erl_ddll:load_driver(get_so_path(), Driver) of
	ok ->
	    ok;
	{error, already_loaded} ->
	    ok;
	{error, Reason} ->
	    ?CRITICAL_MSG("unable to open driver '~p': ~s",
			  [Driver, erl_ddll:format_error(Reason)]),
	    {error, driver_load_failed}
    end.

init_mnesia() ->
    case mnesia:system_info(extra_db_nodes) of
	[] ->
	    mnesia:create_schema([node()]);
	_ ->
	    ok
    end,
    application:start(mnesia, permanent),
    mnesia:wait_for_tables(mnesia:system_info(local_tables), infinity).
