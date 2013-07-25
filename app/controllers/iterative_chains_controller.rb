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
  
  # GET Testing /iterative_chains/:iterative_chain_id/testing
  def testing
    @iterative_chain = IterativeChain.find(params[:id])
    @last_user_entry = @iterative_chain.user_entries.last
    
    @sems = []
    @phones = []
    
    # Construct array of sounds and array of images
    @last_user_entry.pairs.each do |pair|
      @sems = @sems.push(pair[:image])
      @phones = @phones.push(pair[:sound])
    end
    
    # Randomly sort the stimuli
    @sems = @sems.shuffle
    @phones = @phones.shuffle
    
    @phone_to_sem = false
    if (@iterative_chain.user_entries.size % 2) == 0
      @phone_to_sem = true
    end
  end
  
  # Update chain by adding new user entry
  def finish
    @iterative_chain = IterativeChain.find(params[:id])
    @user_entry = @iterative_chain.user_entries.create
    @user_entry.pairs = [
          { sound: "fej", image: "key" },
          { sound: "feej", image: "truck" },
          { sound: "jef", image: "feather" },
          { sound: "jeej", image: "lamp" },
          { sound: "fef", image: "window" },
          { sound: "gaab", image: "rock climbing" },
          { sound: "goob", image: "swimming" },
          { sound: "boog", image: "running" },
          { sound: "baab", image: "jumping on trampoline" },
          { sound: "goog", image: "mopping" }
        ]
    @user_entry.save!
    @iterative_chain.save!
  end
end
