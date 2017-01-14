class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.text :description
      t.date :date_of_transaction
      t.timestamps
    end

    add_money :incomes, :price

  end
end
