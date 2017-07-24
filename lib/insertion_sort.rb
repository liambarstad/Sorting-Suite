class InsertionSort
  attr_accessor :result
  def initialize(array)
    @array = array
    @result = []
  end

  def place(element)
    index = 0
    stop = false
    while index < @result.size && stop == false
      if index == (@result.size - 1)  && element > @result[index]
        @result.push(element)
        stop = true
      elsif element < @result[index]
        @result.insert(index, element)
        stop = true
      end
      index += 1
      # binding.pry
    end
  end

  def sort
    @result << @array.shift
    until @array.empty?
      element = @array.shift
      place(element)
    end
    @result
  end
end
