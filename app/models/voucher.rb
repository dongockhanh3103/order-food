class Voucher < ApplicationRecord
  has_many :orders
  validates :code, presence: true, uniqueness: true

  scope :valid, -> { where('qty > 0 and starts_at <= ? and expires_at >= ?', Time.now, Time.now) }
end
