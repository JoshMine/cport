# == Schema Information
#
# Table name: flats
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  address        :string(255)
#  rooms_quantity :integer
#  total_square   :float
#  living_square  :float
#  floor          :integer
#  price          :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Flat do
  pending "add some examples to (or delete) #{__FILE__}"
end
