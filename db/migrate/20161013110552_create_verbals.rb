class CreateVerbals < ActiveRecord::Migration[5.0]
  def change
    create_table :verbals do |t|
      t.string :title
      t.text :content
      t.date :document_date

      t.timestamps
    end
  end
end
