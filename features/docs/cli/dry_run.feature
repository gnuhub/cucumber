Feature: Dry Run
  - Invokes formatters without executing the steps.
  - This also omits the loading of your support/env.rb file if it exists.

  Scenario: With a failing step
    Given a file named "features/test.feature" with:
      """
      Feature: test
        Scenario:
          Given this step fails
      """
    And the standard step definitions
    When I run `cucumber --dry-run`
    Then it should pass with exactly:
      """
      Feature: test

        Scenario:               # features/test.feature:2
          Given this step fails # features/step_definitions/steps.rb:4

      1 scenario (1 skipped)
      1 step (1 skipped)
      0m0.012s

      """
