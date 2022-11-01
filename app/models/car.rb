class Car < ApplicationRecord
    belongs_to :dealership
    belongs_to :user
    before_save :depreciate

    def depreciate
        curr_year = Time.new.year
        depreciation = self.model < curr_year ? self.price * (((curr_year - self.model - 1)*12*0.02)+(Time.new.month*0.02)) :  0
        self.depreciation = depreciation < self.price ? depreciation : self.price
    end
end
