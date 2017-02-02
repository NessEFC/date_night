class Node
  attr_reader :rating, :title
  attr_accessor :left, :right

  def initialize(rating, title)
    @rating = rating
    @title = title
    @left = nil
    @right = nil
  end

  def insert(new_rating, new_title)
    if new_rating == @rating
      "Score already exists!"
    elsif new_rating < @rating
      if @left == nil
        @left = Node.new(new_rating, new_title)
      else
        @left.insert(new_rating, new_title)
      end
    else
      if @right == nil
        @right = Node.new(new_rating, new_title)
      else
        @right.insert(new_rating, new_title)
      end
    end
  end

  def include?(rating)
    if @rating == rating
      true
    else
      if @left.nil? && rating < @rating
        false
      elsif @right.nil? && rating > @rating
        false
      elsif rating < @rating
        @left.include?(rating)
      else
        @right.include?(rating)
      end
    end
  end


  def depth_of(rating)
    if @rating == rating
      0
    else
      if rating < @rating
        1 + @left.depth_of(rating)
      else
        1 + @right.depth_of(rating)
      end
    end
  end

  def max
    max = {}
    if @right.nil?
      max[@title] = @rating
      max
    else
      @right.max
    end
  end

  def min
    min = {}
    if @left.nil?
      min[@title] = @rating
      min
    else
      @left.min
    end
  end
end
