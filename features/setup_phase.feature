Feature: Game setup

  Scenario: Setting up the board
    Given the board is setup
    When each player chooses starting settlements
    Then each player should have 2 points

