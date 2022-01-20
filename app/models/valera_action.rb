class ValeraAction < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :health, presence: true
    validates :alcohol, presence: true
    validates :happy, presence: true
    validates :tired, presence: true
    validates :money, presence: true
end
