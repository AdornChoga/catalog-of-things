require 'date'

class Item
    attr_reader :id, :archived
    attr_accessor :publish_date
    def initialize(publish_date, archived)
        @id = rand(1..100)
        @publish_date = Date.parse(publish_date)
        @archived = archived
    end
    
    def can_be_archived?
        date_published = publish_date.year
        date_now = Date.today.year
        num_of_years = date_now - date_published
        return true unless num_of_years < 10
        false
    end

    private :can_be_archived?
end