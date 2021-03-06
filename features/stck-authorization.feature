Feature: Devise
  Module devise for login logout and registering user

  Scenario: Before login
  When user not login
  Then Should redirect to home
    And should see "Login button"
    And should see "login link"
    And should not see any link

  Scenario: After login
  When user logged in
  Then should redirect to Dashboard
    And should see "Selamat datang"
    And should have "logout" link
    And should have "logout" button
    And should see menues for user or administrator

  Scenario: Dashboard for administrator
  When user role is administrator 
    And already logged in
  Then should see movement of requests today (pending,cancelled,approved,registered,printed)
    And see movement of requests month to date (pending,cancelled,approved,registered,printed)
    And list of last 5 pending stck_request
    And list of last 5 approved stck_request
    And list of last 5 registered stck_request
    And list of last 5 printed stck_request
    And refreshed every 1 minute

  Scenario: Administrator menu user
  When role administrator login
  Then should see menu "user"
    And should see menu "perusahaan"


