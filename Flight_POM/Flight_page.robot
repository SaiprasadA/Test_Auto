*** Setting ***
Library         SeleniumLibrary         implicit_wait=10
Library         String


*** Variable ***
### ************************* XPTHS ************************************
${FLIGHT_URL}                https://www.flightradar24.com/data/airports/pnq
${ARRIVALS_LINK}             //a[@class="btn "][text()=" Arrivals "]
${PAGR_TITLE}                //a//img[@title="Flightradar24 - Flight Tracker"]
${ARRIVALS_LABEL}            //label[text()="Arrivals"]
${BROWSER}                   Chrom
${POPUP_BUTTON}              id="onetrust-accept-btn-handler"

*** Keywords ***
Navigate to Flightradar Page
    Go To                                ${FLIGHT_URL}
    Maximize Browser Window
    Title should be                      Pune Airport (PNQ/VAPO) | Arrivals, Departures & Routes | Flightradar24

Click on Arriavls Link
    Wait until page contains element     ${ARRIVALS_LINK}
    Click Element                        ${POPUP_BUTTON}
    Sleep                                5s
    Click Element                        ${ARRIVALS_LINK}
    Wait until page contains element     ${ARRIVALS_LABEL}

Get Arriavl Flight City Details
    [Arguments]                          ${city_name}
    ${first_flight_time}                 Set Variable
    ...                                  //tr[@class="hidden-xs hidden-sm ng-scope"]//td//span[text()="${city_name} "]/..//..//..//td//span[text()="Estimated"]
    ${status}                            Run Keyword And Return Status
    ...                                  Wait Until Page Contains Element               ${first_flight_time}      60
    ${estimates_time}                    Set Variable If                                '${status}' == 'True'
    ...                                  get text                                        ${first_flight_time}
    Log                                  ${time}
    Run Keyword If                       '${status}' == 'False'
    ...                                  Log    ${city_name} Data not available

Suite Setup
    Open Browser                         https://www.google.com/    Chrome
    Delete All Cookies

Suite Teardown
    Close Browser