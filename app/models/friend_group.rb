class FriendGroup < ApplicationRecord
  # Direct associations

  belongs_to :destination,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
