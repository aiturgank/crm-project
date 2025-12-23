@wip_anis
Feature: As a user, I should be able to access the Employees page

  @smoke
  Scenario Outline: Checking employee page modules as hr login
    When user logs in as "<userType>"
    When user clicks on Employees page
    Then user should see the following modules
      | Company Structure   |
      | Find Employee       |
      | Telephone Directory |
      | Staff Changes       |
      | Efficiency Report   |
      | Honored Employees   |
      | Birthdays           |
      | New page            |
    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |

  Scenario Outline: Verify Company Structure is selected by default on the Employees page
    When user logs in as "<userType>"
    When user clicks on Employees page
    Then "Company Structure" should be the default selected
    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |