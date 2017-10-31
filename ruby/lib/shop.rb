class Shop

  def initialize(items)
    @items = items
  end

  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def update_quality()
    @items.each do |item|
      # Not Aged Brie and  Backstage passes
      if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
        if item.quality > 0
          if item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality = item.quality - 1
          end
        end
      else # Brie or Backstage passes
        if item.quality < MAX_QUALITY
          item.quality = item.quality + 1
          # Backstage passes only
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            if item.sell_in < 11
              if item.quality < MAX_QUALITY
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < MAX_QUALITY
                item.quality = item.quality + 1
              end
            end
          end
          # End of Backstage
        end
      end
      # Not Sulfuras
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in = item.sell_in - 1
      end

      if item.sell_in < 0
        # Not Age Brie
        if item.name != 'Aged Brie'
          # Not Backstage
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > MIN_QUALITY
              # Not Sulfur
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality = item.quality - 1
              end
              # End of not sulfur, Backstage, Not Age Brie
            end
            #Backstage Only
          else
            item.quality = item.quality - item.quality
          end
        # Age Brie only
        else
          if item.quality < MAX_QUALITY
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
