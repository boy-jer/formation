class AddAttributesToPages < ActiveRecord::Migration
  def change
    add_column :pages, :src, :string
    add_column :pages, :amount, :float
  end
end
