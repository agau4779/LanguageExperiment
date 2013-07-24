class UserEntry < ActiveRecord::Base
  attr_accessible :created_at, :updated_at, :pairs, :iterative_chain_id
  belongs_to :iterative_chain
  serialize :pairs,Array

  validates_presence_of :iterative_chain_id, :pairs
  validate :all_files_exist

  private

  def all_files_exist
    begin
      arr = eval(self.pairs)
      arr.each do |p|
        if Image.find(p[:image]).nil?
          errors.add :base, "Image file #{p[:image]} doesn't exist"
          return
        end

        if Sound.find(p[:sound]).nil?
          errors.add :base, "Sound file #{p[:sound]} doesn't exist"
          return
        end
      end
    rescue SyntaxError, NameError, TypeError
      errors.add :base, "Pairs are not in the correct format."
    end
  end
end
