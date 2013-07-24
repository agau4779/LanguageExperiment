ActiveAdmin.register UserEntry do
  menu priority: 2

  index do
    column :id
    column :iterative_chain_id
    column :created_at
    column :updated_at
    default_actions
  end

  show do |f|
    attributes_table do
      row :iterative_chain_id do
        f.iterative_chain_id
      end
      row :pairs do
        f.pairs
      end
      row :created_at do
        f.created_at
      end
      row :updated_at do
        f.updated_at
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'User Entries' do
      f.semantic_errors *f.object.errors.keys
      f.input :iterative_chain, :collection => IterativeChain.all.map {|u| [u.id]}, :include_blank => false
      f.input :pairs
    end
    f.actions
  end
end
