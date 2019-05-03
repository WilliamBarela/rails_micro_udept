class GraduateAdvisorhip < ApplicationRecord
  belongs_to :faculty_member
  belongs_to :graduate_student

  # items to validate
  #:primary_advisor?
  #:advising_initiation
  #:advising_termination
  #:faculty_member
  #:graduate_student
end
