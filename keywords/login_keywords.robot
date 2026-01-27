*** Settings ***
Library   SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/login_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot


*** Keywords ***
Login With Valid Credentials
    Open Chrome Without Password Dialog
    Wait Until Element Is Visible   ${login_user_name_xpath}    timeout=5s
    Input Text    ${login_user_name_xpath}    ${standard_user}
    Input Text    ${login_password_xpath}    ${password}
    Click Button    ${login_button_xpath}
    Wait Until Location Is    ${inventory_url}    timeout=5s

Click Login Button and Assert Valid User
    Click Button    ${login_button_xpath}
    Wait Until Location Is    ${inventory_url}    timeout=5s
    Location Should Be    ${inventory_url}
    Page Should Contain        ${inventory_page_title}