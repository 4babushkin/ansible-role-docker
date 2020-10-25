Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v|
      v.memory = 512
    end
    
    config.vm.define "appserver" do |app|
      app.vm.box = "ubuntu/bionic64"
      app.vm.hostname = "appserver"
      app.vm.network :private_network, ip: "10.10.10.20"
  
      app.vm.provision "ansible" do |ansible|
        ansible.playbook = "tests/role.yml"
        # ansible.verbose = "v"
        #ansible.tags=""
        ansible.groups = {
        "localhost" => ["appserver"],
        "localhost:vars" => { "docker_user" => "vagrant"}
        }
        ansible.extra_vars = {
            ansible_python_interpreter: "/usr/bin/python3",
        }
  
      end
  
    end
  end
