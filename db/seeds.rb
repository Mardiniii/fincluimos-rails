if Rails.env.development?
  User.find_or_create_by(email: 'sebas@kaizendevs.com') { |u| u.password =  "holamama"; u.role = :superadmin }

  company = Company.find_or_create_by(name: "Kaizen Devs")
  admin = company.users.find_or_create_by(email: "admin@kforms.com") { |u| u.password = "password"; u.role = :admin }
  info_collector = company.users.find_or_create_by(email: "info_collector@kforms.com") { |u| u.password = "password"; u.role = :info_collector }

#  form = company.forms.create(name: "Solicitud de Micro-crédito")
#  form.questions.create([
#    { text: "" }
#  ])
end
