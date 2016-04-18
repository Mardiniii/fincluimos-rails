company = Company.find_or_create_by(name: "Kaizen Devs")

form = company.forms.find_or_create_by(name: "Perfilación de crédito - Corregimiento de Yarumal")
form1 = company.forms.find_or_create_by(name: "Perfilación de crédito - Corregimiento de Pance")
form2 = company.forms.find_or_create_by(name: "Perfilación de crédito - Corregimiento de Villamaria")

100.times do |x|
  random_number = Faker::Number.number(2).to_i
  date = Faker::Time.between(DateTime.now - 4.months, DateTime.now)
  random_number.times do |y|
    form.form_responses.create(created_at: date)
  end
end

50.times do |x|
  random_number = Faker::Number.number(2).to_i
  date = Faker::Time.between(DateTime.now - 8.months, DateTime.now - 4.months)
  random_number.times do |y|
    form1.form_responses.create(created_at: date)
  end
end

25.times do |x|
  random_number = Faker::Number.number(2).to_i
  date = Faker::Time.between(DateTime.now - 1.year, DateTime.now - 8.months)
  random_number.times do |y|
    form2.form_responses.create(created_at: date)
  end
end
