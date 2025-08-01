require 'mailosaur'
require 'dotenv/load'
require 'rspec/expectations'

@client = nil
@email_servers = nil

Given('a Mailosaur API key is configured') do
  @api_key = ENV['MAILOSAUR_API_KEY']
  expect(@api_key).not_to be_nil
  expect(@api_key.strip).not_to be_empty, 'MAILOSAUR_API_KEY must not be empty'
end

When('I connect to the Mailosaur API') do
  @client = Mailosaur::MailosaurClient.new(@api_key)
  @email_servers = @client.servers.list.items
end

Then('I should see at least one inbox') do
  expect(@email_servers).not_to be_nil
  expect(@email_servers).not_to be_empty
end
