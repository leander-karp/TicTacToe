require 'game_base/player'

RSpec.describe Player do 
  subject(:player) {described_class.new(name, icon)}

  context 'at construction' do
    let(:name) do 
      'Max'
    end 
    let(:icon) do 
      'O'
    end

    it 'has a name' do 
      expect(player.name).to eq 'Max'
    end

    it 'has an icon' do 
      expect(player.icon).to eq 'O'
    end
  end

end 
