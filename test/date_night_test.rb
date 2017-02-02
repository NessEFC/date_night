require 'minitest/autorun'
require 'minitest/pride'
require '../lib/binary_search_tree'
require '../lib/node'

class DateNightTest < Minitest::Test

  def test_does_tree_exist
    assert tree = BinarySearchTree.new
  end

  def test_does_node_exist
    tree = BinarySearchTree.new
    assert_nil tree.root_node
  end

  def test_insert_on_new_tree_creates_node
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute_nil tree.root_node
  end

  def test_does_node_have_right
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_nil tree.root_node.right
  end

  def test_does_node_have_left
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_nil tree.root_node.left
  end

  def test_has_rating
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 50, tree.root_node.rating
  end

  def test_has_title
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal "Hannibal Buress: Animal Furnace", tree.root_node.title
  end

  def test_tree_does_insert
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(16, "Johnny English")
    assert_equal 16, tree.root_node.left.rating
  end

  def test_rating_is_included?
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(16, "Johnny English")
    assert tree.include?(16)
  end

  def test_depth_of_node
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(16, "Johnny English")
    tree.insert(24, "Manos: The Hands of Fate")
    tree.insert(8, "The Happening")
    tree.insert(90, "Die Hard")
    assert_nil tree.depth_of(51)
    assert_equal 3, tree.depth_of(8)
    assert_equal 2, tree.depth_of(90)
  end

  def test_highest_score
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(16, "Johnny English")
    tree.insert(24, "Manos: The Hands of Fate")
    tree.insert(8, "The Happening")
    tree.insert(90, "Die Hard")
    assert_equal ({"Die Hard"=>90}), tree.max
  end

  def test_lowest_score
    tree = BinarySearchTree.new
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(16, "Johnny English")
    tree.insert(24, "Manos: The Hands of Fate")
    tree.insert(8, "The Happening")
    tree.insert(90, "Die Hard")
    assert_equal ({"The Happening"=>8}), tree.min
  end

  def test_file_is_loaded
    tree = BinarySearchTree.new
    assert tree.load('../lib/movies.txt')
  end

  def test_file_contents_are_inserted_in_tree
    tree = BinarySearchTree.new
    tree.load('../lib/movies.txt')
    assert_equal ({"The Little Engine That Could"=>100}), tree.max
    assert_equal ({"Cruel Intentions"=>0}), tree.min
  end
end
