# generate Person model
rails g model Person honorific:string last_name:string middle_name:string first_name:string suffix:string gender:string ttu_email:string ttu_phone:string ttu_termination:boolean termination_reason:string
rails g model FacultyMember current_title:string auxiliary_roles:string objectives_statement:string research_interests_summary:string role_termination_date:date termination_reason:string person:references
