require "rails_helper"

describe ProductsController, type: :controller do

  let(:product) { Product.create!(name: "cleanser", description: "text", image_url: "image.jpg") }

  describe "GET #show" do
    it "shows products page" do
      get :show, params: {id: product.id}
      expect(response).to be_ok
    end
  end

end
