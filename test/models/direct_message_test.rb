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
require 'test_helper'

class DirectMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
