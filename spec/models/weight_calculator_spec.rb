describe WeightCalculator do
  let(:response) {
    [
      {
        "id"=>8998050,
        "name"=>"Get to Work in 5 Simple Steps",
        "extension"=>"pdf",
        "version"=>1,
        "size"=>2850957,
        "created_at"=>"2014-05-23T16:58:51Z",
        "updated_at"=>"2014-05-23T16:58:51Z",
        "creator"=>
        {
          "name"=>"Alex",
          "email"=>"test@test.com",
          "uuid"=>"27dbed06-ebe5-46b0-9499-449f2f50d3a6"
        },
        "url"=>"https://my.workshare.com/decks/8998050",
        "access_token"=>"token",
        "first_page_url"=>"https://my.workshare.com/images/icons/medium/pdf.png",
        "folder_id"=>647688
      },
      {
        "id"=>8998051,
        "name"=>"Workshare for iPhone and iPad",
        "extension"=>"pdf",
        "version"=>1,
        "size"=>1858008,
        "created_at"=>"2014-05-23T16:58:51Z",
        "updated_at"=>"2014-05-23T16:58:52Z",
        "creator"=>
        {
          "name"=>"Alex",
          "email"=>"test@test.com",
          "uuid"=>"27dbed06-ebe5-46b0-9499-449f2f50d3a6"
        },
        "url"=>"https://my.workshare.com/decks/8998051",
        "access_token"=>"token",
        "first_page_url"=>"https://my.workshare.com/images/icons/medium/pdf.png",
        "folder_id"=>647688
      },
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
    ]
  }

  subject { WeightCalculator.new(response) }
  describe "#files" do
    it do
      expect(subject.files[0]).to be_a(FileData)
    end
  end


end
