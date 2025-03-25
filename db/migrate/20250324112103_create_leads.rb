class CreateLeads < ActiveRecord::Migration[7.2]
  def change
    create_table :leads do |t|
      t.string :phone_number
      t.string :country_code, default: "+91"

      t.timestamps
    end
  end
end
