module ApplicationHelper  

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  # be able to call status_tag and pass it a boolean as well as any options defined below
  def status_tag(boolean, options={})
    options[:true_text] ||= ''
    options[:false_text] ||=''

    if boolean
      # generate new span tag with helper content_tag (an html helper)
      # span tag will get a class status true and insert in text 
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:false_text], :class => 'status false')
    end
  end
end
