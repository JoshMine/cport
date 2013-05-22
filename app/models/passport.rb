class Passport < ActiveRecord::Base
  attr_accessible [:birth_date, :birth_place, :dep_code, :first_name, 
    :gender, :issue_date, :issuer, :last_name, :middle_name, :number, :series, 
    :marrital_status, :official_address, :doc_file]
  
  belongs_to :participant
  
  
end
