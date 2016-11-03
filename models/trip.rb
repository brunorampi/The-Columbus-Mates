class Trip < ActiveRecord::Base
  # validates :name, length: { minimum: 2 }

  belongs_to :user
  belongs_to :trip_type

end
