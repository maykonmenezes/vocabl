class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.integer :good_answers_count, default: 0
      t.integer :bad_answers_count, default: 0

      t.timestamps
    end
  end
end
