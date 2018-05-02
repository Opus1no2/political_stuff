class Congress < ApplicationRecord
  has_many :senators
  scope :current, -> { order(session: :asc) }
end
