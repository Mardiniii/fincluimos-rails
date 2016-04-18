class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @collectors = current_user.company.users.where(role: 2)
    @forms = current_user.company.forms
    @pie_chart = pie_chart_data(@forms)
  end

  private

  def pie_chart_data(forms)
    labels_array = []
    pie_chart_array = []
    forms.each do |form|
      section_color = random_color
      labels_array << { name: form.name, color: section_color }
      pie_chart_array << {
        value: form.form_responses.count,
        color: section_color,
        highlight: section_color,
        label: form.name[0..26]
       }
    end
    [labels_array, pie_chart_array.to_json]
  end

  def random_color
    golden_ratio_conjugate = 0.618033988749895
    h = rand # use random start value
    h += golden_ratio_conjugate
    h %= 1
    color_array = hsv_to_rgb(h, 0.5, 0.95)
    rgb_string = "RGB(#{color_array[0]}, #{color_array[1]}, #{color_array[2]})"
  end

  def hsv_to_rgb(h, s, v)
    h_i = (h*6).to_i
    f = h*6 - h_i
    p = v * (1 - s)
    q = v * (1 - f*s)
    t = v * (1 - (1 - f) * s)
    r, g, b = v, t, p if h_i==0
    r, g, b = q, v, p if h_i==1
    r, g, b = p, v, t if h_i==2
    r, g, b = p, q, v if h_i==3
    r, g, b = t, p, v if h_i==4
    r, g, b = v, p, q if h_i==5
    [(r*256).to_i, (g*256).to_i, (b*256).to_i]
  end

end
