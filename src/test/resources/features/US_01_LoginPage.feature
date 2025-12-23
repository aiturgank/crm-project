Feature: As a user, I should be able to login.

  Background: User is already on the login page
    Given user is on the login page

  @smoke
  Scenario Outline: Verify that <userType> user can log in with valid credentials and land on the home page after
    successful login.
    When user logs in as "<userType>"
    Then user should be able to see "Portal" as page title
    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |

  Scenario Outline: Verify that "Incorrect login or password" error message is displayed for invalid credentials.
    When user logs in with username as "<username>" and password as "<password>"
    Then user should see "Incorrect login or password" error message
    Examples:
      | username          | password |
      | hr15@cydeo.com    | invalid  |
      | invalid@cydeo.com | UserUser |
      | invalid@cydeo.com | invalid  |

  Scenario Outline: Verify that the "Please fill out this field" error message is displayed if the password or username is empty.
    When user logs in with username as "<username>" and password as "<password>"
    Then user should see "Please fill out this field" error message
    Examples:
      | username       | password |
      |                | UserUser |
      | hr15@cydeo.com |          |
      |                |          |

  Scenario: Verify that the "Remember me on this computer" link exists and is clickable on the login page.
    And user should see Remember me on this computer link visible
    And user click the Remember me on this computer link
    Then Remember me on this computer link should be selected

  Scenario: Verify that the password is in bullet signs by default.
    When user enters "randomPassword" to password field
    Then password field should display characters as bullet signs