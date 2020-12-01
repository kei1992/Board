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
require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
