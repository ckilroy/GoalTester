class Goal < ActiveRecord::Base
  validates :text, :user_id, presence: true

  belongs_to :user

end
