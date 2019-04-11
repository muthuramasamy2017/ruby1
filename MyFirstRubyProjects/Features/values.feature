Feature: To verify the correctness of the values in values screen

  Background: The user is already in the values screen
    Given I am on the excercisel values page
    When I check the values

  Scenario: To verify whether the right number of values appear on the screen
    Then I should see the right number of values appear on the screen

  Scenario:  To verify that the values in the screen are greater than zero and formatted in currency
    Then The values should be greater than zero
    And The values should be formatted in currency

  Scenario: To verify that the Total Balance is equal to the sum of the values
    Then The Total Balance is equal to the sum of the values











