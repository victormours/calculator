require "pry"

class SyntaxTree

  def initialize(root:, left:, right:)
    @root = root
    @left = left
    @right = right
  end

  def compute
    @left + @right
  end

end
