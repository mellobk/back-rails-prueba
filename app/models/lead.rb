class Lead < ApplicationRecord
    belongs_to :proyect
    

    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :phone, presence: true, :phone_number => {:ten_digits => true}
    validates :proyect_id, presence: true
end

