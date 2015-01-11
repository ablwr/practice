class BST

  attr_accessor :data, :left, :right

  def initialize(num)
    @data = num
    @left = nil
    @right = nil
  end

  def insert(num)
    if num > @data
      if self.right
        self.right.insert(num)
      else
        @right = BST.new(num)
      end
    else
      if self.left
        self.left.insert(num)
      else
        @left = BST.new(num)
      end
    end
  end

  def each(&block)
    left.each(&block) if left
    block.call(data)
    right.each(&block) if right
  end

end