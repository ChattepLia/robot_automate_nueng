*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource

*** Keywords ***
Open Chrome Without Password Dialog
   Open Browser    ${URL}    ${BROWSER}
    ...    options=add_experimental_option("detach",True);add_experimental_option("prefs", {"profile.password_manager_leak_detection": False})
    Maximize Browser Window