require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @trans = Transaction.new 120
    @cashreg = CashRegister.new 200
    @trans.amount_paid = 150
  end

  def test_accept_money
    @cashreg.accept_money(@trans)
    assert_equal(350, @cashreg.total_money)
  end

  def test_change
    assert_equal(30, @cashreg.change(@trans))
  end

  def test_give_receipt
    assert_output("You've paid $120.\n") { @cashreg.give_receipt(@trans)}
  end

end