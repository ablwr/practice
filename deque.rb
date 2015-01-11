require_relative 'simple_linked_list'

class Deque

  def initialize
    @head = nil
    @tail = nil
  end

  def unshift(value)
    node = Element.new(value,@head)
    node.previous = @tail
    @tail = node
    @head = node unless @head
  end

  def shift
    value = @tail.datum
    @tail = @tail.previous
    @tail.next = @head
    value
  end

  def push(value)
    node = Element.new(value, @head)
    node.previous = @tail
    @head = node
    @tail = node unless @tail
  end

  def pop
    value = @head.datum
    @head = @head.next
    @head.previous = @tail
    value
  end

  def list
    @head
  end
  
end