*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/login_variables.resource

*** Keywords ***
Open Chrome Without Password Dialog
   Open Browser    ${URL}    ${BROWSER}
    ...    options=add_experimental_option("detach",True);add_experimental_option("prefs", {"profile.password_manager_leak_detection": False})
    Maximize Browser Window

Login With Valid Credentials
    Open Chrome Without Password Dialog
    Wait Until Element Is Visible   ${login_user_name_xpath}    timeout=5s
    Input Text    ${login_user_name_xpath}    ${standard_user}
    Input Text    ${login_password_xpath}    ${password}
    Click Button    ${login_button_xpath}
    Wait Until Location Is    ${inventory_url}    timeout=5s