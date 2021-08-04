class Board < ApplicationRecord
  has_many :column, dependent: :destroy

  validates :name, presence: true
  validates :secure_id, uniqueness: true
end
