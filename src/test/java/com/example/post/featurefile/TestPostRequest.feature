Feature: Verify the Post endpoint

  Background: Setup the test variables
    * def applicationUrl = appUrl

  Scenario: To verify the response of the https://verifye.co.za/response.php
    Given def requestBody = read('data/requestBody.xml')
    # parameterization
    When def aResponse = call read('classpath:com/example/helper/PostRequestHelper.feature') { _url: '#(applicationUrl)', _requestBody: '#(requestBody)' }
    And xmlstring postResponseBody = aResponse.responseDataInString
    # repeatable and reusable functions
    And def isTagNodePresent = call read('classpath:com/example/helper/parser/caller/xml-tag-validator.js') { _xmlcontent: '#(postResponseBody)', _xpath: '/Document/CstmrDrctDbtInitn/GrpHdr' }
    # validation for tags.
    And match isTagNodePresent == true

  Scenario: To verify node value in the response of the https://verifye.co.za/response.php
    # test data
    Given def requestBody = read('data/requestBody.xml')
    When def aResponse = call read('classpath:com/example/helper/PostRequestHelper.feature') { _url: '#(applicationUrl)', _requestBody: '#(requestBody)' }
    And xmlstring postResponseBody = aResponse.responseDataInString
    # repeatable and reusable functions
    And def isValuePresent = call read('classpath:com/example/helper/parser/caller/xml-value-validator.js') { _xmlcontent: '#(postResponseBody)', _xpath: '/Document/CstmrDrctDbtInitn/PmtInf/PmtInfId', _expectedValue: 'PULENG2005'}
    # validation for values.
    And match isValuePresent == true
