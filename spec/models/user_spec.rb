require 'rails_helper'

describe User do
  describe '#create' do

    # ニックネーム,メアド,パス,再パスがあれば登録できる。
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    # ニックネームがないと登録不可
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # メアドがないと登録不可
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # パスワードがないと登録不可
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 確認のパスワードがなければ登録不可
    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 20文字より多いニックネームは登録不可
    it "is invalid a name that has more than 21 characters" do
      user = build(:user, nickname: "あいうえおかきくけこさしすせそたちつてとな")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long (maximum is 20 characters)")
    end

    # 同じメアドは登録不可
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # パスワードが5文字以下なら登録不可
    it "is invalid a password that has less than 5 characters" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short (minimum is 6 characters)")
    end

    # パスワードが6文字以上なら登録できる
    it "is invalid a password that has more than 5 characters" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end

  end
end
