require "minitest/autorun"
require "./graph"
require "./node"


describe Graph do
  before do
    @graph = Graph.new
  end

  describe "when initialize" do
    it "must return a empty nodes hash" do
      @graph.nodes.must_be_kind_of Hash
    end
  end

  describe :add_node do
    before do
      @graph.add_node(Node.new('A'))
    end
    it "should add nodes hash" do
      @graph.nodes.count.must_equal 1
    end
  end

  describe :add_route do
    before do
      @graph.add_node(Node.new('A'))
      @graph.add_node(Node.new('B'))
      @graph.add_route('A', 'B', 7)
    end
    it "should add a neighbor to a specific node" do
      @graph['A'].list_neighbors.must_include 'B'
    end
    it "should add an array with the nodes plus distance" do
      @graph.routes.first.must_include @graph['A']
      @graph.routes.first.must_include @graph['B']
      @graph.routes.first.must_include 7
    end
  end
end

