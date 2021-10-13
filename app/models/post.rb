class Post < ApplicationRecord
  has_rich_text :description
  belongs_to :user
  has_many :comments
  has_many :post_languages
  has_many :languages, through: :post_languages
end
