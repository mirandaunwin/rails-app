require 'rails_helper'

describe User do

  let(:user) { User.create!(email: "test@gmail.com", password: "test123") }

  it "is a valid email" do
    expect(user.email).to eq "test@gmail.com"
  end

  it "is not valid without an email" do
    expect(User.new(email = nil)).to_not be_valid
  end

end
