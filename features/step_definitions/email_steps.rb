require 'mailosaur'
require 'dotenv/load'
require 'rspec/expectations'
include RSpec::Matchers

# Instance variables to persist between steps
@client = nil
@message = nil
@server_id = nil

Given('the Mailosaur API client is setup') do
  api_key = ENV['MAILOSAUR_API_KEY']
  @server_id = ENV['MAILOSAUR_SERVER_ID']

  expect(api_key).not_to be_nil, 'MAILOSAUR_API_KEY must be set'
  expect(api_key.strip).not_to be_empty, 'MAILOSAUR_API_KEY must not be empty'

  expect(@server_id).not_to be_nil, 'MAILOSAUR_SERVER_ID must be set'
  expect(@server_id.strip).not_to be_empty, 'MAILOSAUR_SERVER_ID must not be empty'

  @client = Mailosaur::MailosaurClient.new(api_key)
  expect(@client).not_to be_nil
end

When('I search for the {string} email I sent earlier') do |subject|
  criteria = Mailosaur::Models::SearchCriteria.new
  criteria.subject = subject
  @message = @client.messages.get(@server_id, criteria)
end

Then('that email should be sent from {string} at {string}') do |name, email|
  expect(@message.from.first.name).to eq(name)
  expect(@message.from.first.email).to eq(email)
end
