# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :sns_credentials, dependent: :destroy
  # deviceの機能を拡張
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable,:validatable, :omniauthable

  has_many :boards, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks,dependent: :destroy
  has_many :my_bookmarks, through: :bookmarks, source: :board
  has_many :archives, dependent: :destroy

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_one :profile, dependent: :destroy

  def follow!(user)
    user_id = get_user_id(user)
    following_relationships.create!(following_id: user_id)
  end

  def unfollow!(user)
    user_id = get_user_id(user)
    relation = following_relationships.find_by!(following_id: user_id)
    relation.destroy!
  end

  def has_followed?(user)
    following_relationships.exists?(following_id: user.id)
  end

  def has_written?(board)
    boards.exists?(id: board.id)
  end

  def has_written_task?(board,task)
    tasks.exists?(id: task.id)
  end

  def has_written_comment?(board,task)
    comments.exists?(id: comment.id)
  end

  def has_bookmarked?(board)
    bookmarks.exists?(board_id:board.id)
  end

  def has_archivetasked?(board,task)
    archives.exists?(board_id:board.id,task_id:task.id)
  end

  def prepare_profile
    profile || build_profile
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar1.png'
    end
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
  end

  private
  def get_user_id(user)
    if user.is_a?(User)
      user_id = user.id
    else
      user_id = user
    end
  end
end
