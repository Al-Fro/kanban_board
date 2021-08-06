require 'application_system_test_case'

class BoardsTest < ApplicationSystemTestCase
  test 'create list on board' do
    board = create(:board)

    visit board_path(board.secure_id)

    fill_in 'list_title', with: 'Test list'

    click_on 'Create new list'

    visit current_path

    assert_text 'Test list'
    assert_equal(1, List.count)
  end

  test 'create card on board' do
    list = create(:list, :with_board)

    visit board_path(list.board.secure_id)

    fill_in 'card_title', with: 'Test card'

    click_on 'Add new card'

    visit current_path

    assert_text 'Title: Test card'
    assert_equal(1, Card.count)
  end

  test 'update card title' do
    card = create(:card, :with_list)
    
    visit board_path(card.list.board.secure_id)

    find('a', id: "#{card.id}").click

    assert_text 'Edit card'

    fill_in 'card_edit', with: 'Test card'

    click_on 'Update card'

    visit current_path

    assert_text 'Title: Test card'
  end

  test 'update card list' do
    board = create(:board)
    
    10.times { create(:list, board_id: board.id) }

    card = create(:card, list_id: List.first.id)
    
    visit board_path(board.secure_id)

    find('a', id: "#{card.id}").click

    select("#{List.last.title}", from: 'card_list_id')

    click_on 'Update card'

    visit current_path

    assert_equal List.last.cards.count, 1
  end
end
