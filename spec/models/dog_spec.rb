require 'spec_helper'

describe Dog do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :owner } 
  end

  
  context 'relation to owner model' do
    it 'allows .owner to return owner' do
      owner = Owner.create!(first_name: 'Benjamin', 
        last_name: 'Smith', email: 'bs@example.com')
      dog = Dog.create!(name: 'Ganesh', 
        breed: 'Cocker Spaniel', owner: owner)
      expect(dog.owner.first_name).to eq('Benjamin')
    end
  end
end
