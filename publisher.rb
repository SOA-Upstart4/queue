require 'config_env'
require 'aws-sdk'

ConfigEnv.path_to_config("#{__dir__}/config/config_env.rb")

sqs = Aws::SQS::Client.new
q_url = sqs.get_queue_url(queue_name: 'SOA_queue').queue_url

msg = { usernames: ['chenlizhan', 'soumya.ray'],
        badges: ['Object-Oriented Programming II'] }

msg_sent = sqs.send_message(queue_url: q_url, message_body: msg.to_json)
