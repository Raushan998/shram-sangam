class CreateWorkers < ActiveRecord::Migration[7.2]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :phone_number
      t.string :country_code, default: "+91"
      t.string :addr1
      t.string :addr2
      t.string :city
      t.string :pincode
      t.string :state
      t.string :country
      t.string :email
      t.text :description
      t.integer :work_type
      
      t.timestamps
      t.index :phone_number
      t.index :email
      t.index :city
      t.index :pincode
      t.index :state
      t.index :work_type
    end
  end
end
