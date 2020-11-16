# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  acts_as_taggable

  validates :name, presence: true

  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :profiles, through: :users
  has_many :notifications,dependent: :destroy
  has_rich_text :content

  def favorite_by(user)
    favorites.find_by(user_id: user.id)
  end

  def create_notification_like!(current_user)
  # すでに「いいね」されているか検索
    temp = Notification.where(['visitor_id = ? and visited_id = ? and board_id = ? and action = ? ', current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
      board_id: id,
      visited_id: user_id,
      action: 'like'
      )
    # 自分の投稿に対するいいねの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
    end
  end
end
