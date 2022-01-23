class ValeraAction < ApplicationRecord
  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :name, presence: true, uniqueness: true
  # rubocop:enable Rails/UniqueValidationWithoutIndex
  validates :health, presence: true
  validates :alcohol, presence: true
  validates :happy, presence: true
  validates :tired, presence: true
  validates :money, presence: true
  has_many :conditions, dependent: :destroy
  accepts_nested_attributes_for :conditions
end
