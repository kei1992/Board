# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
    acts_as_taggable

    validates :name, presence: true
    validates :description, presence: true

    belongs_to :user
    has_many :tasks, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :profiles, through: :users
    has_rich_text :description
end
