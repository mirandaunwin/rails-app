require 'rails_helper'

describe Order do

  let(:product) { Product.create!(name: "cleanser", description: "Some text.", image_url: "image.jpg")}

  let(:user) { User.create!(email: "test@gmail.com", password: "test123") }

  it "is a valid order" do
    expect(Order.new(user: user, product: product, total: 1)).to be_valid
  end

  it "is not valid wihout a product" do
    expect(Order.new(user: user, total: 1)).not_to be_valid
  end

end
