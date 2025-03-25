class Lead < ApplicationRecord
    validates :phone_number, presence: true, uniqueness: true

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "phone_number", "updated_at"]
      end
end
