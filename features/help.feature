Feature: Provide accurate help
  In order to interact with the code generator
  I want to view help for all codegens commands
  So I don't have to look else where

  Scenario: High level help
    When I run `gen help`
    Then the exit status should be 0
    And the output should contain "Tasks"
    And the output should contain "gen help [TASK]"
    And the output should contain "gen generate NAME"
    
  Scenario: Generate command help
    When I run `gen help generate`
    Then the output should contain "gen generate NAME"
