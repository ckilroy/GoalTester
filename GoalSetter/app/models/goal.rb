class Goal < ActiveRecord::Base
  validates :text, :user_id, presence: true

  belongs_to :user
  after_initialize :default_all_goals_to_uncompleted
  
  def self.all_public_goals
    Goal.where(private: false)
  end

  def default_all_goals_to_uncompleted
    self.completed = false
  end

end
