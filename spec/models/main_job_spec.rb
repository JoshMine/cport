# == Schema Information
#
# Table name: main_jobs
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  company        :string(255)
#  position       :string(255)
#  start_date     :date
#  end_date       :date
#  description    :string(255)
#  monthly_income :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# == Schema Information
#
# Table name: main_jobs
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  company        :string(255)
#  position       :string(255)
#  start_date     :date
#  end_date       :date
#  description    :string(255)
#  monthly_income :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe MainJob do
  pending "add some examples to (or delete) #{__FILE__}"
end
