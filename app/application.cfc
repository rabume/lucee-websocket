component {

    this.name = "websocket_chat";

    function onApplicationStart(){

		// Workaround from here
        // https://github.com/isapir/lucee-websocket/issues/9
		if(structKeyExists(server, "websockets")){
			application.websockets = server.websockets;
		}
		else {
			application.websockets = WebsocketServer("/ws/chat/{channel}", new ChatListener());
			server.websockets = application.websockets;
		}
	}

}