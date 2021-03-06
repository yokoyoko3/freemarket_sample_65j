require 'rails_helper'


RSpec.describe User, type: :model do
  describe '#create' do

    it "nicknameが空では登録不可" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "nicknameが16文字以上だと登録不可" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long (maximum is 15 characters)")
    end

    it "emailが空では登録不可" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailが重複すると登録不可" do
      create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "emailが@を含まないと登録不可 " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "emailの@の前に文字がないと登録不可 " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "emailの@の後に文字がないと登録不可" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end


    it "passwordが空だと登録不可" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end


    it "password_confirmationが一致しないと登録不可" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end


    it "passwordが6文字以下だと登録不可" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end


    it "first_nameが空だと登録不可" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end


    it "first_nameが16文字以上だと登録不可" do
      user = build(:user, first_name: "瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬")
      user.valid?
      expect(user.errors[:first_name][0]).to include("is too long (maximum is 15 characters)")
    end


    it "first_nameに漢字以外が含まれると登録不可 " do
      user = build(:user, first_name: "瀬瀬a")
      user.valid?
      expect(user.errors[:first_name][0]).to include("is invalid")
    end

    it "last_nameが空だと登録不可" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "last_nameが16文字以上だと登録不可" do
      user = build(:user, last_name: "瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬瀬")
      user.valid?
      expect(user.errors[:last_name][0]).to include("is too long (maximum is 15 characters)")
    end


    it "last_nameに漢字以外が含まれると登録不可 " do
      user = build(:user, last_name: "瀬瀬a")
      user.valid?
      expect(user.errors[:last_name][0]).to include("is invalid")
    end


    it "first_name_kanaが空だと登録不可" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end


    it "first_name_kanaが16文字以上だと登録不可" do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("is too long (maximum is 15 characters)")
    end


    it "first_name_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, first_name_kana: "トトa")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("is invalid")
    end


    it "last_name_kanaが空だと登録不可" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end


    it "last_name_kanaが16文字以上だと登録不可" do
      user = build(:user, last_name_kana: "ウアウアウアウアウアウアウアウア")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("is too long (maximum is 15 characters)")
    end


    it "last_name_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, last_name_kana: "カナa")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("is invalid")
    end


    it "birthdayが空だと登録不可" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "すべて満たしていれば登録可" do
      user = build(:user)
      expect(user).to be_valid
    end


  end
end