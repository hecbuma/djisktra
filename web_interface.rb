require './engine'
require 'json'

class WebInterface

  def initialize(start_point, end_point)
    @engine = Engine.new
    @engine.start_point = start_point
    @engine.end_point = end_point
  end

  def setup_engine
    @engine.auto
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
    @engine.steps.to_json
  end


end
