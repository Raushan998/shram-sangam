ActiveAdmin.register Worker do
  # Permit the necessary parameters
  permit_params :name, :phone_number, :country_code, :addr1, :addr2, :city,
                :pincode, :state, :country, :email, :description, :work_type

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

  filter :name
  filter :phone_number
  filter :email
  filter :city
  filter :state
  filter :pincode
  filter :work_type, as: :select, collection: Worker.work_types.keys.map { |key| [key.titleize, key] }
  filter :created_at

  form do |f|
    f.inputs "Worker Details" do
      f.input :name
      f.input :phone_number
      f.input :country_code, input_html: { value: f.object.country_code.presence || '+91' }
      f.input :email
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

  action_item :import_csv, only: :index do
    link_to 'Import CSV', action: 'import_csv'
  end

  collection_action :import_csv, method: :get do
    render 'admin/csv_import'
  end

  collection_action :upload_csv, method: :post do
    require 'csv'
    if params[:csv_file].present?
      csv_file = params[:csv_file].tempfile
      begin
        ActiveRecord::Base.transaction do
          CSV.foreach(csv_file, headers: true) do |row|
            worker_params = row.to_hash.slice(
              "name", "phone_number", "country_code", "addr1", "addr2",
              "city", "pincode", "state", "country", "email", "description", "work_type"
            )
            Worker.create!(worker_params)
          end
        end
        redirect_to admin_workers_path, notice: "CSV imported successfully!"
      rescue => e
        redirect_to admin_workers_path, alert: "Import failed: #{e.message}"
      end
    else
      redirect_to admin_workers_path, alert: "Please attach a CSV file."
    end
  end  
end
