class IterativeChainsController < ApplicationController
  
  # If any locks have expired, clear the :lock_id attribute
  # Expiration is over 30 minutes
  def update_locks
    @iterative_chains = IterativeChain.all
    @iterative_chains.each do |chain|
      unless chain[:locked_at] == nil
        if chain[:locked_at] < (DateTime.now - 30.minutes)
          chain[:lock_id] = nil
          chain[:locked_at] = nil
        end
      end
    end
  end
  
  # If there are no unlocked chains, return -1
  # Else, return id of unlocked chain with fewest user entries
  def unlocked_chain
    @iterative_chains = IterativeChain.all
    @chain_id = -1
    
    update_locks
    
    @unlocked = @iterative_chains.select { |chain| chain[:lock_id] == nil }
    
    if @unlocked.empty? == false
      min = @unlocked[0].user_entries.length
      @chain_id = @unlocked[0].id
      
      @unlocked.each_with_index { |chain, index|
        if chain.user_entries.length < min
          min = chain.user_entries.length
          @chain_id = chain.id
        end
      }
    end
    
    return @chain_id
  end
  
  def lock_chain(chain_id)
    @chain = IterativeChain.find(chain_id)
    @chain.lock_id = SecureRandom.urlsafe_base64
    @chain.locked_at = DateTime.now
    @chain.save!
  end
  
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
  
  def start
    @chain_id = unlocked_chain
    if @chain_id != -1
      lock_chain(@chain_id)
    end
  end
  
  # GET Training /iterative_chains/:iterative_chain_id/training
  def training
    @iterative_chain = IterativeChain.find(params[:id])
    @user_entry = @iterative_chain.user_entries.last
    @stimuli = @user_entry.pairs.shuffle
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
end
