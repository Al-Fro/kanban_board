class CardsController < ApplicationController
  def create
    board = Board.find(params[:board_id])

    @card = Card.new permitted_params
    @card.list_id = params[:list_id]

    @card.save!

    redirect_to "/boards/#{board.secure_id.to_sym}"
  end

  def update
    board = Board.find(params[:board_id])

    @card = Card.find(params[:id])

    @card.update! permitted_params

    redirect_to "/boards/#{board.secure_id.to_sym}"
  end

  def destroy
    board = Board.find(params[:board_id])

    @card = Card.find(params[:id])

    @card.destroy!

    redirect_to "/boards/#{board.secure_id.to_sym}"
  end

  private

  def permitted_params
    params.require(:card).permit(:title, :list_id)
  end
end
