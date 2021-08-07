require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    board = create(:board)
    list = build(:list)

    post board_lists_path(board), params: {list: {title: list.title, board_id: board.id}}

    assert_response :no_content
    assert List.find_by(title: list.title, board_id: board.id)
  end

  test 'should get destroy' do
    list = create(:list, :with_board)

    delete board_list_path(list.board, list)

    assert_response :no_content
    assert_not List.find_by(id: list.id)
  end
end
