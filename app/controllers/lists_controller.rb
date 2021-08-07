class ListsController < ApplicationController
  def create
    @list = List.new permitted_params

    return_to_back(@list) unless @list.save

    ChannelWorker.perform_async(params[:board_id])
  end

  def destroy
    @list = List.find(params[:id])

    return_to_back(@list) unless @list.destroy

    ChannelWorker.perform_async(params[:board_id])
  end

  private

  def permitted_params
    params.require(:list).permit(:title, :board_id)
  end
end
