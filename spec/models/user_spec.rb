require "rails_helper"

RSpec.describe User, type: :model do
  subject {FactoryBot.create :user}

  describe "validation" do
    it "is valid with valid attributes" do
      is_expected.to be_valid
    end

    it "is invalid with name is nil" do
      subject.name = nil
      is_expected.not_to be_valid
    end

    it "is invalid with name is blank" do
      subject.name = "   "
      is_expected.not_to be_valid
    end

    it "is invalid with account_name is nil" do
      subject.account_name = nil
      is_expected.not_to be_valid
    end

    it "is invalid with account_name is blank" do
      subject.account_name = "  "
      is_expected.not_to be_valid
    end

    it "is valid with password_confirmation is nil" do
      subject.password_confirmation = nil
      is_expected.to be_valid
    end
    
    # it "is valid with password is nil" do
    #   subject.password = nil
    #   is_expected.to be_valid
    # end
  end
end
