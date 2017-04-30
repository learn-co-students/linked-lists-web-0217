class Node
  attr_accessor :data, :next

  def initialize(data, next_node=nil)
    self.data = data
    self.next = next_node
  end

end

class LinkedList
  attr_accessor :head

  def initialize(data)
    @head = Node.new(data)
  end

  def index_at(index)
    pointer = self.head
    index.times do
      return nil unless pointer.next
      pointer = pointer.next
    end
    pointer.data
  end

  def insert_at_index(index, data)
    pointer = self.head
    (1..index - 1).each do |number|
      if pointer.next.nil? && index != number
        pointer.next = Node.new(nil)
      end
      pointer = pointer.next
    end
    if pointer
      old_next = pointer.next
      pointer.next = Node.new(data, old_next)
    end
  end

  def unshift(data)
    pointer = self.head
    self.head = Node.new(data)
    self.head.next = pointer
  end

  def push(data)
    pointer = self.head
    while pointer.next
      pointer = pointer.next
    end
    pointer.next = Node.new(data, nil)
  end
end
