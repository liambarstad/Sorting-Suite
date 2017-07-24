require 'minitest/autorun'
require 'minitest/pride'
require './lib/selection_sort'

class SelectionSortTest < Minitest::Test
  def test_it_can_sort
    selection = SelectionSort.new([9, 3, 6, 1, 2])
    assert_equal [1, 2, 3, 6, 9], selection.sort
  end
end
