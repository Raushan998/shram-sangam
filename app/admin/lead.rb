ActiveAdmin.register Lead do
    # Permit the necessary parameters
    permit_params :phone_number
  
    index do
      selectable_column
      id_column
      column :phone_number
      column :created_at
      actions
    end
  
    filter :phone_number
  
    form do |f|
      f.inputs "Worker Details" do
        f.input :phone_number
      end
  
      f.inputs "Address" do
        f.input :phone_number
      end
  
      f.actions
    end
  
    show do
      attributes_table do
        row :id
        row :phone_number
      end
    end
end