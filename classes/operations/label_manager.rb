require_relative '../structure/label'
require_relative '../../module/data_operations'

class LabelManager
  include DataOperations

  attr_accessor :label_data

  def initialize
    @label_data = fetch_data('label')
  end

  def create_label
    puts 'Enter the title of the label:'
    title = gets.chomp
    puts 'Enter the color of the label'
    color = gets.chomp
    new_label = Label.new(title, color)
    @label_data << new_label.to_hash
    update_data('label', new_label.to_hash)
    new_label
  end

  def list_labels
    @label_data.each_with_index do |label, index|
      puts "(#{index}) #{label['id']} - #{label['title']} - #{label['color']})"
    end

    puts "(#{@label_data.length}) - Create a new label"
  end

  def format_label(hashed_label)
    label = Label.new(hashed_label['title'], hashed_label['color'])
    label.id = hashed_label['id']
    label
  end
end
