class AddCountryToFormations < ActiveRecord::Migration
  def change
    add_column :formations, :country, :string
  end
end
