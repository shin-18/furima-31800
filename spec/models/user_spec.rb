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

   context 'ユーザーが正常に登録できる時' do
    it "nicknameとemail、passwordとpassword_confirmation、surname、name、surname_kana、name_kana、birthday_idが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "パスワードが6文字以上であれば登録できること" do
      @user.password = "123456"
      expect(@user).to be_valid
    end
   end

   context 'ユーザーが登録できない時' do
    it "ニックネームが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors[:nickname]).to include("を入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("すでに存在しています")

    it "メールアドレスが空だと登録できない" do
      @user.email = nil 
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it 'emailに＠が含まれていなければ登録ができないこと' do
      @user.email = "bububububu"
      @user.valid?
      expect(@user.errors[:email]).to include("は不正な値です")
    end

    it "パスワードが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
    end

    it "性が空だと登録できない" do
      @user.surname = nil
      @user.valid?
      expect(@user.errors[:surname]).to include("を入力してください")
    end

    it "名が空だと登録できない" do
      @user.name = nil
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "性カナが空だと登録できない" do
      @user.surname_kana = nil
      @user.valid?
      expect(@user.errors[:surname_kana]).to include("を入力してください")
    end

    it "名カナが空だと登録できない" do
      @user.name_kana = nil
      @user.valid?
      expect(@user.errors[:name_kana]).to include("を入力してください")
    end

    it "パスワードと確認パスワードが一致していないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    

    it "パスワードが6文字未満だと登録できない" do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end

  it '半角英語のみでは登録できないこと' do
    @user.password = "bububu"
    @user.valid?
    expect(@user.errors[:password]).to include("は不正な値です")
  end

  it '半角数字のみでは登録できないこと' do
    @user.password = "123456"
    @user.valid?
    expect(@user.errors[:password]).to include("は不正な値です")
  end

  it '全角では登録できないこと' do
    @user.password = "pg１２３４"
    @user.valid?
    expect(@user.errors[:password]).to include("は不正な値です")
  end


    it '性を半角で入力した時登録できない' do
      @user.surname = "ﾐｮｳｼ"
      @user.valid?
      expect(@user.errors[:surname]).to include("は全角で入力してください")
    end
 
    it '名を半角で入力した時登録できない' do
      @user.name = "ﾅﾏｴ"
      @user.valid?
      expect(@user.errors[:name]).to include("は全角で入力してください")
    end
  end

    it '性カナをカタカナ意外で入力した時登録できない' do
      @user.surname_kana = "kana"
      @user.valid?
      expect(@user.errors[:surname_kana]).to include("は全角カナで入力してください")
    end
 
    it '名カナをカタカナ意外で入力した時登録できない' do
      @user.name_kana = "kana"
      @user.valid?
      expect(@user.errors[:name_kana]).to include("は全角カナで入力してください")
    end
  end

  it "birthdayがない場合は登録できないこと" do
    @user.birthday_id = nil
    @user.valid?
    expect(@user.errors[:birthday_id]).to include("を入力してください")
  end
 end
end