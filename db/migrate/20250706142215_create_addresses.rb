class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :landmark
      t.string :street
      t.string :state
      t.string :country
      t.string :postal_code
      t.references :addressable, polymorphic: true, null: false, index: true
      t.timestamps
    end

    add_index :addresses, %i[country city]
  end
end
