class Destination < ApplicationRecord
  # Direct associations

  has_many   :rankings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
