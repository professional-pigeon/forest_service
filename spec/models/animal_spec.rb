require 'rails_helper'

describe Animal do
  it { should have_many(:sightings) }
end