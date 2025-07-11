class Work < ApplicationRecord
    with_options presence: true do
        validates :contact_person_name
        validates :contact_person_phone_number
        validates :title
        validates :category
        validates :work_type
        validates :budget_type
        validates :post_visibility
      end
      
    validates :budget_amount, numericality: { greater_than: 0 }      
    has_many :addresses, as: :addressable, dependent: :destroy
    accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank
    enum :budget_type, {
        "Fixed": 0,
        "Hourly": 1
    }
    enum :work_type, {
        "Full Time": 0,
        "Part Time": 1,
        "Project Based": 2
    }
    enum :category, {
        "Plumbing": 0,
        "Electrician": 1,
        "Labor": 2,
        "Mason": 3,
        "Carpenter": 4,
        "Building Contractor": 5,
        "Painter": 6,
        "Civil Contractor": 7,
        "Tile Contractor": 8,
        "Painting Contractor": 9,
        "Plumbing Contractor": 10
    }

    enum :post_visibility, {
        "Business": 0,
        "Worker": 1,
        "Both": 2
    }

    def self.ransackable_attributes(auth_object = nil)
        [
            "title",
            "budget_type",
            "budget_amount",
            "work_type",
            "category",
            "created_at",
            "updated_at"
        ]
    end
end
