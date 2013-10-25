class Node
  attr_accessor :name

  def initialize(name)
    @name = name
    @neighbors = []
  end

  def add_neighbor(neighbor)
    @neighbors << neighbor
  end

end
