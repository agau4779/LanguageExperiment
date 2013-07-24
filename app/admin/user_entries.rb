ActiveAdmin.register UserEntry do
  menu priority: 2

  form do |f|
    f.inputs 'User Entries' do
      f.semantic_errors *f.object.errors.keys
      f.input :iterative_chain, :collection => IterativeChain.all.map {|u| [u.id]}, :include_blank => false
      f.input :pairs
    end
    f.actions
  end
end
