class RenameColumnEndToEndDate < ActiveRecord::Migration[5.0]
  def change
    rename_column :balances, :start, :start_date
    rename_column :balances, :end,   :end_date
  end
end
