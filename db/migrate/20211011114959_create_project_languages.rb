class CreateProjectLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :project_languages do |t|

      t.timestamps
    end
  end
end
