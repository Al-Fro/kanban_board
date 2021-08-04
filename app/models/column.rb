class Column < ApplicationRecord
  balongs_to :board
  has_many :card, dependent: :destroy
end
