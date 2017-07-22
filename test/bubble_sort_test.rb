require 'minitest/autorun'
require 'minitest/emoji'
require './lib/bubble_sort.rb'

class BubbleSortTest < Minitest::Test
  def test_previous_starts_at_index_0
    bubble = BubbleSort.new([1, 4, 3])
    assert_equal 1, bubble.prev
  end

  def test_current_starts_at_index_1
    bubble = BubbleSort.new([1, 4, 3])
    assert_equal 4, bubble.current
  end

  def test_can_compare_values
    bubble = BubbleSort.new([1, 4, 3])
    assert_equal 4, bubble.compare(4, 3)
  end

  def test_it_can_get_next_values
    bubble = BubbleSort.new([1, 4, 3])
    bubble.next_values
    assert_equal 4, bubble.prev
    assert_equal 3, bubble.current
  end

  def test_it_can_switch_values
    bubble = BubbleSort.new([1, 4, 3])
    bubble.switch
    assert_equal [4, 1, 3], bubble.array
  end

  def test_it_can_sort
    bubble = BubbleSort.new([1, 4, 3])
    assert_equal [1, 3, 4], bubble.sort
  end
end
