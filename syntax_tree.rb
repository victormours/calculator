require "pry"

class SyntaxTree

  def initialize(root:, left:, right:)
    @root = root
    @left = left
    @right = right
  end

  def compute
    if @root == "plus"
      left_value + right_value
    elsif @root == "times"
      @left * @right
    end
  end

  def left_value
    if @left.class == Fixnum
      @left
    elsif @left.class == SyntaxTree
      @left.compute
    end
  end

  def right_value
    if @right.class == Fixnum
      @right
    elsif @right.class == SyntaxTree
      @right.compute
    end
  end

end
