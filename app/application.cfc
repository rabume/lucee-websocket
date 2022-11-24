component {

    this.name = "websocket_chat";

    function onApplicationStart(){
        WebsocketServer("/ws/chat/{channel}", new ChatListener());
    }
}