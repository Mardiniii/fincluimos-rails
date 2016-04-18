# if Rails.env.development?
  User.find_or_create_by(email: 'sebas@kaizendevs.com') { |u| u.password =  "holamama"; u.role = :superadmin }

  company = Company.find_or_create_by(name: "Kaizen Devs")
  admin = company.users.find_or_create_by(email: "demo@harvestdata.co") { |u| u.password = "password"; u.role = :admin }
  info_collector = company.users.find_or_create_by(email: "info_collector@harvestdata.co") { |u| u.password = "password"; u.role = :info_collector; u.avatar = File.new("app/assets/images/kaizen-5.jpg"); u.first_name = "Sebastian"; u.last_name = "Zapata Mardini" }
  info_collector = company.users.find_or_create_by(email: "alejo@harvestdata.co") { |u| u.password = "password"; u.role = :info_collector; u.avatar = File.new("app/assets/images/team-alejo.jpg"); u.first_name = "Alejandro"; u.last_name = "Escobar" }
  info_collector = company.users.find_or_create_by(email: "german@harvestdata.co") { |u| u.password = "password"; u.role = :info_collector; u.avatar = File.new("app/assets/images/team-german.jpg"); u.first_name = "Germán"; u.last_name = "Hernández" }
  info_collector = company.users.find_or_create_by(email: "simon@harvestdata.co") { |u| u.password = "password"; u.role = :info_collector; u.avatar = File.new("app/assets/images/simon-soriano.jpg"); u.first_name = "Simón"; u.last_name = "Soriano" }

  form = company.forms.find_or_create_by(name: "Solicitud de Micro-crédito")

  department_question = form.questions.find_or_create_by(text: "Departamento") { |q| q.question_type = :dropdown }
    department_question.question_options.find_or_create_by(text: "Cundinamarca")
    department_question.question_options.find_or_create_by(text: "Boyaca")
    department_question.question_options.find_or_create_by(text: "Meta")
    department_question.question_options.find_or_create_by(text: "Antioquia")
    department_question.question_options.find_or_create_by(text: "Nariño")

  municipality_question = form.questions.find_or_create_by(text: "Municipio") { |q| q.question_type = :dropdown }
    municipality_question.question_options.find_or_create_by(text: "Cáceres")
    municipality_question.question_options.find_or_create_by(text: "Caucasia")
    municipality_question.question_options.find_or_create_by(text: "El Bagre")
    municipality_question.question_options.find_or_create_by(text: "Nechí")
    municipality_question.question_options.find_or_create_by(text: "Tarazá")

  form.questions.find_or_create_by(text: "Número de id de la solicitud") { |q| q.question_type = :input }
  first_name_question = form.questions.find_or_create_by(text: "Nombres y Apellidos") { |q| q.question_type = :input }
  person_id_question = form.questions.find_or_create_by(text: "Cédula") { |q| q.question_type = :input }
  cellphone_question = form.questions.find_or_create_by(text: "Número de celular") { |q| q.question_type = :input }
  email_question = form.questions.find_or_create_by(text: "Correo electrónico") { |q| q.question_type = :input }
  birthday_question = form.questions.find_or_create_by(text: "Fecha de nacimiento") { |q| q.question_type = :date }
  form.questions.find_or_create_by(text: "Edad") { |q| q.question_type = :input }

  gender_question = form.questions.find_or_create_by(text: "Género") { |q| q.question_type = :dropdown }
    gender_question.question_options.find_or_create_by(text: "Hombre")
    gender_question.question_options.find_or_create_by(text: "Mujer")

  form.questions.find_or_create_by(text: "Número de dependientes") { |q| q.question_type = :input }

  health_system_question = form.questions.find_or_create_by(text: "Sistema de salud") { |q| q.question_type = :dropdown }
    health_system_question.question_options.find_or_create_by(text: "Contributivo")
    health_system_question.question_options.find_or_create_by(text: "Subsidiado")
    health_system_question.question_options.find_or_create_by(text: "Ninguno")
    health_system_question.question_options.find_or_create_by(text: "No sabe")

  house_condition_question = form.questions.find_or_create_by(text: "Condición general vivienda") { |q| q.question_type = :dropdown }
    house_condition_question.question_options.find_or_create_by(text: "Buena")
    house_condition_question.question_options.find_or_create_by(text: "Regular")
    house_condition_question.question_options.find_or_create_by(text: "Mala")

  public_services_question = form.questions.find_or_create_by(text: "Servicios públicos") { |q| q.question_type = :checkbox }
    public_services_question.question_options.find_or_create_by(text: "Agua")
    public_services_question.question_options.find_or_create_by(text: "Luz")
    public_services_question.question_options.find_or_create_by(text: "Teléfono")
    public_services_question.question_options.find_or_create_by(text: "Internet")

  adviser_perception_question = form.questions.find_or_create_by(text: "Percepción del asesor") { |q| q.question_type = :dropdown }
    adviser_perception_question.question_options.find_or_create_by(text: "Positiva")
    adviser_perception_question.question_options.find_or_create_by(text: "Negativa")

  form.questions.find_or_create_by(text: "Explicación") { |q| q.question_type = :text }

  economic_activity_question = form.questions.find_or_create_by(text: "Actividad económica") { |q| q.question_type = :checkbox }
    economic_activity_question.question_options.find_or_create_by(text: "Agrícola")
    economic_activity_question.question_options.find_or_create_by(text: "Producción animal")
    economic_activity_question.question_options.find_or_create_by(text: "Mixta")
    economic_activity_question.question_options.find_or_create_by(text: "Comercio")
    economic_activity_question.question_options.find_or_create_by(text: "Servicios")
    economic_activity_question.question_options.find_or_create_by(text: "Otra")

  coherent_activity_question = form.questions.find_or_create_by(text: "Actividad desarrollada está acorde") { |q| q.question_type = :dropdown }
    coherent_activity_question.question_options.find_or_create_by(text: "Sí")
    coherent_activity_question.question_options.find_or_create_by(text: "No")

  water_access_question = form.questions.find_or_create_by(text: "Acceso a fuente de agua") { |q| q.question_type = :dropdown }
    water_access_question.question_options.find_or_create_by(text: "Río")
    water_access_question.question_options.find_or_create_by(text: "Distrito de riesgo")
    water_access_question.question_options.find_or_create_by(text: "Sistema de riesgo")
    water_access_question.question_options.find_or_create_by(text: "Otro")
    water_access_question.question_options.find_or_create_by(text: "No")


  association_existence_question = form.questions.find_or_create_by(text: "Acceso a vías") { |q| q.question_type = :dropdown }
    association_existence_question.question_options.find_or_create_by(text: "Sí")
    association_existence_question.question_options.find_or_create_by(text: "No")

  municipal_associations_question = form.questions.find_or_create_by(text: "Asociaciones en municipio") { |q| q.question_type = :dropdown }
    municipal_associations_question.question_options.find_or_create_by(text: "Sí")
    municipal_associations_question.question_options.find_or_create_by(text: "No")

  form.questions.find_or_create_by(text: "Evidencia fotográfica") { |q| q.question_type = :image }

  # q = form.questions.find_or_create_by(text: "Grupo etnico") { |q| q.question_type = :dropdown }
  #   q.question_options.find_or_create_by(text: "Indigena")
  #   q.question_options.find_or_create_by(text: "Mestizo")
  #   q.question_options.find_or_create_by(text: "Caucasico")
  #
  # q2 = form.questions.find_or_create_by(text: "Musica que le gusta") { |q| q.question_type = :checkbox }
  #   q2.question_options.find_or_create_by(text: "Rock")
  #   q2.question_options.find_or_create_by(text: "Salsa")
  #   q2.question_options.find_or_create_by(text: "Merengue")


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

  # q = form.questions.find_or_create_by(text: "Grupo etnico") { |q| q.question_type = :dropdown }
  #   q.question_options.find_or_create_by(text: "Indigena")
  #   q.question_options.find_or_create_by(text: "Mestizo")
  #   q.question_options.find_or_create_by(text: "Caucasico")
  #
  # q2 = form.questions.find_or_create_by(text: "Musica que le gusta") { |q| q.question_type = :checkbox }
  #   q2.question_options.find_or_create_by(text: "Rock")
  #   q2.question_options.find_or_create_by(text: "Salsa")
  #   q2.question_options.find_or_create_by(text: "Merengue")


# end
