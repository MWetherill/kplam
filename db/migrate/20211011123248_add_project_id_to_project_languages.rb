class AddProjectIdToProjectLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :project_languages, :project_id, :integer
  end
end
