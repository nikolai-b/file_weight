class Category
  attr_reader :quantity, :additional_weight, :size

  def initialize(size, additional_weight, quantity)
    @size = size
    @additional_weight = additional_weight
    @quantity = quantity
  end

  def +(other)
    if other
      @size += other.size
      @additional_weight += other.additional_weight
      @quantity += other.quantity
    end
    self
  end

  def weight(round_to = 0.05)
    (((@additional_weight + @size) / round_to).ceil * round_to).round(5)  #final round(5) to stop tuncate results like 0.0000001
  end

  def ==(other)
    @size == other.size && @quantity == other.quantity && @additional_weight == other.additional_weight
  end

end
