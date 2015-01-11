class Element
  attr_accessor :datum, :next

  def initialize(datum, next_el=nil)
    self.datum = datum
    self.next = next_el
  end

  def to_a
    arr = []
    current_el = self
    while current_el
      arr << current_el.datum
      current_el = current_el.next
    end
    arr
  end

  def next=(el)
    @next = el.previous = self if !el.nil?
  end

  def previous=(el)
    @previous = el.next = self if !el.nil?
  end

  def reverse
    Element.from_a(Element.to_a(self).reverse)
  end

  def self.to_a(el)
    el.to_a
  end


  def self.from_a(arr)
    if arr.class == Range
      arr = (arr).to_a
    end
    if !arr.empty?
      prev = nil
      arr.reverse.each do |datum|
        new_el = Element.new(datum, prev)
        prev = new_el
      end
    end
    prev
  end

end
