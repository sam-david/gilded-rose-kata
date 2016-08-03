class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      # item quality adjustments
      case item.name
      when /Conjured/
        item.quality -= 2 if item.quality > 0
      when "Aged Brie"
        item.quality += 2 if item.quality < 50
      when "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in <= 0
          item.quality = 0
        elsif item.sell_in <= 5
          if item.quality + 3 <= 50
            item.quality += 3
          else # 48, 49
            item.quality = 50
          end
        elsif item.sell_in <= 10
          if item.quality + 2 <= 50
            item.quality += 2
          else # 49
            item.quality = 50
          end
        else
          item.quality += 1 if item.quality < 50
        end
      else
        if item.name != "Sulfuras, Hand of Ragnaros"
          # normal quality decrease
          item.quality -= 1 if item.quality > 0
          # past sell by quality decrease
          item.quality -= item.quality if item.sell_in < 0
        end
      end

      # decrement item sell_in
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
    end
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
