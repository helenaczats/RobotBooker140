# Settings e Keywords
*** Settings ***
Library RequestsLibrary

*** Keywords ***
Create Token
    [Arguments]    ${url}

    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST    url=${url}/auth    json=${body}
    
    Status Should Be    200
    ${token}    Set Variable    ${response.json()}[token]
    Set Suite Variable    ${token}
    Log to Console    ${token}
