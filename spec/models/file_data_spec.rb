describe FileData do
  let(:input_file_hash) {
    {
      "id"=>8998049,
      "name"=>"Workshare for mobile",
      "extension"=>"mp4",
      "version"=>1,
      "size"=>59245396,
      "created_at"=>"2014-05-23T16:58:50Z",
      "updated_at"=>"2014-05-23T16:58:50Z",
      "creator"=>
      {
        "name"=>"Alex",
        "email"=>"test@test.com",
        "uuid"=>"27dbed06-ebe5-46b0-9499-449f2f50d3a6"
      },
      "url"=>"https://my.workshare.com/decks/8",
      "access_token"=>"token",
      "first_page_url"=>"https://my.workshare.com/images/icons/medium/unknown.png",
      "folder_id"=>647688
    }
  }
  subject { FileData.new(input_file_hash) }

  it "#name" do
    expect(subject.name).to eq("Workshare for mobile")
  end

  it "#type" do
    expect(subject.type).to eq("video")
  end

  it "#size_in_MB" do
    expect(subject.size_in_MB).to be_within(0.05).of(56.5008)
  end

  context "with a odt extention" do
    let(:document_input_hash) { {"extension"=>"odt"} }
    subject { FileData.new(document_input_hash) }

    it "has document type" do
      expect(subject.type).to eq("document")
    end

  end

  context "with a bin extention" do
    let(:document_input_hash) { {"extension"=>"bin"} }
    subject { FileData.new(document_input_hash) }

    it "has binary type" do
      expect(subject.type).to eq("binary")
    end

  end

end
