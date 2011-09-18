Feature: Generate code
  In order to generate code
  As a developer
  I want to use a command line interface

  Scenario: Generate a project
    When I run `gen generate foo`
    Then the exit status should be 0
    And a directory named "foo" should exist
    And a directory named "foo/lib" should exist
