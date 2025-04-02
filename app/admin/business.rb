ActiveAdmin.register Business do
    # Permit the parameters that can be modified through the admin interface
    permit_params :business_name, :business_type, :business_description, :addr1, :add2,
                  :city, :state, :pincode, :phone_number, :country_code, :country,
                  :email_address, :website_url
  
    # Customize the index page
    index do
      selectable_column
      id_column
      column :business_name
      column :business_type do |business|
        business.business_type.titleize
      end
      column :city
      column :state
      column :phone_number
      column :email_address
      actions
    end
  
    # Add filters for searching
    filter :business_name
    filter :business_type, as: :select, collection: Business.business_types.keys
    filter :city
    filter :state
    filter :pincode
    filter :phone_number
    filter :email_address
  
    # Customize the form
    form do |f|
      f.inputs do
        f.input :business_name
        f.input :business_type, as: :select, collection: Business.business_types.keys
        f.input :business_description
        f.input :addr1, label: 'Address Line 1'
        f.input :add2, label: 'Address Line 2'
        f.input :city
        f.input :state
        f.input :pincode
        f.input :phone_number
        f.input :country_code, input_html: { value: f.object.country_code || '+91' }
        f.input :country, as: :string, input_html: { value: f.object.country.presence || 'India' }
        f.input :email_address
        f.input :website_url
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
        row :website_url
        row :business_type do |business|
          business.business_type.titleize
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
  end
  