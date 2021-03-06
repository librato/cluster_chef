ClusterChef.cluster 'demohadoop' do
  use :defaults
  setup_role_implications

  role                  "big_package"

  cloud do
    backing             "instance"
    image_name          "maverick"
    region              "us-east-1"
  end

  facet :master do
    instances           1
    role                "nfs_server"
    role                "hadoop"
    role                "hadoop_s3_keys"
    role                "hadoop_master"
    recipe              'hadoop_cluster::bootstrap_format_namenode'
    role                "hadoop_initial_bootstrap"
    cloud.flavor        "m2.xlarge"
  end

  facet :worker do
    instances           2
    role                "nfs_client"
    role                "hadoop"
    role                "hadoop_s3_keys"
    role                "hadoop_worker"
    cloud.flavor        "c1.xlarge"
  end

  chef_attributes({
      :cluster_size => facet('worker').instances,
    })
end
