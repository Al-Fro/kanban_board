class ListsController < ApplicationController
  def create
    @list = List.new permitted_params
    @list.board_id = params[:board_id]

    @list.save!

    ChannelWorker.perform_async(params[:board_id])
  end

  def destroy
    @list = List.find(params[:id])

    @list.destroy!

    ChannelWorker.perform_async(params[:board_id])
  end

  private

  def permitted_params
    params.require(:list).permit(:title)
  end
end
