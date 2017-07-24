require 'pry'
class MergeSort
  attr_accessor :result
  def initialize(array)
    @array = array
    @result = []
  end

  def split
    until @array == []
      if @array.length > 1
        @result << @array.slice!(0..1)
      else
        @result << [@array.slice!(0)]
      end
    end
  end

  def sort_init
    @result.map do |pair|
      if pair.length > 1 && pair[0] > pair[1]
        lesser_value = pair[1]
        pair[1] = pair[0]
        pair[0] = lesser_value
      end
    end
  end

  def compare(arr, num, last_index)
    current_index = arr.size - 1
    stop = false
    while current_index >= last_index && stop == false
      if current_index == last_index
        arr.insert((last_index + 1), num)
        stop = true
      elsif num >= arr[current_index]
        arr.insert((current_index + 1), num)
        stop = true
      else
        current_index -= 1
      end
    end
    return current_index
  end

  def sort_two(arr_1, arr_2)
    last_index = -1
    arr_2.each do |num|
      current_index = compare(arr_1, num, last_index)
      last_index = current_index
    end
    return arr_1
  end

  def merge
    merged = []
    until @result.empty?
      if @result.length > 1
        new_arr = @result.slice!(0..1)
        merged << sort_two(new_arr[0], new_arr[1])
        new_arr.clear
      else
        merged << @result.slice!(0)
      end
      # binding.pry
    end
    @result = merged
  end

  def sort
    split
    sort_init
    until @result.length == 1
      merge
    end
    return @result.flatten!
  end
end
