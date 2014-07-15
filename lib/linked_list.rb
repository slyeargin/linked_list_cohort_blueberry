class LinkedList

  attr_reader :size

  def initialize(*payloads)
    @size = 0
    payloads.each do |payload|
      push(payload)
    end
  end

  def push(payload)
    lli = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = lli
    else
      item = @first_item
      until item.last?
        item = item.next_item
      end
      item.next_item = lli
    end
    @size += 1
  end

  def get(index, return_payload=true)
    return_payload ? get_item(index).payload : get_item(index)
  end

  alias [] get

  def []= (index, value)
    get_item(index).payload = value
  end

  def get_item(index)
    raise IndexError if index < 0 || index == nil || index > @size
    current_item = @first_item
    index.times do
      raise IndexError if current_item == nil
      current_item = current_item.next_item
    end
    current_item
  end

  def delete(index)
    if index == 0
      @first_item = @first_item.next_item
    else
      previous_item = get_item(index-1)
      next_item = get_item(index+1)
      previous_item.next_item = next_item
    end
    @size -= 1
  end

  def index(payload)
    counter = 0
    item = @first_item
    until item.nil?
      if item.payload == payload
        return counter
      else
        counter += 1
        item = item.next_item
      end
    end
  end

  def size
    @size
  end

  def last
    last_item.payload if @size > 0
  end

  def sorted?
    item = @first_item
    until item.nil? or item.last?
      if item > item.next_item
        return false
      else
        item = item.next_item
      end
    end
    true
  end

  def sort!
    linked_list = self
    flagged = true
    if @size <= 1
      return linked_list
    else
      while flagged
        flagged = false
        0.upto(@size - 2) do |index|
          if linked_list[index, false] > linked_list[index+1, false]
            swap_with_next(index)
            flagged = true
          else
            index +=1
          end
        end
      end
    end
    linked_list
  end

  def swap_with_next(index)
    raise IndexError if index < 0 || index >= (@size - 1)
    linked_list = self
    linked_list[index], linked_list[index+1] = linked_list[index+1], linked_list[index]
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
