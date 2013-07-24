ActiveAdmin.register UserEntry do
  menu priority: 2

  form do |f|
    f.inputs 'User Entries' do
      f.semantic_errors *f.object.errors.keys
      f.input :iterative_chain
      f.input :pairs
    end
    f.actions
  end
end
