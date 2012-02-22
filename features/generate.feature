Feature: Generate code
  In order to generate code
  As a developer
  I want to use a command line interface

  Scenario: Generate a project
    When I run `gen generate foo bar`
    Then the exit status should be 0
    And a directory named "bar" should exist
    And a directory named "bar/lib" should exist
    And a file named "bar/.gitignore" should exist
    And the file "bar/.gitignore" should contain "*.gem"
    And a file named "bar/README.rdoc" should exist
    And a file named "bar/MIT-LICENSE" should exist
    And the file "bar/MIT-LICENSE" should contain "Copyright (c) 2011 Yehuda Katz"
