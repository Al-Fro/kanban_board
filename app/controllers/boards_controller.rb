class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new permitted_params
    @board.secure_id = SecureRandom.base64(10)

    unless @board.save
      render :new
    end

    redirect_to "/boards/#{@board.secure_id.to_sym}"
  end

  def show
    @board = Board.find_by(secure_id: params[:id])

    return redirect_to root_path if @board.blank?
  end

  private

  def permitted_params
    params.require(:board).permit(:name)
  end
end
