require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    list = create(:list, :with_board)
    card = build(:card)

    post board_list_cards_path(list.board, list), params: {card: {title: card.title, list_id: list.id}}

    assert_response :no_content
    assert Card.find_by(title: card.title, list_id: list.id)
  end

  test 'should get update' do
    list = create(:list, :with_board)
    card = create(:card, :with_list)

    patch board_list_card_path(card.list.board, card.list, card), params: {card: {title: '123', list_id: list.id}}

    assert_response :no_content
    assert Card.find_by(id: card.id, title: '123', list_id: list.id)
  end

  test 'should get destroy' do
    card = create(:card, :with_list)

    delete board_list_card_path(card.list.board, card.list, card)

    assert_response :no_content
    assert_not Card.find_by(id: card.id)
  end
end
