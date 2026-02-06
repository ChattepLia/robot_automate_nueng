*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/cart_variables.resource
Resource   ${CURDIR}/../resources/checkout_info_variables.resource

 
*** Keywords ***
Go to checkout info page
    Click Button   ${checkout_button_xpath}
    Wait Until Location Is    ${url_checkout_info}    timeout=5s

Input valid info and go to checkout order page
    Input Text    ${first_name_input}    QA_firstname
    Input Text    ${last_name_input}     QA_Lastname
    Input Text    ${postal_code_input}   51000
    Click Button    ${continue_button}
    Wait Until Location Is    ${url_checkout_order}    timeout=5s
