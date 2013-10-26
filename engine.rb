require "./graph"
require "./node"
require 'pry'


class Engine

  attr_accessor :start_point, :end_point, :current_node, :unvisited, :finish, :steps

  def initialize
    @graph = Graph.new
    @unvisited = []
    @finish = false
    @steps = []
  end

  def auto
    ['a','b','c','d','e','f'].each do |node|
      @graph.add_node(Node.new(node))
    end
    ['a,b,7', 'a,c,9', 'a,d,14', 'b,c,10', 'b,f,15', 'c,f,11', 'c,d,2', 'd,e,9', 'e,f,6'].each do |route|
      ans_array = route.to_s.split(',')
      @graph.add_route( ans_array[0], ans_array[1], ans_array[2])
    end
  end

  def ask_for_nodes
    puts "\nInsert as meny as nodes as you want to the graph. To stop creating nodes just type 'stop'\n\n"
    flag = true
    while flag do
      print "node name: "
      ans = gets.chomp
      if ans == 'stop'
        flag = false
      else
        @graph.add_node(Node.new(ans))
        puts "New node = #{@graph[ans]}\n"
      end
    end
  end

  def ask_for_routes
    print "\n Now lets create some routes between the nodes. again to stop just type 'stop'\n\n"
    print "\n Example: A,B,7\n\n"
    flag = true

    while flag do
      print "enter a route: "
      ans = gets.chomp

      if ans == 'stop'
        flag = false
      else
        ans_array = ans.split(',')
        if ans_array.size < 2
          print "\n please enter a correct route!\n\n"
        else
          @graph.add_route( ans_array[0], ans_array[1], ans_array[2])
          puts "route created #{@graph.routes["#{ans_array[0]}#{ans_array[1]}"]}\n"
        end
      end
    end
  end

  def select_points
    print "\n Enter the start point and the destination point in the for of 'A-B'..."
    ans = gets.chomp
    ans_array = ans.split('-')
    @start_point = ans_array[0]
    @end_point = ans_array[1]
    puts ">>> Start point, end point: #{@start_point},#{@end_point}.\n\n"
  end

  def phase_1
    @graph.nodes.each {|node| @graph[node.first].tentative_distance = 0}
    @graph[@start_point].tentative_distance = 0
  end

  def phase_2
    @current_node = @start_point
    @graph.nodes.each {|node| @unvisited << @graph[node.first] unless node.first == @start_point}
  end

  def phase_3
    @graph[@current_node].neighbors.each do |node|
      route = "#{@current_node}#{node.name}"
      connection_distance = @graph.routes[route].to_i + @graph[@current_node].tentative_distance
      if node.tentative_distance > connection_distance || node.tentative_distance == 0
        node.tentative_distance = connection_distance
      end
    end
  end

  def phase_4
    @graph[@current_node].visited = true
    @unvisited.delete(@graph[@current_node])
  end

  def phase_5
    inf = 0
    @unvisited.each {|node| inf = node.tentative_distance == 0 ? 0 : node.tentative_distance }
    if @graph[@end_point].visited
      @finish = true
    end
  end

  def phase_6
    unless @finish
      puts ">>>>>>>> #{@unvisited.map(&:tentative_distance)}"
      @unvisited.sort! { |a,b| a.tentative_distance <=> b.tentative_distance}
      @steps << @current_node
      flag = true
      index = 0
      while flag do
        if @unvisited[index].tentative_distance != 0
          @current_node = @unvisited[index].name
          flag = false
        end
        index = index + 1
      end
    end
  end

end

