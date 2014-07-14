class LinkedList

  def initialize(*payloads)
    payloads.each do |payload|
      push(payload)
    end
  end

  def []=(index, payload)
    item = get_item(index)
    item.payload = payload
  end

  def [](index)
    get_item(index).payload
  end
  ## What does this do? Look it up ;)
  alias get []

  def delete(index)
    raise IndexError if index > size
    if index == 0
      @first_item = @first_item.next_item
    else
      previous_item = get_item(index - 1)
      next_item = previous_item.next_item.next_item
      previous_item.next_item = next_item
    end
  end

  def index(payload)
    index = -1
    current_item = @first_item
    until current_item.nil?
      index += 1
      return index if current_item.payload == payload
      current_item = current_item.next_item
    end
    nil
  end

  def push(value)
    lli = LinkedListItem.new(value)
    if @first_item
      last_item.next_item = lli
    else
      @first_item = lli
    end
  end

  def last
    return unless @first_item
    last_item.payload
  end

  ## How could we do this more efficiently?
  def size
    i = 0
    current_item = @first_item
    until current_item.nil?
      i += 1
      current_item = current_item.next_item
    end
    i
  end

  def to_s
    result = "|"
    current_item = @first_item
    until current_item.nil?
      result << " #{current_item.payload}"
      unless current_item.last?
        result << ","
      end
      current_item = current_item.next_item
    end
    result << " |"
    result
  end

  private

  def get_item(index)
    raise IndexError if index < 0
    current_item = @first_item
    index.times do
      raise IndexError if current_item.nil?
      current_item = current_item.next_item
    end
    current_item
  end

  def last_item
    return unless @first_item
    current_item = @first_item
    until current_item.last?
      current_item = current_item.next_item
    end
    current_item
  end
end
