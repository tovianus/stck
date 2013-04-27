Feature: Add, disable user
  Modules to add disable authorise user
  Background: User allowed to input data to web is maintained in local and data then sent to web. Maintenance using activeadmin
  Scenario: show latest request
  Scenario: show latest approval
  Scenario: show latest registered
  Scenario: show latest printed
  Scenario: show latest messaging activites

Feature: Receive request from web using gtalk
  Module to send stck request from web

Background: receive request through gtalk with certain keyword
  The request should consist 
    keyword: new | update | delete
    detail: all fields

  Scenario: key 'new' request
    When the id is not in table
    And  noka is not in table
    Then should insert to table
    And  send date-time accepted

  Scenario: key 'update' request with valid id
    When the id is in table
      And noka is same
    Then should update the record
      And send date-time accepted

  Scenario: key 'delete' request
    When the id is in table
      And noka is same
      And tgl_register is empty
    Then should delete the request

Feature: Send progress report

#  Scenario: send received status => included in feature "Receive request from web using gtalk"
Background: field updated_at is changed

  Scenario: send registered status
    When field registered is changed
    Then send id, registered_at to web
      And record date-time to registered_at_sent

  Scenario: send approved status
    When field approved_at is changed
    Then send id, approved_at to web
      And record date-time to approved_at_sent

  Scenario: send printed status
    When field printed_at is changed
    Then send id, printed_at to web
      And record date-time to printed_at_sent

