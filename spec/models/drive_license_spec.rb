# == Schema Information
#
# Table name: drive_licenses
#
#  id                    :integer          not null, primary key
#  participant_id        :integer
#  series                :string(255)
#  number                :integer
#  issuer                :string(255)
#  issue_date            :date
#  exp_date              :date
#  status                :integer          default(0)
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'spec_helper'

describe DriveLicense do
  pending "add some examples to (or delete) #{__FILE__}"
end
