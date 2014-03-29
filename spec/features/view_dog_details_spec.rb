require 'spec_helper'

feature 'view dog details', %Q{
  As a dog owner
  I want to view details of other registered dogs
  So I can see what kind of dogs go to our dog park
}

# Acceptance Criteria

# * After registering, owner can specify dog breed, and optionally: sex, and personality
# * At the registry home page, owner can click dog name to see that dog's details
# * If dog owne