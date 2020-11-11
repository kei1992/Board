# == Schema Information
#
# Table name: entries
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#  user_id    :integer
#
require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
