class CreateBusinesses < ActiveRecord::Migration[7.2]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.integer :business_type
      t.text :business_description
      t.string :addr1
      t.string :add2
      t.string :city
      t.string :state
      t.string :pincode
      t.string :phone_number
      t.string :country_code, default: "+91"
      t.string :country
      t.string :email_address
      t.string :website_url

      t.timestamps
    end
  end
end
