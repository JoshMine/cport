# == Schema Information
#
# Table name: pension_certificates
#
#  id                    :integer          not null, primary key
#  snils                 :string(255)
#  status                :integer          default(0)
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  participant_id        :integer
#

require 'spec_helper'

describe PensionCertificate do
  pending "add some examples to (or delete) #{__FILE__}"
end
