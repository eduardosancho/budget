module ApplicationHelper
  def current_class?(test_path)
    return 'nav-link active' if request.path.include? test_path

    'nav-link'
  end

  def form_page?
    return true unless request.path.include? 'new'

    false
  end
end
