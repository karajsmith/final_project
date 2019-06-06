require 'rails_helper'

RSpec.describe Destination, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:friend_groups) }

    it { should have_many(:rankings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
