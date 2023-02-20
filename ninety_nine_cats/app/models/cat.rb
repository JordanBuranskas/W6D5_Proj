require "action_view"


class Cats < ApplicationRecord 

include ActionView::Helpers::DateHelper

    

    validates :birthdate, :color, :name, :sex, presence: true
    validate :birthdate_cannot_be_future  
    validates :color, inclusion: { in: (CAT_COLORS), message: "%{value} is not a valid cat color" }
    validates :sex, inclusion: { in: %w(M, F), message: "%{value} is not a valid gender" }
    #%w allows us to collect elements and makes them an array
    #if there is a method that exists below for the validation it is "validate" (singular), otherwise "validates"(plural)


    CAT_COLORS = ["brown", "white", "purple"]

    def age

        time_ago_in_words(birthdate)

    end


    def birthdate_cannot_be_future
        if  birthdate > Date.today
            errors.add(:birthdate, "can't be in the future")
        end

    end

    def age 

    end

end