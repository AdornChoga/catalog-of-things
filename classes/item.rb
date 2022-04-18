
class Item
    attr_reader :id, :archived
    attr_accessor :publish_date
    def initialize(publish_date, archived)
        @id = rand(1..100)
        @publish_date = publish_date
        @archived = archived
    end
end