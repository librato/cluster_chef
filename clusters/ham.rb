# Note that this file is retro-experimental. The original ham was set up with poolparty.

ClusterChef.cluster 'ham' do
  use :defaults
  setup_role_implications
  
  cloud do 
    backing "instance"
    flavor  "m1.xlarge"
    image_name "infochimps-maverick-client"
    user_data :get_name_from => 'broham'
  end

  facet 'alpha' do
    instances 1
    role "hbase_alpha"
    server 0 do
      chef_node_name "ham-alpha"
    end
  end

  facet 'beta' do
    instances 1
    role "hbase_beta"
    server 0 do
      chef_node_name "ham-beta"
    end
  end
  
  facet 'gamma' do
    instances 3
    role "hbase_gamma"
  end

  facet 'delta' do
    instances 3
    role "hbase_delta"
  end

end

