class Room < ApplicationRecord
    mount_uploader :room_img, ImageUploader

    belongs_to :user, optional: true
    has_many :reservations
  
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99999999}
    validates :address, presence: true


    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "description", "id", "name", "price", "room_img", "start_date", "updated_at", "user_idr"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["reservations", "user"]
      end

end
