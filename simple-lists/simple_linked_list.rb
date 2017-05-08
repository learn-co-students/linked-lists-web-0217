class Node
  attr_reader :next_node, :data
  def initialize(data, next_node=nil)
    @data = data
    @next_node = next_node
  end

  def next
    next_node
  end

  def next=(node)
    @next_node = (node)
  end
end

class LinkedList
    attr_accessor :head

  def initialize(data)
    node = Node.new(data)
    @head = node
  end

  def index_at(i)
    j = 0
    current_node = head
    until i == j
      if !current_node
        return nil
      end
      current_node = current_node.next
      j += 1
    end
    current_node ? current_node.data : nil
  end

  def insert_at_index(i, data)
    node = Node.new(data)
    j = 0
    current_node = head
    until j == i - 1
      if !current_node.next
        nil_node = Node.new(nil)
        current_node.next = nil_node
      end
      current_node = current_node.next
      j += 1
    end
    node.next = current_node.next
    current_node.next = node
  end

  def unshift(data)
    node = Node.new(data)
    node.next = self.head
    self.head = node
  end

  def push(data)
    node = Node.new(data)
    current_node = head
    until current_node.next == nil
      current_node = current_node.next
    end
    current_node.next = node
  end

end
