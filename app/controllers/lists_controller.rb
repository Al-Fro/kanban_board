class ListsController < ApplicationController
  def create
    board = Board.find(params[:board_id])

    @list = List.new permitted_params
    @list.board_id = board.id

    @list.save!

    redirect_to "/boards/#{board.secure_id.to_sym}"
  end

  def destroy
    board = Board.find(params[:board_id])

    @list = List.find(params[:id])

    @list.destroy!

    redirect_to "/boards/#{board.secure_id.to_sym}"
  end

  private

  def permitted_params
    params.require(:list).permit(:title)
  end
end
