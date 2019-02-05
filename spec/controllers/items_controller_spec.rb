require 'rails_helper'

describe ItemsController, type: :controller do  #テストのグループ化

  describe 'GET #index' do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders the :index template" do #indexファイルの呼び出しを行うテスト
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let!(:item){ create(:item, user_id: user.id) }

    it "正しくページが切り替わるか" do
      get :show, params: { id: item }
      expect(response).to render_template :show
    end

    it "showアクションの＠itemが正しく所得できているか" do
      get :show,  params: {id: item}
      expect(assigns(:item)).to eq item
    end
  end

end
