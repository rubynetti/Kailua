class CreateSocios < ActiveRecord::Migration[5.0]
  def change
    create_table :socios do |t|
      t.string :name
      t.string :surname
      t.string :contact
      t.string :cf
      t.integer :number
      t.boolean :complete

      t.timestamps
    end
  end
end
