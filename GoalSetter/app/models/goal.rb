class Goal < ActiveRecord::Base
  validates :text, :user_id, presence: true

  belongs_to :user

  def self.all_public_goals
    Goal.where(private: false)
  end

end
