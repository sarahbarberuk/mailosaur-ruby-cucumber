require 'mailosaur'
require 'dotenv'
require 'rspec/expectations'

Dotenv.load

api_key = ENV['MAILOSAUR_API_KEY']
client = nil
email_servers = []

Given('a Mailosaur API key is configured') do
  expect(api_key).not_to be_nil
end

When('I connect to the Mailosaur API') do
  client = Mailosaur::MailosaurClient.new(api_key)
  email_servers.replace(client.servers.list.items)
end

Then('I should see at least one inbox') do
  expect(email_servers).not_to be_nil
  expect(email_servers).not_to be_empty
end
