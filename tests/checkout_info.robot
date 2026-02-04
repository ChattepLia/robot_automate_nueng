*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/cart_variables.resource
Resource   ${CURDIR}/../resources/checkout_info_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot
Resource   ${CURDIR}/../keywords/product_keywords.robot
Resource   ${CURDIR}/../keywords/cart_keywords.robot


Test Setup    Login With Valid Credentials
Test Teardown    Close Browser


*** Test Cases ***
1 Input invalid data
    Add 4 Items to Cart
    Go to Cart Page
    Click Button   ${checkout_button_xpath}
    Wait Until Location Is    ${checkout_step_one_url}    timeout=5s
    Input Text    ${first_name_input}    QA_firstname
    Input Text    ${last_name_input}     QA_Lastname
    Input Text    ${postal_code_input}   51000
    Click Button    ${continue_button}
    Wait Until Location Is    ${checkout_step_two_url}    timeout=5s

2 