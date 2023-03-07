component {

    this.name = "websocket_test";

    function onApplicationStart(){

		// Workaround from here
        // https://github.com/isapir/lucee-websocket/issues/9
		// If you are working with multiple web applications that need web socket
		// you need to create a new instance of the web socket server and store 
		// it in the server scope with a different name. (For example: server.websockets2)
		if(structKeyExists(server, "websockets")){
			application.websockets = server.websockets;
		}
		else {
			application.websockets = WebsocketServer("/ws/chat/{channel}", new ChatListener());
			server.websockets = application.websockets;
		}
	}

}
