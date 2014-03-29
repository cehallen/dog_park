require 'spec_helper'

feature 'register a dog', %Q{
  As a dog owner
  I want to register my dog
  So that I can connect with other dog owners
} do

# Acceptance Criteria:

# * An owner must specify their first name, last name, email address, and dog's name.
# * Upon adding my entry, I can see a list of other registered dog owners.
# * An owner's full_name can be requested. Hint: This will require an instance method


  scenario 'create a valid dog owner' do
    prev_count = Owner.count

    # visit new_owner_path
    visit 'owners/new'

    fill_in 'First Name', with: 'Conan'
    fill_in 'Last Name', with: 'Bennett'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Dog Name', with: 'Oscar'

    click_button 'Create Dog Owner'
    expect(page).to have_content('Dog owner created!')
    expect(page).to have_content('Conan')
    expect(Owner.count).to eq(prev_count + 1)
  end

  scenario 'create an invalid dog owner' do
    prev_count = Owner.count

    visit 'owners/new'

    fill_in 'First Name', with: 'Lisa'
    fill_in 'Last Name', with: 'Suarez'
    # no email or dog name

    click_button 'Create Dog Owner'
    expect(page).to have_content("can't be blank")
    # expect(page).to have_content("Sorry, must include email")
    # couldn't figure out simple_form custom error msgs.
    expect(Owner.count).to eq(prev_count)
  end

  scenario 'linking to new page from owner index' do
    visit 'owners'

    click_link 'Register'
    
    expect(page).to have_content('Add Dog Owner')
  end

  scenario 'create a valid dog'
  scenario 'create an invalid dog'
  scenario 'view all registered dogs'

end


# ############
# feature 'add a toy', %Q{
#   As a Week 6 Launcher
#   I want to share my breakable toy idea
#   So that I can get feedback from my peers
# } do

#   # Acceptance Criteria:

#   # * I must specify a name, a url, a first name, a last name, and an email address
#   # * My email address must be properly formatted
#   # * My url must be properly formatted

#   scenario 'create a valid toy' do
#     prev_count = BreakableToy.count
#     toy_name = 'Commando Frog Goes to Town'
#     visit new_breakable_toy_path
#     fill_in 'breakable_toy_name',
#       with: toy_name
#     fill_in 'Url',
#       with: 'http://commandofrogstheawesomeness.com'
#     fill_in 'breakable_toy_first_name',
#       with: 'Dan'
#     fill_in 'breakable_toy_last_name',
#       with: 'Pickett'
#     fill_in 'Email',
#       with: 'user@example.com'

#     click_button 'Create Breakable Toy'
#     expect(page).to have_content('Toy created.')
#     expect(BreakableToy.count).to eql(prev_count + 1)
#     expect(page).to have_content(toy_name)
#   end

#   scenario 'create an invalid toy' do
#     prev_count = BreakableToy.count
#     visit new_breakable_toy_path
#     click_button 'Create Breakable Toy'
#     expect(page).to have_content("can't be blank")
#     expect(BreakableToy.count).to eql(prev_count)
#   end
# end