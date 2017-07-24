class SelectionSort
  attr_reader :result
  def initialize(array)
    @array = array
    @result = []
  end

  def sort
    until @array.empty?
      minimum = @array[0]
      index = 0
      minimum_index = 0
      @array.map do |num|
        if num <= minimum
          minimum = num
          minimum_index = index
        end
        index += 1
      end
      @result << @array.slice!(minimum_index)
    end
    return @result
  end
end
