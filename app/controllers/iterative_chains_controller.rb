class IterativeChainsController < ApplicationController
  # GET /iterative_chains
  # GET /iterative_chains.json
  def index
    @iterative_chains = IterativeChain.all
  end

  # GET /iterative_chains/1
  # GET /iterative_chains/1.json
  def show
    @iterative_chain = IterativeChain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iterative_chain }
    end
  end
  
  # GET Training /iterative_chains/:iterative_chain_id/training
  def training
    @iterative_chain = IterativeChain.find(params[:id])
    @user_entry = @iterative_chain.user_entries.last
    @stimuli = @user_entry.pairs
  end
  
end
