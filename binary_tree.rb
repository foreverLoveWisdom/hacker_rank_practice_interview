class Node
  attr_accessor :left, :right, :value

  def initialize(value)
    self.left = nil
    self.right = nil
    self.value = value
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize
    self.root = nil
  end

  def go_left(node, value)
    current_node = node
    if value < current_node.value
      if current_node.left.nil?
        node = Node.new(value)
        current_node.left = node
        return
      else
        current_node = current_node.left
        go_left(current_node, value)
      end
    else
      if current_node.left.nil?
        node = Node.new(value)
        current_node.left = node
        return
      else
        current_node = current_node.left
        go_left(current_node, value)
      end
    end
  end

  def go_right(node, value)
    current_node = node
    if value > current_node.value
      if current_node.right.nil?
        node = Node.new(value)
        current_node.right = node
        return
      else
        current_node = current_node.right
        go_right(current_node, value)
      end
    else
      if current_node.left.nil?
        node = Node.new(value)
        current_node.left = node
        return
      else
        current_node = current_node.left
        go_left(current_node, value)
      end
    end
  end

  def insert(value)
    if root.nil?
      node = Node.new(value)
      self.root = node
      return
    end

    go_left(root, value)
    go_right(root, value)
  end

  def lookup(value)
    while root.left
      if value < root.left
        return root.left if value == root.left
      end

    end
  end
end

bt = BinarySearchTree.new
bt.insert(10)
# puts bt.inspect


