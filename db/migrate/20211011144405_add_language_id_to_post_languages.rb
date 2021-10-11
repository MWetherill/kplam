class AddLanguageIdToPostLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_languages, :language_id, :integer
  end
end
