*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library  OperatingSystem
Variables   ../variables/locators/loginLocators.py
Resource    ../resources/loginPageKeywords.robot


*** Test Cases ***
Landing Login Page Test Case
    ${json_data}    load json from file    ./variables/data/loginData.json
    # get browser name and url from json file
    ${browser}    get value from json    ${json_data}  $.Browser
    ${url}    get value from json    ${json_data}   $.URL
    Open Browser    ${url[0]}   ${browser[0]}
    Maximize Browser Window
    Element should contain      ${Header}     ${Text}



Login with valid credentials Test Case
    ${json_data}    load json from file    ./variables/data/loginData.json
    Enter valid credentials and hit login button
    Sleep    4s
    ${product_Text_Verification}    get value from json    ${json_data}    $.ProductText
    Element should contain   ${Dashboard_Title}  ${product_Text_Verification[0]}
    Close Browser