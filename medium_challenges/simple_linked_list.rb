class Element
  attr_accessor :next
  attr_reader :datum

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def push(datum)
    el = Element.new(datum)
    el.next = list[-1] unless empty?
    list << el
  end

  def pop
    return nil if empty?
    list.pop.datum
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def head
    list[-1]
  end

  def peek
    return nil if empty?
    head.datum
  end

  def reverse
    reversed_list
  end

  def to_a
    reversed_list([])
  end

  def self.from_a(arr)
    new_list = SimpleLinkedList.new
    return new_list if arr.nil?

    arr.reverse.each_with_object(new_list) do |el, list|
      list.push(el)
    end
  end

  private

  attr_reader :list

  def reversed_list(obj = SimpleLinkedList.new)
    new_list = obj
    current_element = head

    while current_element
      new_list.push(current_element.datum)
      current_element = current_element.next
    end

    new_list
  end
end
