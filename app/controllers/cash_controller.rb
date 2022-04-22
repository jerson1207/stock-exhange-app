class CashController < ApplicationController

  def withdraw
    if params[:number].to_i
      amount = params[:number].to_i
      if amount > 0
        if current_user.cash >= amount
          current_user.cash = current_user.cash - amount
          current_user.save
          withdraw = Withdraw.new(amount: amount)
          withdraw.save
          TransactionWithdraw.create(user_id: current_user.id, withdraw_id: withdraw.id)
          flash[:notice] = "$#{amount} Withdraw Successful"
          redirect_to root_path
        else
          flash[:notice] = "Insuffecient Cash"
        redirect_to root_path
        end

      else
        flash[:alert] = "Withdraw should be greated than $0"
      end
    else
      flash[:alert] = "Amount should be greated than $0"
      redirect_to root_path
    end
    
  end

  def deposit
    if params[:number].present?
      amount = params[:number].to_i
      if amount > 0
        current_user.cash = current_user.cash + amount
        current_user.save
        deposit = Deposit.new(amount: amount)
        deposit.save
        TransactionDeposit.create(user_id: current_user.id, deposit_id: deposit.id)
        flash[:notice] = "$#{amount} Deposit Successful"
        redirect_to root_path
      else
        flash[:alert] = "Deposit should be greater than $0"
        redirect_to root_path
      end
    else
      flash[:alert] = "Can't be blank"
      redirect_to root_path
    end
  end

end