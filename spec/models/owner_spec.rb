require 'spec_helper'

describe Owner do
  context 'of creating a new owner' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    # it { should validate_presence_of :dog_name }

    it { should allow_value('example@chris.com').for(:email) }
    it { should_not allow_value('example.com', '@example.com', 'wordword').for(:email) }


    # I think I want FactoryGirl here in the future
    it 'is possible to see full name of owner' do
      owner = Owner.create!(first_name: 'Benjamin', 
        last_name: 'Smith', email: 'bs@example.com')
      expect(owner.full_name).to eq('Benjamin Smith')
    end
  end

  context 'relating Owner to Dog model' do
    it 'is possible to call .dogs on an owner to view all his/her dogs' do
      owner = Owner.create!(first_name: 'Benjamin', 
        last_name: 'Smith', email: 'bs@example.com')
      dog = Dog.create!(name: 'Ganesh', breed: 'Cocker Spaniel', owner: owner)
      expect(owner.dogs.count).to be
      expect(owner.dogs.count).to eq(1)
    end 
  end
end

