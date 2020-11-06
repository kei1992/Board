# == Schema Information
#
# Table name: archives
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#  task_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_archives_on_board_id  (board_id)
#  index_archives_on_task_id   (task_id)
#  index_archives_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
class Archive < ApplicationRecord
	belongs_to :user
	belongs_to :task
end
