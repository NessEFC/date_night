require_relative 'node'

class BinarySearchTree
  attr_reader :root_node

  def initialize
    @root_node = nil
  end

  def insert(rating, title)
    if @root_node.nil?
      @root_node = Node.new(rating, title)
    else
      @root_node.insert(rating, title)
    end
    depth_of(rating)
  end

  def include?(rating)
    if @root_node.rating == nil
      false
    else
      @root_node.include?(rating)
    end
  end

  def depth_of(rating)
    if include?(rating)
      1 + @root_node.depth_of(rating)
    else
      nil
    end
  end

  def max
    max = {}
    if @root_node.right.nil?
      max[@title] = @rating
      max
    else
      @root_node.right.max
    end
  end

  def min
    min = {}
    if @root_node.left.nil?
      min[@title] = @rating
      min
    else
      @root_node.left.min
    end
  end

  def load(file)
    list = File.open(file, "r")
    items = []
    items = IO.readlines list
    items.each do |item|
      item = item.chomp
      item = item.split(", ")
      rating = item.first.to_i
      title = item.last
      self.insert(rating, title)
    end
  end
end
