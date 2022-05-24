class AddUserRefToOperations < ActiveRecord::Migration[7.0]
  def change
    add_reference :operations, :author, null: false, index: true
    add_foreign_key :operations, :users, column: :author_id, on_delete: :cascade
  end
end
