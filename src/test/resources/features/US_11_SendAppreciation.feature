Feature: As a user, I should be able to send appreciation by clicking tab in the Activity Stream.

  @smoke
  @B36T5-325
  Scenario Outline: Verify that the user can send an appreciation by filling in the mandatory fields.
    When user logs in as "<userType>"
    Given user clicks on the More dropdown button
    And user selects Appreciation option
    And user clicks on Send Button
    Then user sees the title Error message "The message title is not specified"

    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |

  @B36T5-325
  Scenario Outline: User attempts to send an appreciation without specifying a recipient
    When user logs in as "<userType>"
    Given user clicks on the More dropdown button
    And user selects Appreciation option
    And user removes all recipients
    And user clicks on Send Button
    Then user should see the error message "Please specify at least one person."

    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |

  @B36T5-325
  Scenario Outline: Verify the delivery is 'All Employees' by default
    When user logs in as "<userType>"
    Given user clicks on the More dropdown button
    And user selects Appreciation option
    Then the delivery should be set to All Employees by default

    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |
