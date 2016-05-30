class AddResidencePlaceToSocio < ActiveRecord::Migration[5.0]
  def change
    add_column :socios, :residence_place, :string
    add_column :socios, :birth_place, :string
  end
end
