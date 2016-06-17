# pupet-in-docker-nova-api

1. Install docker
2. Get familiar with the instructions at https://github.com/puppetlabs/puppet-rocker-demo
3. Run `rocker build`
4. Run `puppet apply demo.pp` (You'll probably have to run it twice...something to do with docker and systemd that I didn't bother to figure out)
5. `curl localhost:8774`

Quick and dirty validation that containers are possible to build without modification, even with very complex Puppet code.
