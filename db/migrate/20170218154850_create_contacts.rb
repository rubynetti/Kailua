class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :surname
      t.string :contact
      t.date :birthdate
      t.string :tel
      t.string :birth_place
      t.string :residence_place
      t.string :birth_place

      t.timestamps
    end
  end
end
