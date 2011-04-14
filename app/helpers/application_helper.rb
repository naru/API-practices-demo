module ApplicationHelper

  def error_messages(record)
    if record.errors.any?
      class_name = record.class.name.underscore
      
      concat tag(:div, { class: 'errorExplanation' }, true)

      concat content_tag(:h2, t('errors.template.header', model: t("activerecord.models.#{class_name}")))
      concat content_tag(:p, t('errors.template.body'))

      concat tag(:ul, nil, true)

      record.errors.each do |e, message|
        name = t("activerecord.attributes.#{class_name}.#{e}")
        concat content_tag(:li, "#{message}")
      end
                 
      concat '</ul>'.html_safe
      
      concat '</div>'.html_safe
    end
  end
  
end
