# ***Variables*** ---> resources/variables.py

# ***Settings*** ---> resources/common.resource

# ***Test Cases*** ---> continuam no arquivo .robot

# ***Keywords*** ---> resources/common.resource


# Casos de Teste
*** Settings***
Library       RequestsLibrary
Resource      ../../resources/common.resource
Variables     ../../resources/variable.py  
Suit Setup    Create Token    ${url} 

*** Test Cases ***
Create Booking
    ${header}    Create Dictionary    Content-Type=${content-type}    #Header é opcional neste caso
    ${body}    Evaluete    json.loads(open("./fixtures/json/booking1.json").read())

    ${response}    POST    url=${url}/booking    json=${body}    headers=${headers}
    ...    headers=${headers}
    
    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200    # Validações
    Should Be Equal    ${response_body}[booking][firstname]    Niko
    Should Be Equal    ${response_body}[booking][bookingdates][checkin]    2024-04-27


