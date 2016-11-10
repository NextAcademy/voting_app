require 'rails_helper'

RSpec.describe EventsController, type: :controller do
 	
 	let(:user) {User.create(email: "tester@test.com", password: "1234")}
  let(:valid_params) {{ name: "iOS Pitch", date: "1/1/2001", start_time: '16:00', end_time: '18:00', user_id: user.id }}
  let(:invalid_params) {{ name: "Invalid Pitch", description: "date and time not provided" }}

  describe "GET #new" do
    before do
      session[:user_id] = user.id
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

  end


  describe "POST #create" do
    before do
      session[:user_id] = user.id
    end

    context "valid_params" do

      it "creates new status if params are correct" do
        expect {post :create, :event => valid_params}.to change(Event, :count).by(1)
      end

      # it 'redirects status path and displays flash notice after status is created successfully' do
      #   post :create, status: valid_params
      #   expect(response).to redirect_to(Status.last)
      #   expect(flash[:notice]).to eq "Status is created successfully."
      # end
    end
  end

end
