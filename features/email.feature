Feature: Email testing with Mailosaur

@emailtest
Scenario: Basic usage
    Given the Mailosaur API key and server ID are set for email test
    When I search for the "test" email I sent earlier
    Then that email should be sent from "Support" at "no-reply@acme.com"