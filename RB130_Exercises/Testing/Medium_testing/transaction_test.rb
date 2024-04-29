require 'minitest/autorun'
require_relative 'transaction'
require 'stringio'

class TransactionTest < Minitest::Test
  def setup
    @trans = Transaction.new 50
  end

  def test_prompt_for_payment
    # prompt for payment
    # check if amount paid is set correctly it is greater than or equal to item cost which is 50
    input = StringIO.new("60\n")
    output = StringIO.new
    @trans.prompt_for_payment(input: input, output: output)
    assert_equal(60.0, @trans.amount_paid)
  end
end