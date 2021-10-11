class Project < ApplicationRecord
  has_rich_text :description
  belongs_to :user
  has_many :tasks
  has_many :project_languages
  has_many :languages, through: :project_languages
end
