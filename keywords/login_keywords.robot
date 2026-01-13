*** Settings ***
Library   SeleniumLibrary
Resource   ${CURDIR}/../resources/globle_variables.resource
Resource   ${CURDIR}/../keywords/browser.robot

*** Keywords ***
Login With Valid Credentials
    Open Chrome Without Password Dialog
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password    ${password}
    Click Button    id:login-button