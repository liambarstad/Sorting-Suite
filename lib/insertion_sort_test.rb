require 'minitest/autorun'
require 'minitest/emoji'
require './lib/insertion_sort.rb'

class InsertionSortTest < Minitest::Test
  def test_result_array_begins_empty
    insertion = InsertionSort.new([1, 5, 3, 2])
    assert insertion.result.empty?
  end

  def test_it_can_place_an_element
    insertion = InsertionSort.new([1, 5, 3, 2])
    insertion.result = [1, 2, 3, 5]
    insertion.place(4)
    assert_equal [1, 2, 3, 4, 5], insertion.result
  end

  def test_it_can_place_an_element_max
    insertion = InsertionSort.new([1, 5, 3, 2])
    insertion.result = [1, 2, 3, 4]
    insertion.place(5)
    assert_equal [1, 2, 3, 4, 5], insertion.result
  end

  def test_it_can_sort
    insertion = InsertionSort.new([1, 5, 3, 2])
    assert_equal [1, 2, 3, 5], insertion.sort
  end
end
