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

end
