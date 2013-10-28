# == Schema Information
#
# Table name: cars
#
#  id                 :integer          not null, primary key
#  participant_id     :integer
#  brand              :string(255)
#  model              :string(255)
#  prod_year          :integer
#  price              :float
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe Car do
  pending "add some examples to (or delete) #{__FILE__}"
end
