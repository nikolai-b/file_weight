class WeightCalculator

  def initialize(api_response)
    @api_response = api_response
  end

  def files
    @api_response.map do |file|
      FileData.new(file)
    end
  end

  def per_type
    categories = files.each_with_object({}) do |file, categories|
      categories[file.type] = file.size_in_MB * weights[file.type]
    end

    round_to(categories, 0.05)
  end

  private

  def round_to(hash, round_to)
    hash.each {|k,v| hash[k] = (( v / round_to).ceil * round_to).round(5) } #final round(5) to stop tuncate results like 0.0000001
  end

  def weights
    weights = Hash.new(1)
    weights["document"] = 1.1
    weights["video"] = 1.4
    weights["audio"] = 1.2
    weights
  end
end
