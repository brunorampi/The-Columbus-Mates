class Trip < ActiveRecord::Base
  # validates :name, length: { minimum: 2 }

  has_many :users_trips
  has_many :users, through: :users_trips
  belongs_to :trip_type
  belongs_to :host_user, class_name: "User", foreign_key: "user_id"
  belongs_to :user

end
