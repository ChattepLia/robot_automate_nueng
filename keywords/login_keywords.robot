*** Settings ***
Library   SeleniumLibrary
Resource   ../resources/global_variables.resource
Resource   ../resources/login_variables.resource
Resource   ../keywords/global_keywords.robot


*** Keywords ***
Click Login Button and Assert Valid Credentials User
    Click Button    ${login_button_xpath}
    Wait Until Location Is    ${url_inventory}    timeout=5s
    Location Should Be    ${url_inventory}
    Page Should Contain        ${inventory_page_title}