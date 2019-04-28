# generate Person model
rails g model Person honorific:string last_name:string middle_name:string first_name:string suffix:string gender:string ttu_email:string ttu_phone:string ttu_termination:boolean termination_reason:string

# generate FacultyMember model
rails g model FacultyMember current_title:string auxiliary_roles:text objectives_statement:text research_interests_summary:text role_termination_date:date termination_reason:string person:references

# generate StaffMember model
rails g model StaffMember current_title:string auxiliary_roles:text departmental?:boolean objectives_statement:text departmental_impact_statement:text role_termination_date:date termination_reason:string person:references

# generate GraduateStudent model
rails g model GraduateStudent current_program:string degree_sought:string auxiliary_roles:string expected_graduation_date:date objectives_statement:text research_interests_summary:text termination_reason:string person:references
