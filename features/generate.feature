Feature: Generate code
  In order to generate code
  As a developer
  I want to use a command line interface

  Scenario: Generate a project
    When I run `gen generate foo bar` interactively
    And I type "The purpose is to sparkle and shine."
    And I type "You have never seen foo bar like this before and, trust me, you want some of this."
    And I type "Yehuda Katz"
    And I type "yehuda@katz.com"
    And I type "http://www.katz.com/foobar"
    And I type "bar"
    Then the output should contain "Summarize this gem's purpose"
    And a file named "bar/bar.gemspec" should exist
    And the file "bar/bar.gemspec" should contain "The purpose is to sparkle and shine."
    And the output should contain "Fully describe the purpose of this gem"
    And the exit status should be 0
    And a directory named "bar" should exist
    And a directory named "bar/lib" should exist
    And a file named "bar/.gitignore" should exist
    And the file "bar/.gitignore" should contain "*.gem"
    And a file named "bar/README.rdoc" should exist
    And a file named "bar/MIT-LICENSE" should exist
    And the file "bar/MIT-LICENSE" should contain "Copyright (c) 2012 Yehuda Katz"

  Scenario: Generate a project
    When I run `gen foo bar` interactively
    And I type "The purpose is to sparkle and shine."
    And I type "You have never seen foo bar like this before and, trust me, you want some of this."
    And I type "Yehuda Katz"
    And I type "yehuda@katz.com"
    And I type "http://www.katz.com/foobar"
    And I type "bar"
    Then the output should contain "Summarize this gem's purpose"
    And the output should contain "Fully describe the purpose of this gem"
    And the exit status should be 0
    And a directory named "bar" should exist
    And a directory named "bar/lib" should exist
    And a file named "bar/.gitignore" should exist
    And the file "bar/.gitignore" should contain "*.gem"
    And a file named "bar/README.rdoc" should exist
    And a file named "bar/MIT-LICENSE" should exist
    And the file "bar/MIT-LICENSE" should contain "Copyright (c) 2012 Yehuda Katz"
