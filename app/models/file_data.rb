class FileData
  attr_reader :name

  MEGABYTE = 1024.0 * 1024.0
  DOCUMENT_EXTENTIONS = %w(doc docx xls ods fodt odb odt rtf docm docx dotx dotm xlt xlm xlsc) #not exhustive

  def initialize(api_file_response)
    @name = api_file_response["name"]
    @extension = api_file_response["extension"]
    @size = api_file_response["size"]
  end

  def type
    mediatype = MimeMagic.by_extension(@extension).mediatype
    if mediatype == "application"
      if DOCUMENT_EXTENTIONS.include?(@extension)
        mediatype = 'document'
      end
      if @extension == 'bin'
        mediatype = 'binary'
      end
    end

    mediatype
  end

  def size_in_MB
    @size / MEGABYTE
  end

end
