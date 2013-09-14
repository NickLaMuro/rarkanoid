require 'gosu'

require_relative 'default_config'
require_relative 'my_config'

CONFIG = MyConfig.new

require_relative 'ball'
require_relative 'block'
require_relative 'paddle'

class Rarkanoid < Gosu::Window
  WIDTH = CONFIG.rarkanoid.width
  HEIGHT = CONFIG.rarkanoid.height
  HORIZONTAL_BLOCKS = CONFIG.block.horizontal
  VERTICAL_BLOCKS = CONFIG.block.vertical
  BLOCK_WIDTH = WIDTH / HORIZONTAL_BLOCKS
  BLOCK_HEIGHT = HEIGHT / VERTICAL_BLOCKS
  BLOCK_PADDING = CONFIG.block.padding

  def initialize
    super(WIDTH, HEIGHT, false)
    @state = :playing

    @font = Gosu::Font.new(self, Gosu::default_font_name, 80)

    @blocks = [:gray, :red, :green, :blue, :yellow, :fuchsia, :cyan, :gray].each_with_index.flat_map do |color, i|
      16.times.map do |j|
        Block.new(j, i+4, color)
      end
    end

    # Level 2
    # @blocks = 16.times.flat_map do |i|
    #   i.times.map do |j|
    #     Block.new(j, i, :red)
    #   end
    # end

    @paddle = Paddle.new
    @ball = Ball.new(@paddle, @blocks)
  end

  def update
    return  unless @state == :playing
    if button_down?(Gosu::KbLeft)
      @paddle.move(:left)
    end
    if button_down?(Gosu::KbRight)
      @paddle.move(:right)
    end
    @ball.move

    if @ball.lost?
      @state = :lose
    end

    @blocks.delete_if(&:destroyed)
    if @blocks.empty?
      @state = :win
    end
  end

  def draw
    case @state
    when :playing
      @blocks.each do |block|
        block.draw(self)
      end
      @paddle.draw(self)
      @ball.draw(self)
    when :win
      @font.draw("Winner!", 10, 10, 10)
    when :lose
      @font.draw("Loser!", 10, 10, 10)
    end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

Rarkanoid.new.show
