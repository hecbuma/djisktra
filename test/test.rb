require "minitest/autorun"
require "./node"


describe Node do
  before do
    @node = Node.new('A')
  end

  describe "when initialize" do
    it "must return a name node" do
      @node.name.must_equal 'A'
    end

    it "must have and array for store neighbors" do
      @node.neighbors.must_be_kind_of Array
    end
  end

  describe :add_neighbor do
    before do
      @node.add_neighbor(Node.new('B'))
    end
    it "should add new neighbors to the node" do
      @node.neighbors.count.must_equal 1
    end
  end

  describe :list_neighbors do
    before do
      @node.add_neighbor(Node.new('C'))
      @node.add_neighbor(Node.new('D'))
    end
    it "should be an Array" do
      @node.list_neighbors.must_be_kind_of Array
    end
    it "should return the names of the neighbers" do
      @node.list_neighbors.must_include  'C'
      @node.list_neighbors.must_include  'D'
    end

  end

end
