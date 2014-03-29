require 'spec_helper'

describe Owner do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :dog_name }

  
  # I think I want FactoryGirl here in the future
  it 'is possible to see full name of owner' do
    owner = Owner.create!(first_name: 'Benjamin', 
      last_name: 'Smith', email: 'bs@example.com', 
      dog_name: 'Ganesh')
    expect(owner.full_name).to eq('Benjamin Smith')
  end
end

