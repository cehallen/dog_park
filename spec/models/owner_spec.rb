require 'spec_helper'

describe Owner do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  # it { should validate_presence_of :email }
  it { should validate_presence_of :dog_name }
end



# require 'spec_helper'

# describe Beverage do
#   # like making a new object without name, and saying it
#   # should be false.. it 'is invalid without name..yadayada'
#   it { should validate_presence_of :name }
#   it { should validate_presence_of :type }

# end