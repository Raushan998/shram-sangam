class Business < ApplicationRecord
    enum :business_type, { 
        plumbing: 0,
        electrical: 1,
        construction: 2,
        carpentry: 3,
        painting: 4,
        home_decor: 5
    }
    
    def self.ransackable_attributes(auth_object = nil)
        %w[business_name business_type business_description city state pincode phone_number email_address]
    end
end
