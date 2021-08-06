import consumer from "./consumer"

consumer.subscriptions.create("BoardChannel", {
  connected() {},

  disconnected() {},

  received(data) {
    const boardContainer = document.getElementById('board-container');
    
    boardContainer.innerHTML = data;
  }
});
