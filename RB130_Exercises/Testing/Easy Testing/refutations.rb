require 'minitest/autorun'

class MixTests < Minitest::Test

  def test_does_not_include
    list = [1,2,3, ]
    assert(true)
    refute_includes list, 'xyz'
  end
end