require 'board'
require 'field'

RSpec.describe Board do 
  describe '.create' do 
    it 'uses 1x1 default for invalid input' do 
      expect(described_class.create(0, 0)).to eq [[Field.new()]]
      expect(described_class.create(nil, nil)).to eq [[Field.new()]]
      expect(described_class.create(-1, -1)).to eq [[Field.new()]]
    end 

    it 'creates boards with different sizes' do 
      expect(described_class.create(2, 1)).to eq [[Field.new()], [Field.new()]]
      expect(described_class.create(1, 2)).to eq [[Field.new(), Field.new()]]
    end
  end 
end 