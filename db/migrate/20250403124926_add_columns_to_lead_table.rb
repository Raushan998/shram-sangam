class AddColumnsToLeadTable < ActiveRecord::Migration[7.2]
  def change
    add_column :leads, :name, :string
    add_column :leads, :message, :text
  end
end
