class Ranking < ApplicationRecord
  # Direct associations

  belongs_to :destination,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
