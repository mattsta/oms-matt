%%%-------------------------------------------------------------------
%%% File    : oms.app
%%% Author  : Evgeniy Khramtsov <ekhramtsov@process-one.net>
%%% Description : 
%%%
%%% Created :  3 Jan 2010 by Evgeniy Khramtsov <ekhramtsov@process-one.net>
%%%-------------------------------------------------------------------
{application, oms,
 [{description,	 "oms"},
  {vsn,          "1.1"},
  {modules,	 [amf0_codec,
		  dynamic_compile,
		  flv_codec,
		  oms_api,
		  oms_app_mgr,
		  oms_config,
		  oms_stress,
		  oms,
		  oms_file_stream,
		  oms_lib,
		  oms_listener,
		  oms_so_mgr,
		  oms_stream,
		  oms_sm,
		  oms_sup,
		  oms_tmp_sup,
		  p1_logger_h,
		  p1_loglevel,
		  rtmp_codec,
		  rtmp_session,
		  rtmp_socket]},
  {registered,	 [oms_rtmp_socket_sup,
		  oms_rtmp_session_sup,
		  oms_listener,
		  oms_app_mgr,
		  oms_file_stream_sup,
		  oms_stream_sup,
		  oms_sm,
		  oms_so_mgr,
		  oms_config,
		  oms_sup]},
  {applications, [kernel, stdlib]},
  {mod,		 {oms,[]}}]}.

%% Local Variables:
%% mode: erlang
%% End:
%% vim: set filetype=erlang tabstop=8:
