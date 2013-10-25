require "minitest/autorun"
require "./node"


describe Node do
  before do
    @node = Node.new('A')
  end

  describe "node should have a name" do
    it "must return a name node" do
      @node.name.must_equal 'A'
    end
  end

end
