class CreateWorks < ActiveRecord::Migration[7.2]
  def change
    create_table :works do |t|
      t.text :title
      t.text :description
      t.integer :budget_type
      t.float :budget_amount
      t.integer :work_type
      t.integer :category
      t.integer :post_visibility
      t.integer :required_workers
      t.string :contact_person_name
      t.string :contact_person_phone_number
      t.timestamps
    end
  end
end
