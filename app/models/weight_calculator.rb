class WeightCalculator

  def initialize(api_response)
    @api_response = api_response
  end

  def files
    @api_response.map do |file|
      FileData.new(file)
    end
  end

  def categorys
    weight_and_quantity = {}

    files.each do |file|
      size = file.size_in_MB
      additional_weight =  size * weights[file.type]

      weight_and_quantity[file.type] = file.size_in_MB * weights[file.type]Category.new(size, additional_weight, 1) + weight_and_quantity[file.type]
    end

    weight_and_quantity
  end

  def total_additional_weight
    categorys.inject(0) {|sum, ca| sum += ca[1].additional_weight}
  end

  def total_weight
    categorys.inject(0) {|sum, ca| sum += ca[1].weight}
  end

  private

  def weights
    weights = Hash.new(0)
    weights["document"] = 0.1
    weights["video"] = 0.4
    weights["audio"] = 0.2
    weights
  end
end
