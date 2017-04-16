rails d scaffold v1/Answer
rails d scaffold v1/Question
rails d scaffold v1/Report
rails d scaffold v1/Form
rails d scaffold v1/Type
rails d scaffold v1/Category
rails db:drop

rails g scaffold v1/Category name:text description:text
rails g scaffold v1/Type alias:string
rails g scaffold v1/Form title:text details:text banksize:integer questions_count:integer visits_count:integer reports_count:integer v1_category:references
rails g scaffold v1/Report email:string debrief:text v1_form:references
rails g scaffold v1/Question questdata:text v1_form:references v1_type:references
rails g scaffold v1/Answer ansdata:text ref:text v1_question:references
rails db:create
rails db:migrate




