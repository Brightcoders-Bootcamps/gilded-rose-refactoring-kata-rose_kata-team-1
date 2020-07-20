# frozen_string_literal: true

require_relative '../gilded_rose.rb'
require_relative '../item.rb'
require_relative '../quality.rb'
require 'test/unit'

# Test cases
class TestUntitled < Test::Unit::TestCase
  def test_foo
    items = [Item.new('foo', 0, 0)]
    GildedRose.new(items).update_quality
    assert_equal items[0].name, 'foo'
  end

  def test_aged_brie
    items = [Item.new('Aged Brie', 1, 1)]
    result = GildedRose.new(items).update_quality
    obj = result[0]
    assert_equal obj.name, 'Aged Brie'
    assert_equal obj.quality, 2
    assert_equal obj.sell_in, 0
  end

  def test_backstage_passes_to_a_tafk80etc_concert
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 0)]
    result = GildedRose.new(items).update_quality
    obj = result[0]
    assert_equal obj.name, 'Backstage passes to a TAFKAL80ETC concert'
    assert_equal obj.quality, 3
    assert_equal obj.sell_in, 0
  end

  def test_sulfuras_hand_of_ragnaros
    items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 51)]
    result = GildedRose.new(items).update_quality
    obj = result[0]
    assert_equal obj.name, 'Sulfuras, Hand of Ragnaros'
    assert_equal obj.quality, 51
    assert_equal obj.sell_in, 0
  end
end
