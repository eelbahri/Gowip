class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :content
    #   t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
