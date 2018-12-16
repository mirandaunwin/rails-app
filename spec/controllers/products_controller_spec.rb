require "rails_helper"

describe ProductsController, type: :controller do

  let(:product) { Product.create!(name: "cleanser", description: "text", image_url: "image.jpg") }

  let(:user) {User.create!(email: "test@gmail.com", password: "test123") }

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe "GET #show" do
    it "shows products page" do
      get :show, params: {id: product.id}
      expect(response).to be_ok
    end
  end

  describe "GET #new" do
    before do
      sign_in user
    end
    it "redirects to new product page" do
      get :new, params: {id: @product}
      expect(response).to be_ok
    end
  end

  describe "GET #edit" do
    before do
      sign_in user
    end
    it "redirects to edit page" do
      get :edit, params: {id: product.id}
      expect(response).to be_ok
    end
  end

  describe "POST #create" do
    before do
      sign_in user
    end
    it "creates a new product" do
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    before do
      sign_in user
    end
    it "destroys product" do
      delete :destroy, params: {id: product.id}
      expect(response).to redirect_to products_path
    end
  end


end
