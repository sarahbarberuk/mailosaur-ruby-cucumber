require 'mailosaur'
require 'dotenv/load'
require 'rspec/expectations'
include RSpec::Matchers

@client = nil
@message = nil
@server_id = nil

Given("Mailosaur API client is setup") do
  api_key = ENV['MAILOSAUR_API_KEY']
  @server_id = ENV['MAILOSAUR_SERVER_ID']

  expect(api_key).not_to be_nil, 'MAILOSAUR_API_KEY must be set'
  expect(api_key.strip).not_to be_empty, 'MAILOSAUR_API_KEY must not be empty'

  expect(@server_id).not_to be_nil, 'MAILOSAUR_SERVER_ID must be set'
  expect(@server_id.strip).not_to be_empty, 'MAILOSAUR_SERVER_ID must not be empty'
  
  @client = Mailosaur::MailosaurClient.new(api_key)
  expect(@client).not_to be_nil
end

When("I search for an SMS sent to {string}") do |phone_number|
  criteria = Mailosaur::Models::SearchCriteria.new
  criteria.sent_to = phone_number

  @message = @client.messages.get(@server_id, criteria)
end

Then("that SMS should be sent from {string}") do |expected_number|
  expect(@message).not_to be_nil
  expect(@message.from.first.phone).to eq(expected_number)
end
