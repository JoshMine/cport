# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  portfolio_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contact_data_id :integer
#  first_name      :string(255)
#  middle_name     :string(255)
#  last_name       :string(255)
#

require 'spec_helper'

describe Person do
  pending "add some examples to (or delete) #{__FILE__}"
end
