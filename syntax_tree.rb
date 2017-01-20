require "pry"

class SyntaxTree

  def initialize(root:, left:, right:)
    @root = root
    @left = left
    @right = right
  end

  def compute
    if @root == "plus"
      if @right.class == Fixnum
        @left + @right
      elsif @right.class == SyntaxTree
        @left + @right.compute
      end
    elsif @root == "times"
      @left * @right
    end
  end

end
