class AddFormResponseCountToForms < ActiveRecord::Migration
  def change
    add_column :forms, :form_responses_count, :integer, default: 0

    Form.all.each do |form|
      Form.reset_counters(form.id, :form_responses)
    end
  end
end
