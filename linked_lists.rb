class LinkedList
  attr_reader :head, :tail

  def initialize
  	@head = nil
  	@tail = nil
  end

  def append(node)
    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(node)
  	if @head == nil
  	  @head = node
  	  @tail = node
  	else
  	  node.next_node = @head
  	  @head = node
  	end
  end

  def size
  	return 0 if @head == nil
  	return 1 if @head.next_node == nil
  	node = @head
  	i = 0
  	until node == nil
  	  i += 1
  	  node = node.next_node
  	end
  	return i
  end

  def head
  	@head
  end

  def tail
    @tail
  end

  def at(index)
  	return @head if index == 0
  	node = @head
  	n = 0
  	until n == index
  	  node = node.next_node
  	  n += 1
  	end
  	node 
  end

  def pop
  	if @head == nil
  	  return "The list was already empty."
  	elsif @head == @tail
  	  @head = nil
  	  @tail = nil
  	else
  	  node = @head
  	  loop do
  	  	if node.next_node == @tail
  	  	  @tail = node
  	  	  node.next_node = nil
  	  	  break
  	  	else
  	  	  node = node.next_node
  	  	end
  	  end
  	end
  end

  def contains?(input)
  	return false if @head == nil
  	node = @head
  	loop do
  	  if node.value == input
  	  	return true
  	  elsif node.next_node == nil
  	  	return false
  	  else
  	  	node = node.next_node
  	  end
  	end
  end

  def find(data)
  	return nil if @head == nil
  	node = @head
  	index = 0
  	loop do
  	  if node.value == data
  	  	return index
  	  elsif node.next_node == nil
  	  	return nil
  	  else
  	    node = node.next_node
  	    index += 1
  	  end
  	end
  end

  def to_s
  	string = ""
    node = @head
    until node == nil
      string = string + "( #{node.value} ) -> "
      node = node.next_node
  	end
  	string += "nil"
  	string
  end

  def insert_at(data,index)
  	if index == 0
  	  new_node = Node.new
  	  new_node.value = data
  	  self.prepend(new_node)
  	else
  	  n = 0
  	  node = @head
  	  loop do
  	    if node == nil
  	  	  return "The list is not large enough for that index."
  	    elsif n == index-1
  	  	  new_node = Node.new
  	  	  new_node.value = data
  	  	  old_node = node.next_node
  	  	  node.next_node = new_node
  	  	  new_node.next_node = old_node
  	  	  break
  	    else
  	      node = node.next_node
  	      n += 1
  	    end
  	  end
  	end
  end

  def remove_at(index)
  	node = @head
  	if index == 0
  	  @head = node.next_node
  	else
  	  n = 0
  	  loop do
  	  	if node == nil
  	  	  break
  	  	elsif n == index-1
  	  	  node.next_node = node.next_node.next_node
  	  	  break
  	  	else
  	  	  n += 1
  	  	  node = node.next_node
  	  	end
  	  end
  	end  
  end
end

class Node
  attr_accessor :next_node, :value

  def initialize
  	@next_node = nil
  	@value = nil
  end
end

=begin
statements used to test the classes

node1 = Node.new
node1.value = "This is the value for node 1"
node2 = Node.new
node2.value = "This is the value for node 2"
node3 = Node.new
node3.value = "This is the value for node 3"


new_list = LinkedList.new
puts "List: #{new_list.head}. Size: #{new_list.size}."
new_list.append(node1)
puts "List: #{new_list.head.value}. Size: #{new_list.size}"
new_list.append(node2)
new_list.prepend(node3)
puts "Head: #{new_list.head.value}. Tail: #{new_list.tail.value}."
puts new_list.size
puts new_list.at(2).value
new_list.pop
puts new_list.size
puts new_list.find("This is the value for node 3")
puts new_list.to_s
new_list.insert_at("This is the value for the inserted node",2)
puts new_list.to_s
new_list.remove_at(1)
puts new_list.to_s
=end