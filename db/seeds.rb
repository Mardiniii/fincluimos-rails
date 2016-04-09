if Rails.env.development?
  User.find_or_create_by(email: 'sebas@kaizendevs.com') { |u| u.password =  "holamama"; u.role = :superadmin }

  company = Company.find_or_create_by(name: "Kaizen Devs")
  admin = company.users.find_or_create_by(email: "admin@kforms.com") { |u| u.password = "password"; u.role = :admin }
  info_collector = company.users.find_or_create_by(email: "info_collector@kforms.com") { |u| u.password = "password"; u.role = :info_collector }

  form = company.forms.find_or_create_by(name: "Solicitud de Micro-crédito")

  first_name_question = form.questions.find_or_create_by(text: "Nombres") { |q| q.question_type = :input }
  last_name_question = form.questions.find_or_create_by(text: "Apellidos") { |q| q.question_type = :input }
  department_question = form.questions.find_or_create_by(text: "Departamento") { |q| q.question_type = :dropdown }
  department_question.question_options.find_or_create_by(text: "Cundinamarca")
  department_question.question_options.find_or_create_by(text: "Boyaca")
  department_question.question_options.find_or_create_by(text: "Meta")
  department_question.question_options.find_or_create_by(text: "Antioquia")
  department_question.question_options.find_or_create_by(text: "Nariño")

end
