# Rarkanoid
A quick Arkanoid clone in Ruby using Gosu.

![Imgur](http://i.imgur.com/lqSlPJb.png?1)

## Get it!

Open a terminal app like Terminal.app or GTerm and run:

```bash
git clone https://github.com/jphenow/rarkanoid.git
cd rarkanoid
```

## Running

```bash
ruby rarkanoid.rb
```

## Try Customizing!

open `my_config.rb` and tinker with the defaults
```ruby
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
```
