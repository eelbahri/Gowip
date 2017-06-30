class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
      remove_column :messages, :category_id
  end
end
