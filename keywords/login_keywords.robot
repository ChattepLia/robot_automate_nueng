*** Settings ***
Library   SeleniumLibrary
Resource   ${CURDIR}/../resources/globle_variables.resource
Resource   ${CURDIR}/../resources/login.resource
Resource   ${CURDIR}/../keywords/browser.robot


*** Keywords ***
Login With Valid Credentials
    Open Chrome Without Password Dialog
    Wait Until Element Is Visible   id=user-name    timeout=5s
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password    ${password}
    Click Button    id:login-button