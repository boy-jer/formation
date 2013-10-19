class CreateFormations < ActiveRecord::Migration
  def change
    create_table :formations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :bank_account
      t.string :routing_number
      t.string :src
      t.float :amount

      t.timestamps
    end
  end
end
