
class Genre
    attr_reader :items, :id
    attr_accessor :name
    def initialize(name)
        @id = rand(50...500)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item
        item.genre = self
    end
end
