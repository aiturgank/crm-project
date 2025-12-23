@wip
Feature: User uploads files and pictures as messages
  User on the Active Stream page

  As a user, I should be able to upload files and pictures as messages

  @smoke
  Scenario Outline:User uploads supported file types
    When user logs in as "<userType>"
    And the user is on the message input screen
    And the user clicks on the upload icon
    Given the user selects the Upload files and images option and the user chooses a valid "<fileType>" file


    Examples:
      | userType  | fileType |
      | hr        | pdf      |
      | hr        | txt      |
      | hr        | jpeg     |
      | hr        | png      |
      | hr        | docx     |
      | helpdesk  | pdf      |
      | helpdesk  | txt      |
      | helpdesk  | jpeg     |
      | helpdesk  | png      |
      | helpdesk  | docx     |
      | marketing | pdf      |
      | marketing | txt      |
      | marketing | jpeg     |
      | marketing | png      |
      | marketing | docx     |


  Scenario Outline: User inserts an uploaded file or image into the text
    When user logs in as "<userType>"
    And the user is on the message input screen
    And the user should be able to type a message alongside the uploaded file
    And the user clicks on the upload icon
    Given the user has uploaded a valid file
    When the user clicks the Insert in Text button
    Then the uploaded file should be displayed in the message input field

    Examples:
      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |


  Scenario Outline: User removes an uploaded file or image before sending
    When user logs in as "<userType>"
    And the user is on the message input screen
    And the user should be able to type a message alongside the uploaded file
    And the user clicks on the upload icon
    Given the user has uploaded a valid file
    When the user clicks the Insert in Text button
    When the user clicks the Remove icon next to the uploaded file or image
    Then the file or image should be removed from the message input field
    Examples:

      | userType  |
      | hr        |
      | helpdesk  |
      | marketing |
