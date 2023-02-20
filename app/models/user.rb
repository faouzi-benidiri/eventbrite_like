class User < ApplicationRecord
    has_many :events, class_name: "Event"
    has_many :attendances
    has_many :events, through: :attendencies
end
