class Language < ApplicationRecord
  has_many :project_languages
  has_many :projects, through: :project_languages
  has_many :post_languages
  has_many :posts, through: :post_languages
end
