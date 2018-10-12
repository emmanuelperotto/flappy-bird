class Bird < Gosu::Window
  attr_reader :is_dead

  def initialize(x = 0, y = 0)
    @image = Gosu::Image.new('./assets/sprites/redbird-midflap.png')
    @x = x
    @y = y
    @angle = 0.0
    @gravity = 0
    @is_dead = false
  end

  def fall_down
    @y += @gravity
    @angle += 2.0 if @angle < 90.0
    @gravity += 0.4
  end

  # Overridden methods
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
    @is_dead = true if Gosu.distance(@x, @y, @x, 512) <= 20.0
  end
end