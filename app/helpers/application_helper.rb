module ApplicationHelper

  def home?
  	request.env['PATH_INFO'] == root_path
  end

  def fork_me url
  	link_to url do
  		image_tag "https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png", alt: "Fork me on GitHub", style: "position: absolute; top: 40px; right: 0; border: 0;"
  	end.html_safe
  end

  def tags_links tag_list
  	tag_list.map { |t| link_to t, tag_path(t) }.join(' ').html_safe
  end
end
