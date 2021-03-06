module Sonic
  module AwsServices
    def ecs
      @ecs ||= Aws::ECS::Client.new
    end

    def ec2
      @ec2 ||= Aws::EC2::Client.new
    end

    def ec2_resource
      @ec2_resource ||= Aws::EC2::Resource.new
    end

    def ssm
      @ssm ||= Aws::SSM::Client.new
    end
  end
end
