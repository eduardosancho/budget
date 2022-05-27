class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.integer :operations_counter, :default => 0

      t.timestamps
    end
  end
end
