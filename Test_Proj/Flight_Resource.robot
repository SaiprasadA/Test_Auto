*** Settings ***
Resource          ../Flight_POM/Flight_page.robot


*** Keywords ***
Go To Flight Rader Page
    Navigate to Flightradar Page

Get the Flight details
    [Arguments]                                ${city_name}
    Click on Arriavls Link
    Get Arriavl Flight City Details           ${city_name}