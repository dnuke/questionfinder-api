rails d scaffold v1/Answer
rails d scaffold v1/Question
rails d scaffold v1/Questionary
rails d scaffold v1/Report
rails d scaffold v1/Category
rails db:drop

rails g scaffold v1/Category cname:string cdescription:text

rails g scaffold v1/Questionary title:string qdescription:text banksize:integer rnum:integer vnum:integer qnum:integer v1_category:references

rails g scaffold v1/Report email:string details:text v1_questionary:references

rails g scaffold v1/Question data:string type:integer v1_questionary:references

rails g scaffold v1/Answer content:string type:integer v1_question:references

rails db:create
rails db:migrate
