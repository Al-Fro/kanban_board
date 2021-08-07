class CardsController < ApplicationController
  def create
    @card = Card.new permitted_params

    return_to_back(@card) unless @card.save

    ChannelWorker.perform_async(params[:board_id])
  end

  def update
    @card = Card.find(params[:id])

    return_to_back(@card) unless @card.update permitted_params

    ChannelWorker.perform_async(params[:board_id])
  end

  def destroy
    @card = Card.find(params[:id])

    return_to_back(@card) unless @card.destroy

    ChannelWorker.perform_async(params[:board_id])
  end

  private

  def permitted_params
    params.require(:card).permit(:title, :list_id)
  end
end
