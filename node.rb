class Node
  attr_accessor :name, :neighbors

  def initialize(name)
    @name = name
    @neighbors = []
  end

  def add_neighbor(neighbor)
    @neighbors << neighbor
  end

  def list_neighbors
    @neighbors.map(&:name)
  end

end
