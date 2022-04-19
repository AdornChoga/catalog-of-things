require './classes/structure/item'
require './classes/structure/book'

describe Book do
  context 'Tests for the book class' do
    book = Book.new('Jos', 'good', '2020/1/1')
    book2 = Book.new('test_publisher', 'bad', '2020-1-1')
    book3 = Book.new('test_publisher', 'good', '2010-1-1')

    it 'is an instance of class Item' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'returns the correct result to the can_be_archived method' do
      expect(book.can_be_archived?).to be(false)
      expect(book2.can_be_archived?).to be(true)
      expect(book3.can_be_archived?).to be(true)
    end

    it 'archive status changes based on the move_to_archive method' do
      book.move_to_archive
      book2.move_to_archive
      book3.move_to_archive
      expect(book.archived).to be(true)
      expect(book2.archived).to be(true)
      expect(book3.archived).to be(true)
    end
  end
end
