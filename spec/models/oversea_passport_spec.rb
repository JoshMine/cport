# == Schema Information
#
# Table name: oversea_passports
#
#  id                    :integer          not null, primary key
#  participant_id        :integer
#  series                :integer
#  number                :integer
#  issuer                :string(255)
#  issue_date            :date
#  exp_date              :date
#  last_name             :string(255)
#  first_name            :string(255)
#  status                :integer
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

# == Schema Information
#
# Table name: oversea_passports
#
#  id                    :integer          not null, primary key
#  participant_id        :integer
#  series                :integer
#  number                :integer
#  issuer                :string(255)
#  issue_date            :date
#  exp_date              :date
#  last_name             :string(255)
#  first_name            :string(255)
#  status                :integer
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'spec_helper'

describe OverseaPassport do
  pending "add some examples to (or delete) #{__FILE__}"
end
