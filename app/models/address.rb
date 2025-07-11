class Address < ApplicationRecord
    with_options presence: true do
        validates :street
        validates :city
        validates :state
        validates :postal_code
        validates :country
    end
    belongs_to :addressable, polymorphic: true
end
