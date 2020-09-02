require 'field'

RSpec.describe Field do 
  subject(:field) {described_class.new(content)}

  context 'has an state which' do 
    let(:content) do
      nil
    end

    it 'allows the empty state' do 
      expect(field.state).to eq nil
    end

    it 'allows to be set' do 
      expect(field.state='new state').to eq 'new state'
      expect(field.state).to eq 'new state'
    end

    it 'allows to be cleared' do 
      field.state = 'new state'
      field.clear 
      expect(field.state).to eq nil
    end
  end 

  describe '#empty?' do 
    let(:content) do
      'new state' 
    end

    it 'checks for emptiness correctly' do 
      expect(field.empty?).to eq false
      field.clear 
      expect(field.empty?).to eq true
    end
  end

  describe '#==' do 
    let(:content) do 
      'some state'
    end 

    it 'evaluates equality correctly' do 
      expect(field=='another object').to eq false
      expect(field==Field.new('some state')).to eq true
    end 
  
  end

end 