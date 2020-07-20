# frozen_string_literal: true

require_relative 'item.rb'
require_relative 'quality.rb'

# GildedRose class
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      name = item.name
      if name == 'Aged Brie'
        aged_brie(item)
      elsif name == 'Backstage passes to a TAFKAL80ETC concert'
        backstage_passes(item)
      end
    end
  end

  def aged_brie(item)
    discount_when_not_sulfuras(item)
    return unless item.quality < 50

    item.quality += 1
    item.quality += 1 if item.sell_in.negative?
  end

  def backstage_passes(item)
    backstage_quality_improvement(item)
    discount_when_not_sulfuras(item)
    item.quality = Quality.decrease(item.quality) if item.sell_in.negative?
  end

  def backstage_quality_improvement(item)
    return unless item.quality < 50

    item.quality = Quality.increase(item.quality, item.sell_in)
  end

  def discount_when_not_sulfuras(item)
    return unless item.name != 'Sulfuras, Hand of Ragnaros'

    item.sell_in -= 1
  end
end
