require './engine'

class Prompt

  def initialize

    @engine = Engine.new
  end

  def start
    unless ENV['TYPE'] == 'auto'
      @engine.ask_for_nodes
      @engine.ask_for_routes
    else
      @engine.auto
    end
    @engine.select_points
    @engine.phase_1
    @engine.phase_2
  end

  def processing
    while !@engine.finish do
      @engine.phase_3
      @engine.phase_4
      @engine.phase_5
      @engine.phase_6
    end
    puts ">>>>>>>> #{@engine.steps}"
  end

end

prompt = Prompt.new
prompt.start
prompt.processing
