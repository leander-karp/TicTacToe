require 'game/player'

RSpec.describe Player do 

  context 'when constructed' do
    subject(:playerA) {described_class.new(nameA, iconA)}
    subject(:playerB) {described_class.new(nameB, iconB)}

    let(:nameA) {'Max'} 
    let(:iconA) {'O'}
    let(:nameB) {'Moritz'}
    let(:iconB) {'X'}

    it 'has a name equal to the given one' do 
      expect(playerA.name).to eq 'Max'
      expect(playerB.name).to eq 'Moritz'
    end

    it 'has an icon equal to the given one' do 
      expect(playerA.icon).to eq 'O'
      expect(playerB.icon).to eq 'X'
    end
  end

end 
