*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library  OperatingSystem
Variables   ../variables/locators/loginLocators.py


*** Keywords ***
Enter valid credentials and hit login button
    ${json_data}    load json from file    ./variables/data/loginData.json
    # get username and password
    ${username}    get value from json    ${json_data}    $.UsernameText
    ${password}    get value from json   ${json_data}   $.PasswordText
    Input Text          ${Username_Field}      ${username[0]}
    Input Text          ${Password_Field}      ${password[0]}
    # get keyboard key to press
    ${key}    get value from json    ${json_data}    $.KeyName
    Press Keys          ${Login_Button}      ${key[0]}