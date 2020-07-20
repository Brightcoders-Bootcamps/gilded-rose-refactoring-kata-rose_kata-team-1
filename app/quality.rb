# frozen_string_literal: true

# Quality class
class Quality
  def self.decrease(quality)
    quality - quality
  end

  def self.increase(quality, sell_in)
    quality += 1
    quality += 1 if sell_in < 11
    quality += 1 if sell_in < 6
  end
end
