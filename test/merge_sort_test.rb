require 'minitest/autorun'
require 'minitest/pride'
require './lib/merge_sort'

class MergeSortTest < Minitest::Test
  def test_split_into_arrays
    merge = MergeSort.new([1, 5, 3, 2])
    merge.split
    assert_equal [[1, 5], [3, 2]], merge.result
  end

  def test_split_into_arrays_odd_number
    merge = MergeSort.new([1, 5, 3, 6, 2])
    merge.split
    assert_equal [[1, 5], [3, 6], [2]], merge.result
  end

  def test_it_can_sort_initial_arrays
    merge = MergeSort.new([1, 5, 3, 2])
    merge.split
    merge.sort_init
    assert_equal [[1, 5], [2, 3]], merge.result
  end

  def test_compare
    merge = MergeSort.new([1, 5, 2, 3, 7])
    arr = [1, 5]
    index = merge.compare(arr, 2, -1)
    assert_equal [1, 2, 5], arr
    assert_equal 0, index
  end

  def test_sort_two
    merge = MergeSort.new([1, 5, 3, 2, 7, 4, 10])
    merge.split
    merge.sort_init
    assert_equal [1, 2, 3, 5], merge.sort_two(merge.result[0], merge.result[1])
  end

  def test_it_will_compare_arrays
    merge = MergeSort.new([1, 5, 3, 2, 7, 4, 10])
    merge.split
    merge.sort_init
    merge.merge
    assert_equal [[1, 2, 3, 5], [4, 7, 10]], merge.result
  end

  def test_it_will_compare_arrays_duplicates
    merge = MergeSort.new([3, 7, 5, 2, 10, 23, 5, 2, 3])
    merge.split
    merge.sort_init
    merge.merge
    assert_equal [[2, 3, 5, 7], [2, 5, 10, 23], [3]], merge.result
  end

  def test_it_can_sort
    merge = MergeSort.new([1, 5, 3, 2, 10, 7, 4])
    assert_equal [1, 2, 3, 4, 5, 7, 10], merge.sort
  end

  def test_it_can_sort_duplicates
    merge = MergeSort.new([3, 7, 5, 2, 10, 23, 5, 2, 3])
    assert_equal [2, 2, 3, 3, 5, 5, 7, 10, 23], merge.sort
  end
end
