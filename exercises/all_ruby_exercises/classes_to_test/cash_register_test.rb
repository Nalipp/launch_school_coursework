require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(30)
    transaction.amount_paid = 40

    assert_equal 10, register.change(transaction)
  end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end
