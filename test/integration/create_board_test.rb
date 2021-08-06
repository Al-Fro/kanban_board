require 'test_helper'

class CreateBoardTest < ActionDispatch::IntegrationTest
  test 'create board' do
    get '/'

    assert_response :success

    post '/boards', params: {board: {name: 'Test board'}}

    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'h4', 'Board: Test board'
  end
end
