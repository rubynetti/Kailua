class CreateOutcomes < ActiveRecord::Migration[5.0]
  def change
    create_table :outcomes do |t|
      t.text :description
      t.date :date_of_transaction

      t.timestamps
    end

        add_money :outcomes, :price

  end
end
