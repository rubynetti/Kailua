class CreateSocis < ActiveRecord::Migration[5.0]
  def change
    create_table :socis do |t|
      t.text :nome
      t.text :cognome
      t.text :contatto
      t.text :cf
      t.text :numero_tessera
      t.boolean :da_rinnovare

      t.timestamps
    end
  end
end
