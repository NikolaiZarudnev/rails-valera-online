class State < ApplicationRecord
  belongs_to :user
  validates :health, numericality: { only_integer: true }
  validates :alcohol, numericality: { only_integer: true }
  validates :happy, numericality: { only_integer: true }
  validates :tired, numericality: { only_integer: true }
  validates :money, numericality: { only_integer: true }
end
