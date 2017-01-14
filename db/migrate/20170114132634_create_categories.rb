class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    add_column :outcomes, :category_id, :integer
    add_column :incomes, :category_id, :integer
  end
end
