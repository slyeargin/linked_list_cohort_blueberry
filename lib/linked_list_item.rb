class LinkedListItem
  include Comparable

  attr_reader :payload
  attr_reader :next_item

  def initialize(value)
    @payload = value
  end

  def next_item=(item)
    raise ArgumentError if item === self
    @next_item = item
  end

  def last?
    @next_item.nil?
  end

  def <=>(item)
    if self.payload.class == item.payload.class
      self.payload <=> item.payload
    else
      precedence = [Fixnum, String, Symbol]
      self_index = precedence.index(self.payload.class)
      item_index = precedence.index(item.payload.class)
      self_index <=> item_index
    end
  end

  def ===(item)
    self.equal? item
  end

end
