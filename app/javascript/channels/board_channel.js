import consumer from "./consumer"

document.addEventListener("DOMContentLoaded", function() {
  const board_id = Number(document.getElementById('board_id').getAttribute('data-board-id'))

  consumer.subscriptions.create({ channel: "BoardChannel", board_id: board_id }, {
    connected() {},
  
    disconnected() {},
  
    received(data) {
      const boardContainer = document.getElementById('board-container');
  
      boardContainer.innerHTML = data;
    }
  });
});

