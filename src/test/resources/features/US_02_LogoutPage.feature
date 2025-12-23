@US_02

Feature: As a user, I should be able to logout.

  @smoke
  Scenario Outline: Verify user can log out from the app after clicking the "Log out" button
    When user logs in as "<userType>"
    Then user clicks on the profile dropdown
    Then user clicks the logout button
    And user should be redirected to the login page
    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |



  Scenario Outline: Verify user cannot login back to the app after clicking the "Log out" button with back arrow button
    When user logs in as "<userType>"
    And user clicks on the profile dropdown
    And user clicks the logout button
    And user should be redirected to the login page
    And user clicks on the back arrow button
    And user should to see "Authorization" as page title
    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |


  Scenario Outline: Verify user can see 5 options under the profile name
    When user logs in as "<userType>"
    Then user clicks on the profile dropdown
    And user should be able to see following options under profile name
      | My Profile              |
      | Edit Profile Settings   |
      | Themes                  |
      | Configure notifications |
      | Log out                 |

    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |








