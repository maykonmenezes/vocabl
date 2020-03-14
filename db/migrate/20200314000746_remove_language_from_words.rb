class RemoveLanguageFromWords < ActiveRecord::Migration[6.0]
  def change
    remove_column :words, :language
  end
end
