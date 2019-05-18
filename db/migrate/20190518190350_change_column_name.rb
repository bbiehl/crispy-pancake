class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :price, :price_cents
  end
end
