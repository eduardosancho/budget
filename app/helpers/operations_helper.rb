module OperationsHelper
  def category_operations?(category)
    out = ''
    if category.operations.empty?
      out << "<p class=\'align-self-center mt-5\'>This category has no transactions registered</p>"
    end
    out.html_safe
  end
end
