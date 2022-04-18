require 'json'

module DataOperations
  def fetch_data(file)
    file = "./data/#{file}.json"
    File.new(file, 'a+') unless File.exist?(file)
    File.write(file, '[]') if File.empty?(file)
    JSON.parse(File.read(file))
  end

  def update_data(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    stored_data = fetch_data(file)
    stored_data << data
    json_data = JSON.generate(stored_data, opts)
    path = "./data/#{file}.json"
    File.write(path, json_data)
  end
end
