require 'config_env'
require 'aws-sdk'

ConfigEnv.path_to_config("#{__dir__}/config/config_env.rb")

sqs = Aws::SQS::Client.new
q_url = sqs.get_queue_url(queue_name: 'SOA_queue').queue_url

q_response = sqs.receive_message(queue_url: q_url)
msg = q_response.messages.first

# process the message here
puts msg
# process end

resp = sqs.delete_message(
  queue_url: q_url,
  receipt_handle: msg.receipt_handle)
