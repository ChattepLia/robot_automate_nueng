*** Settings ***
Library   SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/login_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot


*** Keywords ***
Click Login Button and Assert Valid Credentials User
    Click Button    ${login_button_xpath}
    Wait Until Location Is    ${inventory_url}    timeout=5s
    Location Should Be    ${inventory_url}
    Page Should Contain        ${inventory_page_title}