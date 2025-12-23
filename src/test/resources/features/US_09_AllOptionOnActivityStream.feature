Feature: Verify Activity Stream options
  As a user, I should be able to see all the options on the Activity Stream page.


  @smoke
  Scenario Outline: Verify that "<userType>" views the following options on the Activity Stream page
    Given user logs in as "<userType>"
    When  the user is on the Activity Stream page
    And the user verifies that the  feed options are visible on the page
    Then the user verifies  the following feed options are as expected:
      | MESSAGE |
      | TASK    |
      | EVENT   |
      | POLL    |
      | MORE    |
    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |



  Scenario Outline: Verify that the "<userType>" views the following 4 options under the MORE tab.
    Given user logs in as "<userType>"
    When the MORE tab is displayed on the Activity Stream page
    And the user clicks on the MORE tab
    Then verify the following 4 options are visible under the MORE tab as expected
      | File         |
      | Appreciation |
      | Announcement |
      | Workflow     |
    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |
