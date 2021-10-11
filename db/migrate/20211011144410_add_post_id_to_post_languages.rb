class AddPostIdToPostLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_languages, :post_id, :integer
  end
end
