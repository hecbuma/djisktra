require "./graph"
require "./node"

class Engine

  attr_accessor :start_point, :end_point, :current_node, :unvisited

  def initialize
    @graph = Graph.new
    @unvisited = []
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
        if ans_array .size < 2
          flag = false
          print "\n please enter a correct route!\n\n"
        else
          @graph.add_route( ans_array[0], ans_array[1], ans_array[2])
          puts "route created #{@graph.routes.last}\n"
        end
      end
    end
  end

  def select_points
    print "\n Enter the start point and the destination point in the for of 'A - B'..."
    ans = gets.chomp
    ans_array = ans.split('-')
    @start_point = ans_array[0]
    @end_point = ans_array[1]
  end

  def phase_1
    @graph.nodes.each {|node| @graph[node.first].tentative_distance = nil}
    @graph[@start_point].tentative_distance = 0
  end

  def phase_2
    @current_node = @start_point
    @graph.nodes.each {|node| @unvisited << @graph[node.first] unless node.first == @start_point}
  end



end

engine = Engine.new

engine.ask_for_nodes
engine.ask_for_routes
engine.select_points
engine.phase_1
engine.phase_2
