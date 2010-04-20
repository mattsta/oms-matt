%%%-------------------------------------------------------------------
%%% File    : oms.hrl
%%% Author  : Evgeniy Khramtsov <ekhramtsov@process-one.net>
%%% Description : 
%%%
%%% Created :  3 Jan 2010 by Evgeniy Khramtsov <ekhramtsov@process-one.net>
%%%-------------------------------------------------------------------
-define(OMS_VERSION, "1.1").

-record(call_ctx, {rtmp_sock,
		   session,
		   app_name,
		   options = [],
		   addr,
		   stream}).

%% NetConnection information
-define(NC_CALL_FAILED,          "NetConnection.Call.Failed").
-define(NC_CONNECT_APP_SHUTDOWN, "NetConnection.Connect.AppShutdown").
-define(NC_CONNECT_CLOSED,       "NetConnection.Connect.Closed").
-define(NC_CONNECT_FAILED,       "NetConnection.Connect.Failed").
-define(NC_CONNECT_REJECTED,     "NetConnection.Connect.Rejected").
-define(NC_CONNECT_SUCCESS,      "NetConnection.Connect.Success").

%% NetStream information
-define(NS_BUFFER_EMPTY,          "NetStream.Buffer.Empty").
-define(NS_BUFFER_FULL,           "NetStream.Buffer.Full").
-define(NS_FAILED,                "NetStream.Failed").
-define(NS_PAUSE_NOTIFY,          "NetStream.Pause.Notify").
-define(NS_PLAY_COMPLETE,         "NetStream.Play.Complete").
-define(NS_PLAY_FAILED,           "NetStream.Play.Failed").
-define(NS_PLAY_INSUFFICIENT_BW,  "NetSream.Play.InsufficientBW").
-define(NS_PLAY_PUBLISH_NOTIFY,   "NetStream.Play.PublishNotify").
-define(NS_PLAY_RESET,            "NetStream.Play.Reset").
-define(NS_PLAY_START,            "NetStream.Play.Start").
-define(NS_PLAY_STOP,             "NetStream.Play.Stop").
-define(NS_PLAY_STREAM_NOT_FOUND, "NetStream.Play.StreamNotFound").
-define(NS_PLAY_SWITCH,           "NetStream.Play.Switch").
-define(NS_PLAY_UNPUBLISH_NOTIFY, "NetStream.Play.UnpublishNotify").
-define(NS_PUBLISH_BAD_NAME,      "NetStream.Publish.BadName").
-define(NS_PUBLISH_IDLE,          "NetStream.Publish.Idle").
-define(NS_PUBLISH_START,         "NetStream.Publish.Start").
-define(NS_RECORD_FAILED,         "NetStream.Record.Failed").
-define(NS_RECORD_NO_ACCESS,      "NetStream.Record.NoAccess").
-define(NS_RECORD_START,          "NetStream.Record.Start").
-define(NS_RECORD_STOP,           "NetStream.Record.Stop").
-define(NS_SEEK_FAILED,           "NetStream.Seek.Failed").
-define(NS_SEEK_NOTIFY,           "NetStream.Seek.Notify").
-define(NS_UNPAUSE_NOTIFY,        "NetStream.Unpause.Notify").
-define(NS_UNPUBLISH_SUCCESS,     "NetStream.Unpublish.Success").
