class RenameValueToContent < ActiveRecord::Migration[6.0]
  def change
    rename_column :words, :value, :content
  end
end
