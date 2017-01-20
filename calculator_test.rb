#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'calculator'

class CalculatorTest < Minitest::Test

  def test_one_plus_one
    math = "1 plus 1"
    assert_equal 2, Calculator.compute(math)
  end

  def test_addition
    math = "3 plus 4"
    assert_equal 7, Calculator.compute(math)
  end

  def test_addition_2
    math = "5 plus 7"
    assert_equal 12, Calculator.compute(math)
  end

  def test_two_times_two
    math = "2 times 2"
    assert_equal 4, Calculator.compute(math)
  end

  def test_multiple_operations
    math = "2 times ( 1 plus 2 )"
    assert_equal 6, Calculator.compute(math)
  end

end
