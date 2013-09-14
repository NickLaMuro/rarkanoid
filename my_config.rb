class MyConfig < DefaultConfig
  init do
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

    paddle.color = :red
    paddle.width = 80
    paddle.speed = 6
  end
end
