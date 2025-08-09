class Kitten < ApplicationRecord
  validates :name, presence: true

  CUTENESS_OPTIONS = %w[Sweet Lovely Adorable Precious Purrfection].freeze
  validates :cuteness, inclusion: { in: CUTENESS_OPTIONS }

  SOFTNESS_OPTIONS = %w[Smooth Fluffy Fuzzy Silky Cloudlike].freeze
  validates :softness, inclusion: { in: SOFTNESS_OPTIONS }
end
