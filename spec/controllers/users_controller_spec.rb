require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

   describe "GET #show" do
    it "returns http success" do
     expect(:get => "/users/#{user.id}").to route_to("users#show")
    end
  end
end
