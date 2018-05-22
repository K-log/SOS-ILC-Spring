module ApplicationHelper

	def status_tag(boolean, options={})
		options[:true_text] ||= ''			# Will either be empty '' or will stay the value of :true_text if it exists
		options[:false_text] ||= ''
		
		# Create content tags with text that is either true or false text with the css class status
		if boolean
			content_tag(:span, options[:true_text], :class => 'status true')
		else
			content_tag(:span, options[:false_text], :class => 'status false')
		end
	end

end
