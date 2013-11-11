# == Schema Information
#
# Table name: contact_data
#
#  id             :integer          not null, primary key
#  email          :string(255)
#  m_phone        :string(255)
#  h_phone        :string(255)
#  f_address      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  participant_id :integer
#

# == Schema Information
#
# Table name: contact_data
#
#  id             :integer          not null, primary key
#  email          :string(255)
#  m_phone        :string(255)
#  h_phone        :string(255)
#  f_address      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  participant_id :integer
#

require 'spec_helper'

describe ContactData do
  pending "add some examples to (or delete) #{__FILE__}"
end
