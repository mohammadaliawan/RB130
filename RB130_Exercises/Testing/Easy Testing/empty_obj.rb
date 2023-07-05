require 'minitest/autorun'

class MixTests < Minitest::Test

  def test_empty
    list = [1,2,3]
    assert_empty(list, 'the list is not empty')
  end
end