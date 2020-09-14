class User < ApplicationRecord

  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
     validates :nickname
     validates :email
     validates :birthday
     validates :password, length: { minimum:6}

      with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
       validates :first_name
       validates :last_name
      end

      with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
        validates :first_name_furigana
       validates :last_name_furigana

      

      end
      
    end
    
end
