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

    #商品出品機能が完成後にコメントアウトを外す
  describe 'delete #destroy' do
    # let!(:brand){ create(:brand) }
    # let!(:category){ create(:category) }
    let(:user) { create(:user) }
    let!(:item){ create(:item, user_id: user.id) }
    before do
      login user
    end

    it "商品が削除される" do
      expect do
        delete :destroy, params: {id: item.id}, session:{}
      end.to change(Item, :count).by(-1)
    end

    it "indexにリダイレクトされる" do
      delete :destroy, params: { id: item }
      expect(response).to redirect_to items_path
    end

  end

end
