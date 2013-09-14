require 'ostruct'
class DefaultConfig
  attr_reader :ball
  attr_reader :paddle
  attr_reader :block
  attr_reader :rarkanoid

  def self.init(&block)
    @init_block = block
  end

  def self.init_block
    @init_block || Proc.new {}
  end

  def initialize
    @ball, @paddle, @block, @rarkanoid = (0..3).map { OpenStruct.new }

    rarkanoid.width = 640
    rarkanoid.height = 480

    block.horizontal = 16
    block.vertical = 24
    block.padding = 1

    # Color can be any of:
    #
    # :black
    # :gray
    # :white
    # :aqua
    # :red
    # :green
    # :blue
    # :yellow
    # :fuchsia
    # :cyan
    ball.color = :white
    ball.size = 8
    ball.speed = 2.0

    paddle.color = :gray
    paddle.width = 80
    paddle.speed = 6

    instance_eval &self.class.init_block
  end
end
