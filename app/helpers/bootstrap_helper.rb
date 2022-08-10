module BootstrapHelper
  def bootstrap_icon(name, options = {})
    content_tag(:i, nil, class:"bi bi-#{name} #{options[:class]}")
  end
end
