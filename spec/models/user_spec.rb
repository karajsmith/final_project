require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:friend_requests_rec) }

    it { should have_many(:friend_requests) }

    it { should have_many(:rankings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
