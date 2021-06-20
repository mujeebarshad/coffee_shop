class UsersController < ApplicationController
  
  def new_customer
  end

  def create_customer
    customer = User.new(user_params)
    if customer.save
      flash[:success] = 'Customer Successfully created'
      redirect_to root_path
    else
      render 'new_customer'
    end
  end

  def list_customers
    return redirect_to root_path if current_user.is_customer?

    @customers = User.all.where(role: User::ROLES[:customer])
  end


  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
  end
end
