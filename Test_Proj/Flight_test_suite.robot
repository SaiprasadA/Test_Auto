*** Settings ***
Resource         Flight_Resource.robot
Test Setup       Suite Setup
Test Teardown    Suite Teardown


*** Test Cases ***
Validate the Flights Arrivals Section
    [Tags]              Test
    Go To Flight Rader Page
    Get the Flight details          Bengaluru