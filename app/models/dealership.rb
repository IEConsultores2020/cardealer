class Dealership < ApplicationRecord
    belongs_to :user
    has_many :cars, dependent: :destroy
end
