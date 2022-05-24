class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :name
      t.integer :amount, :default => 0

      t.timestamps
    end
  end
end
