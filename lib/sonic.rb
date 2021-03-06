$:.unshift(File.expand_path("../", __FILE__))
require "sonic/version"
require "aws-sdk"
require "colorize"

module Sonic
  autoload :AwsServices, 'sonic/aws_services'
  autoload :CLI, 'sonic/cli'
  autoload :Command, 'sonic/command'
  autoload :Docker, 'sonic/docker'
  autoload :Execute, 'sonic/execute'
  autoload :List, 'sonic/list'
  autoload :Settings, 'sonic/settings'
  autoload :Ssh, 'sonic/ssh'
  autoload :UI, 'sonic/ui'
  autoload :Checks, 'sonic/checks'
end
