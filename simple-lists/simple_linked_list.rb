class Node
  attr_accessor :next, :data
  def initialize(data, next_node)
    @next = next_node
    @data = data
  end
end

class LinkedList
  attr_accessor :head
  def initialize(data)
    @head = Node.new(data, nil)
  end

  def index_at(index)
    node = @head
    while(index > 0)
      node = node.next
      index -= 1
    end
    if node
      node.data
    else
      nil
    end
  end

  def insert_at_index(index, value)
    node = @head
    while(index - 1 > 0)
      if(index > 0 && !node.next)
        node.next = Node.new(nil, nil)
      end
      node = node.next
      index -= 1
    end
    new_node = Node.new(value, node.next)
    node.next = new_node
  end

  def unshift(data)
    @head = Node.new(data, @head)
  end

  def push(data)
    node = @head
    while(node.next)
      node = node.next
    end
    node.next = Node.new(data, nil)
  end
end
