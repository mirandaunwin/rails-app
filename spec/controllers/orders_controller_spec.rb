require "rails_helper"

describe OrdersController, type: :controller do

  let(:product) { Product.create!(name: "cleanser", description: "text", image_url: "image.jpg") }

  let(:user) {User.create!(email: "test@gmail.com", password: "test123") }

  context "when a user is logged in" do
    before do
      sign_in user
    end

    it "is a valid order" do
      expect(Order.new(user: user, product: product, total: 1)).to be_valid
    end
    
  end
end
