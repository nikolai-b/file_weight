class FileData
  attr_reader :name

  MEGABYTE = 1024.0 * 1024.0

  def initialize(api_file_response)
    @name = api_file_response["name"]
    @extension = api_file_response["extension"]
    @size = api_file_response["size"]
  end

  def type
    MimeMagic.by_extension(@extension).mediatype
  end

  def size_in_MB
    @size / MEGABYTE
  end

end
