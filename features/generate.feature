Feature: Generate code
  In order to generate code
  As a developer
  I want to use a command line interface

  Scenario: Generate a project with the generate command
    When I run `gen generate foo bar` interactively
    And I type "The purpose is to sparkle and shine."
    And I type "You have never seen foo bar like this before and, trust me, you want some of this."
    And I type "Yehuda Katz"
    And I type "yehuda@katz.com"
    And I type "http://www.katz.com/foobar"
    And I type "do_bar"

    Then the exit status should be 0
    And a directory named "bar" should exist

    And a directory named "bar/bin" should exist
    And a file named "bar/bin/do_bar" should exist

    And a directory named "bar/lib" should exist

    And a file named "bar/.gitignore" should exist
    And the file "bar/.gitignore" should contain "*.gem"

    And a file named "bar/README.rdoc" should exist

    And a file named "bar/MIT-LICENSE" should exist
    And the file "bar/MIT-LICENSE" should contain "Copyright (c) 2012 Yehuda Katz"

    And a file named "bar/bar.gemspec" should exist
    And the output should contain "Summarize this gem's purpose"
    And the file "bar/bar.gemspec" should contain "The purpose is to sparkle and shine."
    And the output should contain "Fully describe the purpose of this gem"
    And the file "bar/bar.gemspec" should contain "You have never seen foo bar like this before and, trust me, you want some of this."
    And the output should contain "Who is the author of this gem?"
    And the file "bar/bar.gemspec" should contain "Yehuda Katz"
    And the output should contain "What is the author's email?"
    And the file "bar/bar.gemspec" should contain "yehuda@katz.com"
    And the output should contain "What is this gem's home page?"
    And the file "bar/bar.gemspec" should contain "http://www.katz.com/foobar"
    And the output should contain "If this gem has an executable command, enter it now, otherwise press return."
    And the file "bar/bar.gemspec" should contain "do_bar"

  Scenario: Generate a project with an empty conditional
    When I run `gen generate foo bar` interactively
    And I type "The purpose is to sparkle and shine."
    And I type "You have never seen foo bar like this before and, trust me, you want some of this."
    And I type "Yehuda Katz"
    And I type "yehuda@katz.com"
    And I type "http://www.katz.com/foobar"
    And I type ""

    Then the exit status should be 0
    And a directory named "bar" should exist
    And a directory named "bar/bin" should not exist

  Scenario: Generate a project with generate as the default command
    When I run `gen simple` interactively
    Then the exit status should be 0
    And a file named "test.txt" should exist
