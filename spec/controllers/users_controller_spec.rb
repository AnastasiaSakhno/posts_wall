describe UsersController, type: :controller do

  describe 'GET #log_in' do
    it 'returns http success' do
      get :log_in
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sign_up" do
    it 'returns http success' do
      get :sign_up
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:user_params) do
      { email: 'email@gmail.com', first_name: 'first', last_name: 'last' }
    end

    it 'creates user' do
      expect do
        post :create, params: { user: user_params }
      end.to change { User.count }.by(1)
      expect(response).to redirect_to(user_profile_path)
    end
  end

end
