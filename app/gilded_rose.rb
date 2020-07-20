class GildedRose

  def initialize(items)
    @items = items
  end
  
  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie"
        aged_brie_method(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        backstage_passes_method(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        sulfuras_method(item)
      end
    end
  end

  def aged_brie_method(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end

    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
    end
    
    if item.sell_in < 0
      if item.quality < 50
        item.quality = item.quality + 1
      end
    end
  end

  def backstage_passes_method(item)
    if item.quality < 50
      item.quality = item.quality + 1
      if item.sell_in < 11
        if item.quality < 50
          item.quality = item.quality + 1
        end
      end
      if item.sell_in < 6
        if item.quality < 50
          item.quality = item.quality + 1
        end
      end
    end
    
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
    end

    if item.sell_in < 0
      item.quality = item.quality - item.quality
    end
  end

  def sulfuras_method(item)
  end
end
  
class Item
  attr_accessor :name, :sell_in, :quality
  
  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
  
  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end