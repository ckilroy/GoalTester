class GoalComment < ActiveRecord::Base

  validates :body, :goal_id, :author_id, presence: true

  belongs_to :goal
  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id
end
