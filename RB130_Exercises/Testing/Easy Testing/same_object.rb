require 'minitest/autorun'

class MixTests < Minitest::Test

  def test_same_obj
  list = [1,2,3]
  assert_same(list, list.process)
  end
end