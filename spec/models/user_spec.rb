require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
require 'rails_helper'
describe User do
  describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end
    it "nicknameとemail、passwordとpassword_confirmation、surname、name、surname_kana、name_kana、birthday_idが存在すれば登録できること" do
      @user = build(:user)
      expect(@user).to be_valid
    end

    it "ニックネームが空だと登録できない" do
      @user = build(:user, nickname: "")
      @user.valid?
      expect(@user.errors[:nickname]).to include("を入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("すでに存在しています")

    it "メールアドレスが空だと登録できない" do
      @user = build(:user, email: "")
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "パスワードが空だと登録できない" do
      @user = build(:user, password: "")
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
    end

    it "性が空だと登録できない" do
      @user = build(:user, surname: "")
      @user.valid?
      expect(@user.errors[:surname]).to include("を入力してください")
    end

    it "名が空だと登録できない" do
      @user = build(:user, name: "")
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "性カナが空だと登録できない" do
      @user = build(:user, surname_kana: "")
      @user.valid?
      expect(@user.errors[:surname_kana]).to include("を入力してください")
    end

    it "名カナが空だと登録できない" do
      @user = build(:user, name_kana: "")
      @user.valid?
      expect(@user.errors[:name_kana]).to include("を入力してください")
    end

    it "パスワードと確認パスワードが一致していないと登録できない" do
      @user = build(:user, password_confirmation: "")
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "パスワードが6文字未満だと登録できない" do
      @user = build(:user, password: "sample")
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end

  describe '#名前を半角で入力' do
    it '性を半角で入力した時登録できない' do
      @user = build(:user, surname: "ﾐｮｳｼﾞ")
      @user.valid?
      expect(@user.errors[:surname]).to include("は全角で入力してください")
    end
 
    it '名を半角で入力した時登録できない' do
      @user = build(:user, name: "ﾅﾏｴ")
      @user.valid?
      expect(@user.errors[:name]).to include("は全角で入力してください")
    end
  end

  describe '#フリガナをカタカナ意外で入力' do
    it '性カナをカタカナ意外で入力した時登録できない' do
      @user = build(:user, surname_kana: "kana")
      @user.valid?
      expect(@user.errors[:surname_kana]).to include("は全角カナで入力してください")
    end
 
    it '名カナをカタカナ意外で入力した時登録できない' do
      @user = build(:user, name_kana: "kana")
      @user.valid?
      expect(@user.errors[:name_kana]).to include("は全角カナで入力してください")
    end
  end

  it "birthdayがない場合は登録できないこと" do
    @user = build(:user, birthday_id: nil)
    @user.valid?
    expect(@user.errors[:birthday_id]).to include("を入力してください")
  end
end