# Using Cucumber and Ruby to test the Mailosaur API

## How to run the tests

### Ruby setup

1. Install Ruby

```
sudo apt update
sudo apt install ruby-full
ruby -v
gem -v
```

2. Install Bundler, Ruby dependency manager

```
gem install --user-install bundler
export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/ruby/3.0.0/bin:$PATH"
bundle -v
```

3. Install library dependencies (gems) from Gemfile

```
bundle install
```

### Mailosaur setup

1. Create a Mailosaur account on mailosaur.com
2. Get your API key and server ID
3. Create a .env file from .env.template and enter the correct environment variables

### Email testing setup

1. Create an email inbox in Mailosaur and give it a name
2. Send an email to the Mailosaur inbox and verify it arrived in the Mailosaur webapp's inbox.
3. In email.feature file, update any varialbes to match the email you sent - e.g. change no-reply@acme.com to your own email address.

### SMS testing setup

1. Go to "SMS" in the left side navigation of the Mailosaur app
2. Click "Get stated now"
3. Request access to get a test number created - you may have to wait until they've emailed you asking why and you've given a reason.
4. Back in SMS section, set up a number and link it to the same inbox used for emails.
5. Send that number an SMS and check it enters the inbox in the Mailosaur app.
6. In sms.feature file, update any variables to match the phone number the message was sent from and to. Don't include any pluses - e.g. "+447700000000" should be "447700000000".

### Runnng the Cucumber tests

Run the tests with `bundle exec cucumber`

## What about the stuff in the docs that's not very Cucumber-specific?

This includes:

- Test email addresses
- Find an email
- Time range for searching
- "No matching messages" troubleshooting
- Other ways to fetch emails
- List current inbox contents
- Searching for multiple messages
- Common test scenarios
- Testing basic properties
- Testing carbon-copy recipients
- Testing email contents
- Plain text content
- HTML content
- Testing links
- Clicking a link
- Testing verification codes
- Testing attachments
- Save an attachment to disk
- Encoding attachments
- Testing images and web beacons
- Sending an email
- Include attachments
- Replying to an email
- Forwarding a message to email
- Deleting messages
- Deleting an individual message
- Delete all messages

  ALL THIS CAN JUST BE COPIED FROM THE SELENIUM EMAIL TESTING DOCS, USING THE RUBY CODE EXAMPLES. AS IT'S NOT TEST-FRAMEWORK-SPECIFIC.
