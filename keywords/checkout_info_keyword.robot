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
    Input Text    ${input_first_name}    QA_firstname
    Input Text    ${input_last_name}     QA_Lastname
    Input Text    ${input_postal_code}   51000
    Click Button    ${button_continue}
    Wait Until Location Is    ${url_checkout_order}    timeout=5s
