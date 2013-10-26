class Node
  attr_accessor :name, :neighbors, :tentative_distance, :visited

  def initialize(name)
    @name = name
    @neighbors = []
    @visited = false
  end

  def add_neighbor(neighbor)
    @neighbors << neighbor
  end

  def list_neighbors
    @neighbors.map(&:name)
  end



end
