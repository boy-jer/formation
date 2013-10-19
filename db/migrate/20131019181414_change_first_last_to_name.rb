class ChangeFirstLastToName < ActiveRecord::Migration
  def change
  	add_column :formations, :name, :string
  end
end
