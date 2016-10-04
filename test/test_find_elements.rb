require "minitest/autorun"
require '../find_elements'

class TestFindElements < Minitest::Test
  def test_find_correct_elements
    assert_equal(FindElements.find_elements_for_number([1,5,0,2,6,8], 14), [1,5,8])
  end

  def test_find_float_elements
    assert_equal(FindElements.find_elements_for_number([0.5,10,2,1,6], 3.5), [0.5,2,1])
  end

  def test_wrong_number_of_arguments
    assert_raises do
      assert_equal(FindElements.find_elements_for_number([1,2], 3))
    end
  end

  def test_trivial_search
    assert_equal(FindElements.find_elements_for_number([1,2,3], 6), [1,2,3])
  end

  def test_element_not_found
    assert_nil(FindElements.find_elements_for_number([0.5,10,2,1,6], 20))
  end

  def test_has_wrong_values
    assert_raises RuntimeError do
      FindElements.find_elements_for_number([10, "", nil], 20)
    end
  end
end
