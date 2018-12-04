require 'rails_helper'

describe User, type: :model do

  let(:user) { User.create!(email: "test@gmail.com", password: "test123") }

  it "is a valid email" do
    expect(user.email).to eq "test@gmail.com"
  end

  it "is not valid without an email" do
    expect(User.new(email = nil)).to_not be_valid
  end

  it "should not validate users without an email address" do
    @user = FactoryBot.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end

end
