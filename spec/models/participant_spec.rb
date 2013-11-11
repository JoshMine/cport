# == Schema Information
#
# Table name: participants
#
#  id           :integer          not null, primary key
#  last_name    :string(255)
#  first_name   :string(255)
#  middle_name  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :integer
#  gender       :string(255)
#  date_birth   :date
#  m_phone      :string(255)
#  h_phone      :string(255)
#  f_address    :string(255)
#  rating       :integer
#  index        :integer
#

# == Schema Information
#
# Table name: participants
#
#  id           :integer          not null, primary key
#  last_name    :string(255)
#  first_name   :string(255)
#  middle_name  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :integer
#  gender       :string(255)
#  date_birth   :date
#  m_phone      :string(255)
#  h_phone      :string(255)
#  f_address    :string(255)
#  rating       :integer
#  index        :integer
#

require 'spec_helper'

describe Participant do
  pending "add some examples to (or delete) #{__FILE__}"
end
