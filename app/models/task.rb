# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
class Task < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    belongs_to :user
    belongs_to :board
    has_many :comments, dependent: :destroy
    has_many :notofications,dependent: :destroy
    has_one_attached :eyecatch
    has_rich_text :description

    def comment_count
        comments.count
    end
end
