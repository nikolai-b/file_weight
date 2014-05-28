class WeightCalculator
  def initialize(api_response)
    @api_response = api_response
  end

  def files
    @api_response.map do |file|
      FileData.new(file)
    end
  end

end
