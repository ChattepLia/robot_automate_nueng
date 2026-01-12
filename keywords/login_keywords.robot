*** Settings ***
Library   SeleniumLibrary
Resource   ${CURDIR}/../resources/globle_variables.resource
Resource   ${CURDIR}/../resources/browser.resource

*** Keywords ***
Login With Valid Credentials
    Open Chrome Without Password Dialog    ${url}
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password    ${password}
    Click Button    id:login-button