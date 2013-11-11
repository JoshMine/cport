# == Schema Information
#
# Table name: oms_certificates
#
#  id             :integer          not null, primary key
#  number         :string(255)
#  status         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  participant_id :integer
#

# == Schema Information
#
# Table name: oms_certificates
#
#  id             :integer          not null, primary key
#  number         :string(255)
#  status         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  participant_id :integer
#

require 'spec_helper'

describe OmsCertificate do
  pending "add some examples to (or delete) #{__FILE__}"
end
