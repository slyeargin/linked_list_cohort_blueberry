class LinkedList

  def initialize(*payloads)
    @size = 0
    payloads.each do |payload|
      push(payload)
    end
  end

  def push(value)
    @size += 1
    lli = LinkedListItem.new(value)
    if @first_item
      last_item.next_item = lli
    else
      @first_item = lli
    end
  end

  def get(index)
    raise IndexError if index < 0 || index == nil
    current_item = @first_item
    index.times do
      raise IndexError if current_item == nil
      current_item = current_item.next_item
    end
    current_item.payload
  end

  alias [] get

  def []=(index, value)
    get(index) = value
  end

  def size
    @size
  end

  def last
    last_item.payload if @size > 0
  end

  def to_s
    if @size == 0
      "| |"
    else
      stringify = []
      current_item = @first_item
      until current_item.nil?
        stringify << current_item.payload
        current_item = current_item.next_item
      end
      "| #{stringify.join(', ')} |"
    end
  end

  private

  def last_item
    current_item = @first_item
    until current_item.last?
      current_item = current_item.next_item
    end
    current_item
  end

end
