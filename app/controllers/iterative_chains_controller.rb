class IterativeChainsController < ApplicationController
  before_filter :locked_chain
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

  # POST Create new user entry /iterative_chains/:iterative_chain_id/finish
  # Update chain by adding new user entry
  def finish
    @iterative_chain = IterativeChain.find(params[:id])
    @user_entry = @iterative_chain.user_entries.create

    # print params[:testing_pairs]
    @param_pairs = params[:testing_pairs]
    @pairs_to_save = []

    # print "TESTING ---------------------------"
    @param_pairs.each do |pair|
      # print pair["sound"]
      # print "\n"
      # print pair["image"]
      @pairs_to_save.push(Hash[:sound => pair["sound"], :image => pair["image"]])
      # print "CYCLE LOOP ---------------------------"
    end

    # print @pairs_to_save
    @user_entry.pairs = @pairs_to_save

    @user_entry.save!
    @iterative_chain.save!
  end

  private
    def locked_chain
      @iterative_chain = IterativeChain.find(params[:id])
      redirect_to root_url, notice: 'Sorry, this chain is not available at this time. Please try again later.' if @iterative_chain.locked
    end
end
