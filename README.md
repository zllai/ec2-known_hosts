# ec2-known_hosts
A script automatically generates ssh known_hosts for all EC2 instances

# dependency

  - [awscli] - AWS commandline tool
  - [jq] - Commandline json parser

# usage
```sh
./ec2-known_hosts.sh >> ~/.ssh/known_hosts
```

# todo
  - Add support to specify instance ID and regions in commandline argument (currently generates known_hosts for all instances in all regions)
  - Add support to backup the original known_hosts file


   [awscli]: <https://docs.amazonaws.cn/en_us/cli/latest/userguide/cli-chap-install.html>
   [jq]: <https://stedolan.github.io/jq/>

