class Paddle
  WIDTH = CONFIG.paddle.width
  SPEED = CONFIG.paddle.speed

  attr_reader :x

  def initialize
    @x = Rarkanoid::WIDTH/2
  end

  def move(direction)
    raise unless [:left, :right].include?(direction)
    amount = SPEED
    amount *= -1  if direction == :left
    @x += amount
    if @x < WIDTH/2
      @x = WIDTH/2
    end
    if @x > Rarkanoid::WIDTH - WIDTH/2
      @x = Rarkanoid::WIDTH - WIDTH/2
    end
  end

  def hit?(ballx)
    if ballx > @x - WIDTH/2 && ballx < @x + WIDTH/2
      (ballx - x1) / WIDTH.to_f
    else
      false
    end
  end

  def x1
    @x - WIDTH/2
  end

  def x2
    @x + WIDTH/2
  end

  def y1
    Rarkanoid::HEIGHT - 32
  end

  def y2
    Rarkanoid::HEIGHT - 16
  end

  def gosu_color
    Gosu::Color.const_get CONFIG.paddle.color.to_s.upcase
  rescue NameError
    Gosu::Color::GRAY
  end

  def draw(window)
    color = gosu_color

    window.draw_quad(x1, y1, color, x2, y1, color, x2, y2, color, x1, y2, color)
  end
end
