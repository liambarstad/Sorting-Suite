class BubbleSort
  attr_reader :array, :prev, :current
  def initialize(array)
    @array = array
    @prev = @array[0]
    @index = 1
    @current = @array[1]
  end

  def compare(value_1, value_2)
    if value_1 > value_2
      value_1
    else
      value_2
    end
  end

  def next_values
    @index += 1
    @current = @array[@index]
    @prev = @array[@index - 1]
  end

  def switch
    @array[@index - 1] = @current
    @array[@index] = @prev
  end

  def sort
    while @index < @array.size
      greater_value = compare(@prev, @current)
      if greater_value == @prev
        switch
      end
      next_values
    end
    @array
  end
end
