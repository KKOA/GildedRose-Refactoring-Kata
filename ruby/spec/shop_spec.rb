require 'spec_helper'
require 'item'
require 'shop'

describe Shop do

  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      Shop.new(items).update_quality()
      expect(items[0].name).to eq 'foo'
    end
  end

end
