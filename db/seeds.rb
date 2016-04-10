if Rails.env.development?
  User.find_or_create_by(email: 'sebas@kaizendevs.com') { |u| u.password =  "holamama"; u.role = :superadmin }

  company = Company.find_or_create_by(name: "Kaizen Devs")
  admin = company.users.find_or_create_by(email: "admin@kforms.com") { |u| u.password = "password"; u.role = :admin }
  info_collector = company.users.find_or_create_by(email: "info_collector@kforms.com") { |u| u.password = "password"; u.role = :info_collector; u.avatar = File.new("app/assets/images/kaizen-5.jpg"); u.first_name = "Sebastian"; u.last_name = "Zapata Mardini" }

  form = company.forms.find_or_create_by(name: "Solicitud de Micro-crédito")

  first_name_question = form.questions.find_or_create_by(text: "Nombres") { |q| q.question_type = :input }
  last_name_question = form.questions.find_or_create_by(text: "Apellidos") { |q| q.question_type = :input }
  department_question = form.questions.find_or_create_by(text: "Departamento") { |q| q.question_type = :dropdown }
    department_question.question_options.find_or_create_by(text: "Cundinamarca")
    department_question.question_options.find_or_create_by(text: "Boyaca")
    department_question.question_options.find_or_create_by(text: "Meta")
    department_question.question_options.find_or_create_by(text: "Antioquia")
    department_question.question_options.find_or_create_by(text: "Nariño")

  form.questions.find_or_create_by(text: "Edad") { |q| q.question_type = :input }

  q = form.questions.find_or_create_by(text: "Grupo etnico") { |q| q.question_type = :dropdown }
    q.question_options.find_or_create_by(text: "Indigena")
    q.question_options.find_or_create_by(text: "Mestizo")
    q.question_options.find_or_create_by(text: "Caucasico")

  q2 = form.questions.find_or_create_by(text: "Musica que le gusta") { |q| q.question_type = :checkbox }
    q2.question_options.find_or_create_by(text: "Rock")
    q2.question_options.find_or_create_by(text: "Salsa")
    q2.question_options.find_or_create_by(text: "Merengue")

  form = company.forms.find_or_create_by(name: "Registro de usuario")

  first_name_question = form.questions.find_or_create_by(text: "Nombres") { |q| q.question_type = :input }
  last_name_question = form.questions.find_or_create_by(text: "Apellidos") { |q| q.question_type = :input }
  department_question = form.questions.find_or_create_by(text: "Departamento") { |q| q.question_type = :dropdown }
    department_question.question_options.find_or_create_by(text: "Cundinamarca")
    department_question.question_options.find_or_create_by(text: "Boyaca")
    department_question.question_options.find_or_create_by(text: "Meta")
    department_question.question_options.find_or_create_by(text: "Antioquia")
    department_question.question_options.find_or_create_by(text: "Nariño")

  form.questions.find_or_create_by(text: "Edad") { |q| q.question_type = :input }

  q = form.questions.find_or_create_by(text: "Grupo etnico") { |q| q.question_type = :dropdown }
    q.question_options.find_or_create_by(text: "Indigena")
    q.question_options.find_or_create_by(text: "Mestizo")
    q.question_options.find_or_create_by(text: "Caucasico")

  q2 = form.questions.find_or_create_by(text: "Musica que le gusta") { |q| q.question_type = :checkbox }
    q2.question_options.find_or_create_by(text: "Rock")
    q2.question_options.find_or_create_by(text: "Salsa")
    q2.question_options.find_or_create_by(text: "Merengue")


end
