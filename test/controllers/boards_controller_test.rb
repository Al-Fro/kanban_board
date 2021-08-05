require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    board = build(:board)
    boards_count = Board.count

    post boards_path, params: {board: {name: board.name}}

    assert_response :redirect
    assert_in_delta(Board.count, boards_count, 1)
    assert Board.find_by(name: board.name)
  end

  test 'should get show' do
    board = create(:board)
    board.secure_id = SecureRandom.hex(5)
    board.save

    get board_path(board.secure_id)

    assert_response :success
  end
end
