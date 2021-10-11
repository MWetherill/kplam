class AddLanguageIdToProjectLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :project_languages, :language_id, :integer
  end
end
