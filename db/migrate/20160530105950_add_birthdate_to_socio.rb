class AddBirthdateToSocio < ActiveRecord::Migration[5.0]
  def change
    add_column :socios, :birthdate, :date
    add_column :socios, :tel, :string
    add_column :socios, :registration_date, :date
    drop_table :socis
  end
end
