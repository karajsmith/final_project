class FriendRequest < ApplicationRecord
  # Direct associations

  has_many   :friend_groups,
             :dependent => :nullify

  belongs_to :receipient,
             :class_name => "User"

  belongs_to :sender,
             :class_name => "User"

  # Indirect associations

  # Validations

end
