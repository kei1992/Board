# == Schema Information
#
# Table name: direct_messages
#
#  id         :bigint           not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#  user_id    :integer
#
class DirectMessage < ApplicationRecord
	belongs_to :user
  belongs_to :room
  #ブロードキャスト
  after_create_commit { DirectMessageBroadcastJob.perform_later self }
end
