module CategoriesHelper
  def categories?
    out = ''
    out << "<p class=\'align-self-center mt-5\'>This user has no categories registered</p>" if current_user.categories.empty?
    out.html_safe
  end
end
