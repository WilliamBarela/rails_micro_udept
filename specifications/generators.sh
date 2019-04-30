# generate Person model
rails g model Person honorific:string last_name:string middle_name:string first_name:string suffix:string gender:string ttu_email:string ttu_phone:string ttu_termination_date:date termination_reason:string

# generate FacultyMember model
rails g model FacultyMember current_title:string auxiliary_roles:text objectives_statement:text research_interests_summary:text role_termination_date:date termination_reason:string person:references{index}

# generate StaffMember model
rails g model StaffMember current_title:string auxiliary_roles:text departmental?:boolean objectives_statement:text departmental_impact_statement:text role_termination_date:date termination_reason:string person:references{index}

# generate GraduateStudent model
rails g model GraduateStudent current_program:string degree_sought:string auxiliary_roles:string expected_graduation_year:integer expected_graduation_semester:string objectives_statement:text research_interests_summary:text role_termination_date:date termination_reason:string person:references{index}

# generate Committees model:
rails g model Committee committee_title:string committee_description:text committee_started:date committee_depricated:date

# generate CommitteeMemberships model (join table)
rails g model CommitteeMembership role:string join_date:date termination_date:date person:belongs_to{index} committee:belongs_to{index}
rails g model GraduateAdvisorhip primary_advisor?:boolean advising_initiation:date advising_termination:date faculty_member:belongs_to{index} graduate_student:belongs_to{index}
