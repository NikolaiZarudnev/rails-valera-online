class User < ApplicationRecord
  has_secure_password
  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :email, presence: true, uniqueness: true
  # rubocop:enable Rails/UniqueValidationWithoutIndex
  validates :name, presence: true

  validates :health, numericality: { only_integer: true }
  validates :alcohol, numericality: { only_integer: true }
  validates :happy, numericality: { only_integer: true }
  validates :tired, numericality: { only_integer: true }
  validates :money, numericality: { only_integer: true }
  # rubocop:disable Rails/HasManyOrHasOneDependent
  has_one :stats_record
  # rubocop:enable Rails/HasManyOrHasOneDependent
end
