# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  src_link   :string(255)
#

require 'spec_helper'

describe Picture do
  pending "add some examples to (or delete) #{__FILE__}"
end
