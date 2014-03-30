require 'spec_helper'

feature 'add dog and details', %Q{
  As a dog owner
  I want to upload details of my dog(s)
  So others can see what kind of dogs go to our dog park
} do

# Acceptance Criteria

# * Owner can specify dog breed, and optionally: sex, age, and personality
# * At the owners home page, an owner can click dogs link to see what dogs a specific owner has.
# * At owners home page, an owner can also click to see a listing of all the dogs, showing dog name, breed, and owner full name

  scenario 'add dog to owner' do
    owner = Owner.create!(first_name: 'Benjamin', 
      last_name: 'Smith', email: 'bs@example.com')

    visit owners_path
    click_link 'Add Dog' 


    find('#dog_owner_id').set 'Benjamin Smith'
    # cannot get this to pick Benjamin Smith.

    fill_in 'Name', with: 'Bully'
    fill_in 'Breed', with: 'Bulldog'

    click_button 'Add Dog'

    expect(page).to have_content('Dog entry created!')
    expect(page).to have_content('Bully')
  end

  # scenario 'view all dogs, starting from owners page)' do
  #   visit owners_path

  #   owner = Owner.create!(first_name: 'Benjamin', 
  #       last_name: 'Smith', email: 'bs@example.com')
  #   dog = Dog.create!(name: 'Ganesh', 
  #     breed: 'Cocker Spaniel', owner: owner)
  #   owner2 = Owner.create!(first_name: 'Jack', 
  #       last_name: 'Johnson', email: 'jj@example.com')
  #   dog2 = Dog.create!(name: 'Sureshi', 
  #     breed: 'Irish Setter', owner: owner2)
  #   click_link 'View All Dogs'
  #   expect(page).to have_content('Sureshi')
  #   expect(page).to have_content('Ganesh')
  # end

end



