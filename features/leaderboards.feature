Feature: Leaderboards
  In order to see full lists for new, most downloaded, and recently updated gems
  A user
  Should be able to navigate to those lists from the homepage

  Scenario: User navigates to the most downloaded list from the homepage
    Given I am on the homepage
    When I follow "Most Downloaded" 
    Then I should be on the most downloaded list

  Scenario: User navigates to the new gems list from the homepage
    Given I am on the homepage
    When I follow "New Gems" 
    Then I should be on the new gems list

  Scenario: User navigates to the just updated list from the homepage
    Given I am on the homepage
    When I follow "Just Updated" 
    Then I should be on the just updated list
