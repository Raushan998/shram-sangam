class Worker < ApplicationRecord
    enum :work_type, { plumber: 0, electrician: 1, labor: 2, mason: 3, carpenter: 4 }
    def self.ransackable_attributes(auth_object = nil)
        ["addr1", "addr2", "city", "country", "country_code", "created_at", "description", "email", "id", "id_value", "name", "phone_number", "pincode", "state", "updated_at", "work_type"]
    end
    def self.ransackable_associations(auth_object = nil)
        []
    end
end
