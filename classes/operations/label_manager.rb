require_relative '../structure/label'
require_relative '../../module/data_operations'

class LabelManager
  include DataOperations

  attr_accessor :label_data

  def initialize
    @label_data = fetch_data('label')
  end

  def create_label
    state = false

    until state

      puts 'Please enter the label title:'
      title = gets.chomp.to_s
      state = true unless title == ''
      puts 'Label title Required' unless state == true
      title
    end

    puts 'Enter the color of the label'
    color = gets.chomp

    new_label = Label.new(title, color)

    @label_data << new_label.to_hash

    update_data('label', new_label.to_hash)
    new_label
  end

  def list_labels
    @label_data.each_with_index do |label, index|
      puts '---------------------'
      puts "(#{index}) #{label['id']} - #{label['title']} - #{label['color']})"
      puts '---------------------'
    end

    puts "(#{@label_data.length}) - Create a new label"
  end

  def format_label(hashed_label)
    label = Label.new(hashed_label['title'])
    label.id = hashed_label['id']
    label
  end

  def update_label_file(index, book)
    @label_data = fetch_data('label')
    album_hash = book.to_hash.reject! { |k, _| k == 'label' }
    album_hash['label_title'] = @label_data[index]['title']
    @label_data[index]['items'] << album_hash
    rewrite_data('label', @label_data)
  end
end
