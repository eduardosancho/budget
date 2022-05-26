class OperationsController < ApplicationController
  load_and_authorize_resource

  before_action :set_category, only: %i[new_two show create_two]

  def index
    @page_title = 'Transactions'
    @operations = current_user.operations
  end

  def show
    @page_title = 'Transactions'
    render layout: 'categories_show'
  end

  def new
    @page_title = 'Transactions'
    @operation = Operation.new
    @categorization = Categorization.new
  end

  def new_two
    @page_title = 'Transactions'
    @operation = Operation.new
    @categorization = Categorization.new
  end

  def create
    @operation = Operation.new(operation_params)
    @category = Category.find_by(name: params[:categorization][:category])
    @categorization = Categorization.new
    @operation.author = current_user
    respond_to do |format|
      if @operation.save
        @categorization.operation = @operation
        @categorization.category = @category
        @categorization.save
        flash[:success] = 'Transaction has been created successfully'
        format.html { redirect_to operations_url }
      else
        flash[:danger] = 'Error: Transaction could not be created'
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def create_two
    @operation = Operation.new(operation_params)
    @categorization = Categorization.new
    @operation.author = current_user
    respond_to do |format|
      if @operation.save
        @categorization.operation = @operation
        @categorization.category = @category
        @categorization.save
        flash[:success] = 'Transaction has been created successfully'
        format.html { redirect_to category_url(@category) }
      else
        flash[:danger] = 'Error: Transaction could not be created'
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
