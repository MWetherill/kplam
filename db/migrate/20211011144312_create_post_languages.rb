class CreatePostLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_languages do |t|

      t.timestamps
    end
  end
end
