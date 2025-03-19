ActiveAdmin.register Worker do
  # Permit the necessary parameters
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
      worker.work_type.titleize
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
  filter :work_type, as: :select, collection: Worker.work_types.keys.map { |key| [key.titleize, key] }
  filter :created_at

  # Customize the form for creating/editing
  form do |f|
    f.inputs "Worker Details" do
      f.input :name
      f.input :phone_number
      f.input :country_code, input_html: { value: f.object.country_code.presence || '+91' }
      f.input :email
      # Use enum keys instead of integer values so Rails receives "electrician" rather than "1"
      f.input :work_type, as: :select, collection: Worker.work_types.keys.map { |key| [key.titleize, key] }
      f.input :description, as: :text
    end

    f.inputs "Address" do
      f.input :addr1
      f.input :addr2
      f.input :city
      f.input :pincode
      f.input :state
      f.input :country, input_html: { value: f.object.country.presence || 'India' }
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
        worker.work_type.titleize
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

  action_item :import, only: :index do
    link_to 'Import Workers', import_admin_workers_path
  end
  
  collection_action :import, method: [:get, :post] do
    if request.post?
      if params[:file].present?
        flash[:notice] = "Successfully imported workers."
      else
        flash[:error] = "Please select a file to import."
      end
      
      redirect_to admin_workers_path
    end
  end
  
end
