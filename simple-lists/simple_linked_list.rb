class Node
  def initialize(node, next_node)
    @node = node
    @next_node = next_node
  end

  def next
    @next_node
  end

  def next=(next_node)
    @next_node = next_node
  end

  def data
    @node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(data)
    @head = Node.new(data, nil)
  end

  def index_at(index)
    current_pointer = head
    index.times do
      return nil unless current_pointer.next
      current_pointer = current_pointer.next
    end
    current_pointer.data
  end

  def insert_at_index(index, data)
    current_pointer = head

    (index-1).times do
      current_pointer.next = Node.new(nil, nil) unless current_pointer.next
      current_pointer = current_pointer.next
    end

    if current_pointer.next
      current_pointer.next = Node.new(data, current_pointer.next)
    else
      current_pointer.next = Node.new(data, nil)
    end
  end

  def unshift(new_data)
    @head = Node.new(new_data, @head)
  end

  def push(new_data)
    current_pointer = head
    until current_pointer.next == nil
      current_pointer = current_pointer.next
    end
    current_pointer.next = Node.new(new_data, nil)
  end
end
