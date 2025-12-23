
Feature: As a user, I should be able to access my profile page.


  #@login @hr @test
  @smoke
  Scenario Outline: Verify that the user can view the following options on My Profile page.
    Given user logs in as "<userType>"
    When the user is on the My Profile page
    And the "General" section should be visible and accessible
    And the "Drive" section should be visible and accessible
    And the "Tasks" section should be visible and accessible
    And the "Calendar" section should be visible and accessible
    And the "Conversations" section should be visible and accessible
    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |







  Scenario Outline: Verify that the email under the General tab is the same as the user’s account email
    Given user logs in as "<userType>"
    When the user is on the My Profile page
    Then the email under the General tab should match the user’s account email "<email>"
    Examples:
      | userType  | email                 |
      | hr        | hr15@cydeo.com        |
      | helpdesk  | helpdesk15@cydeo.com  |
      | marketing | marketing15@cydeo.com |

