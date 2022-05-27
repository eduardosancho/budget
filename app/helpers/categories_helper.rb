module CategoriesHelper
  def categories?
    out = ''
    if current_user.categories.empty?
      out << "<p class=\'align-self-center mt-5\'>This user has no categories registered</p>"
    end
    out.html_safe
  end
end
