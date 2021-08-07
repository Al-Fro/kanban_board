class ChannelWorker < BaseWorker
  sidekiq_options retry: 1

  def perform(board_id)
    board = Board.find(board_id)

    html = ApplicationController.render partial: 'boards/board_container', locals: {board: board}

    ActionCable.server.broadcast "board_channel_#{board_id}", html
  end
end
