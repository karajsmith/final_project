require 'rails_helper'

RSpec.describe FriendGroup, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:destination) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
