# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts
  end

  def show
    @account = current_user.accounts.find(params[:id])
  end

  def new
    @account = current_user.accounts.new
  end

  def create
    result = Accounts::Creator.call(account_params)
    app_render(result, redirect_url: account_url(result), return_action: :new)
  end

  private

  def account_params
    params.require(:account).permit(:user_id, :credit_currency)
  end
end
