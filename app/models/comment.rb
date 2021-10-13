class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :post

  scope :persisted, -> {where.not(id: nil)}
end
