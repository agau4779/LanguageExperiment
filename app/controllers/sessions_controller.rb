class SessionsController < ApplicationController
  def new

  end

  def create
    chain = IterativeChain.available.first
    if chain==nil
      flash[:error] = "Sorry- no chains are available at this time. Please try again later."
      render 'new'
    else
      redirect_to training_iterative_chain_path(chain)
    end
  end

  def destroy
  end
end
