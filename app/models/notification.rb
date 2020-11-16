# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string           default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  comment_id :integer
#  task_id    :integer
#  visited_id :integer
#  visitor_id :integer
#
# Indexes
#
#  index_notifications_on_board_id    (board_id)
#  index_notifications_on_comment_id  (comment_id)
#  index_notifications_on_task_id     (task_id)
#  index_notifications_on_visited_id  (visited_id)
#  index_notifications_on_visitor_id  (visitor_id)
#
class Notification < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	belongs_to :board, optional: true
  belongs_to :task, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
