class Home < ApplicationRecord::Base
  belongs_to :user

  validates :home_type, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :summary, presence: true, length {maximum: 500}
  validates :address, presence: true
  validates :home_type, presence: true
  validates :is_furnished, presence: true
  validates :is_ready, presence: true
end
