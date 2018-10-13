require_relative './bird'

# The main game class
class FlappyBirdGame < Gosu::Window
  def initialize
    super(288, 624)
    self.caption = 'Flappy Bird!'

    setup_images
    @bird = Bird.new(34, 300)
    @game_started = false
  end

  # Overridden methods
  def draw
    @background_image.draw(0, 0, 0)
    @base_image.draw(0, 512, 0)
    @message_image.draw(52, 178.5, 1) unless @game_started

    @bird.fall_down if @game_started && !@bird.is_dead
    @bird.draw
  end

  def update
    close if Gosu.button_down? Gosu::KB_ESCAPE
    if Gosu.button_down? Gosu::MS_LEFT
      @game_started = true
      @bird.fly
    end
  end

  # Private methods
  private

  def setup_images
    @background_image = Gosu::Image.new(
      "./assets/sprites/background-#{%w[day night].sample}.png"
    )
    @base_image = Gosu::Image.new('./assets/sprites/base.png')
    @message_image = Gosu::Image.new('./assets/sprites/message.png')
  end
end
