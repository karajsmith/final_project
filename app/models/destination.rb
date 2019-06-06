class Destination < ApplicationRecord
  # Direct associations

  has_many   :friend_groups,
             :dependent => :nullify

  has_many   :rankings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
