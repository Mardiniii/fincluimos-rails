module PagesHelper

  def last_12_months(count=13)
    count.times.map { |i| (Date.today - (i).month) }.reverse
  end

  def past_year_forms(forms)
    forms_array = []
    last_12_months.each do |month|
      monthly_forms = forms.where(created_at: month.beginning_of_month..month.end_of_month + 1.day)
      forms_array.push(forms.empty? ? 0 : monthly_forms)
    end
    forms_array
  end

  def monthly_form_responses(forms)
    past_year_forms(forms).map { |f| f != 0 ? f.sum(:form_responses_count).to_i : 0 }
  end

end
