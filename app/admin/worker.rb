# app/admin/workers.rb

ActiveAdmin.register Worker do
    # Permit all parameters for simplicity
    permit_params :name, :phone_number, :country_code, :addr1, :addr2, :city, 
                  :pincode, :state, :country, :email, :description, :work_type
  
    # Customize the index page (listing)
    index do
      selectable_column
      id_column
      column :name
      column :phone_number
      column :city
      column :state
      column :work_type do |worker|
        work_types = { plumber: 0, electrician: 1, labor: 2, mason: 3, carpenter: 4 }
        work_types[worker.work_type] || "Unknown"
      end
      column :created_at
      actions
    end
  
    # Customize the filters on the index page
    filter :name
    filter :phone_number
    filter :email
    filter :city
    filter :state
    filter :pincode
    filter :work_type, as: :select, collection: {
      "Electrician" => 1,
      "Plumber" => 2,
      "Carpenter" => 3,
      "Painter" => 4
    }
    filter :created_at
  
    # Customize the form for creating/editing
    form do |f|
      f.inputs "Worker Details" do
        f.input :name
        f.input :phone_number
        f.input :country_code, input_html: { value: f.object.country_code || '+91' }
        f.input :email
        f.input :work_type, as: :select, collection: {
          "Electrician" => 1,
          "Plumber" => 2,
          "Carpenter" => 3,
          "Painter" => 4
        }
        f.input :description, as: :text
      end
  
      f.inputs "Address" do
        f.input :addr1
        f.input :addr2
        f.input :city
        f.input :pincode
        f.input :state
        f.input :country, input_html: { value: f.object.country || 'India' }
      end
      
      f.actions
    end
  
    # Customize the show page
    show do
      attributes_table do
        row :id
        row :name
        row :phone_number
        row :country_code
        row :email
        row :work_type do |worker|
          work_types = {
            1 => "Electrician",
            2 => "Plumber",
            3 => "Carpenter",
            4 => "Painter"
          }
          work_types[worker.work_type] || "Unknown"
        end
        row :description
        row :addr1
        row :addr2
        row :city
        row :pincode
        row :state
        row :country
        row :created_at
        row :updated_at
      end
    end
  
    # Optionally add custom actions or behavior
    action_item :view, only: :show do
      link_to 'View on Site', '#', target: '_blank' if worker.id
    end
  
    # Add a batch action if needed
    batch_action :mark_as_verified do |ids|
      batch_action_collection.find(ids).each do |worker|
        # If you had a verified field, you would update it here
        # worker.update(verified: true)
        # For demonstration only
      end
      redirect_to collection_path, notice: "Workers have been marked as verified."
    end
  end