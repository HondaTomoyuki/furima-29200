require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname記述してあれば登録できる"do
        @user.nickname = "aaa"
        expect(@user).to be_valid
      end
      it "email記述してあれば登録できる"do
        @user.email = "aaa@aaa"
        expect(@user).to be_valid
      end
      it "emailに@を記述してあれば登録できる"do
        @user.email = "aaa@aaa"
        expect(@user).to be_valid
      end
      # it "emailに一意性があれば登録できる" do
      #   user = User.create(name: "Test", user_id: "test", email: "taro@example.com")
      #   expect(user).to_not be_valid
      # end
      it "password6文字以上であれば登録できる" do
        @user.password = "1qa1qa"
        @user.password_confirmation = "1qa1qa"
        expect(@user).to be_valid
      end
      it "パスワードは半角英数字混合であれば登録できる" do
        @user.password = "1qa1qa"
        @user.password_confirmation = "1qa1qa"
        expect(@user).to be_valid
      end
        it "first_name記述してあれば登録できる"do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）で記述してあれば登録できる"do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end
      it "last_name記述してあれば登録できる"do
        @user.last_name = "太郎"
       expect(@user).to be_valid
      end
      it "last_nameは全角（漢字・ひらがな・カタカナ）で記述してあれば登録できる"do
        @user.last_name = "太郎"
       expect(@user).to be_valid
      end
      it "first_name_furigana記述してあれば登録できる"do
        @user.first_name_furigana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "first_name_furiganaのフリガナは全角（カタカナ）であれば登録できる"do
        @user.first_name_furigana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "last_name_furigana記述してあれば登録できる"do
        @user.last_name_furigana = "タロウ"
       expect(@user).to be_valid
      end
      it "last_name_furiganaのフリガナは全角（カタカナ）であれば登録できる"do
        @user.last_name_furigana = "タロウ"
       expect(@user).to be_valid
      end
      it "birthday記述してあれば登録できる"do
        @user.birthday = "2020-08-01"
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailで@が記述されていなければ登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字混合でなければ登録できない" do
          @user.password = "qqqqqq"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_furiganaが空だと登録できない" do
        @user.first_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end
      it "first_name_furiganaがフリガナは全角（カタカナ）でないと登録できない" do
        @user.first_name_furigana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end
      it "last_name_furiganaが空だと登録できない" do
        @user.last_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana is invalid")
      end
      it "last_name_furiganaがフリガナは全角（カタカナ）でないと登録できない" do
        @user.last_name_furigana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end