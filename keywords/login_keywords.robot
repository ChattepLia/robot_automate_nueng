*** Settings ***
Library   SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/login_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot


*** Keywords ***
Login With Valid Credentials
    Open Chrome Without Password Dialog
    Wait Until Element Is Visible   id=user-name    timeout=5s
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password    ${password}
    Click Button    id:login-button
    Wait Until Location Is    ${inventory_url}    timeout=5s