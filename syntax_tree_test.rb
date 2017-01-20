#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'syntax_tree'

class SyntaxTreeTest < Minitest::Test
  def test_plus
    tree = SyntaxTree.new(root: "plus", left: 3, right: 2)
    assert_equal tree.compute, 5
  end

  def test_plus2
    tree = SyntaxTree.new(root: "plus", left: 1, right: 5)
    assert_equal tree.compute, 6
  end

  def test_times
    tree = SyntaxTree.new(root: "times", left: 3, right: 4)
    assert_equal tree.compute, 12
  end

  def test_times2
    tree = SyntaxTree.new(root: "times", left: 2, right: 5)
    assert_equal tree.compute, 10
  end

  def test_nested_tree
    tree = SyntaxTree.new(root: "plus", left: 3, right: SyntaxTree.new(root: "plus", left: 1, right: 1))
    assert_equal tree.compute, 5
  end

  def test_nested_tree2
    tree = SyntaxTree.new(root: "plus", left: SyntaxTree.new(root: "plus", left: 1, right: 1), right: 3)
    assert_equal tree.compute, 5
  end

  def test_both_nested_trees
    tree = SyntaxTree.new(root: "plus",
                          left: SyntaxTree.new(root: "plus", left: 1, right: 2),
                          right: SyntaxTree.new(root: "plus", left: 4, right: 3))
    assert_equal tree.compute, 10
  end

  def test_nested_times
    tree = SyntaxTree.new(root: "times", left: 3, right: SyntaxTree.new(root: "plus", left: 1, right: 1))
    assert_equal tree.compute, 6
  end

  def test_nested_times2
    tree = SyntaxTree.new(root: "times", left: SyntaxTree.new(root: "plus", left: 1, right: 1), right: 3)
    assert_equal tree.compute, 6
  end

  def test_both_nested_times
    tree = SyntaxTree.new(root: "times",
                          left: SyntaxTree.new(root: "plus", left: 1, right: 2),
                          right: SyntaxTree.new(root: "plus", left: 4, right: 3))
    assert_equal tree.compute, 21
  end

end
