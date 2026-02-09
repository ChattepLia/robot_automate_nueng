*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/cart_variables.resource
Resource   ${CURDIR}/../resources/checkout_info_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot
Resource   ${CURDIR}/../keywords/product_keywords.robot
Resource   ${CURDIR}/../keywords/cart_keywords.robot
Resource   ${CURDIR}/../keywords/checkout_info_keyword.robot
Test Setup    Login With Valid Credentials
Test Teardown    Close Browser

*** Test Cases ***
1 Input invalid data
# Initialize steps
    Add 4 Items to Cart
    Go to Cart Page
    Go to checkout info page
    Input valid info and go to checkout order page
#Assertions
    Location Should Be    ${url_checkout_order}
    Page Should Contain    Checkout: Overview

2 Verify empty all fields
# Initialize steps
    Add 4 Items to Cart
    Go to Cart Page
    Go to checkout info page
    Click Button    ${button_continue}
    Wait Until Element Is Visible    ${message_checkout_error}    timeout=5s
#Assertions
    Element Should Contain    ${message_checkout_error}    Error: First Name is required

3 Verify empty first name
# Initialize steps
    Add 4 Items to Cart
    Go to Cart Page
    Go to checkout info page
    Input Text    ${input_last_name}     QA_Lastname
    Input Text    ${input_postal_code}   51000
    Click Button    ${button_continue} 
    Wait Until Element Is Visible    ${message_checkout_error}    timeout=5s  
    Element Should Contain    ${message_checkout_error}    Error: First Name is required

4 Verify empty last name
# Initialize steps
    Add 4 Items to Cart
    Go to Cart Page
    Go to checkout info page
    Input Text    ${input_first_name}    QA_firstname
    Input Text    ${input_postal_code}   51000
    Click Button    ${button_continue} 
    Wait Until Element Is Visible    ${message_checkout_error}    timeout=5s  
    Element Should Contain    ${message_checkout_error}    Error: Last Name is required

5 Verify empty postal code
# Initialize steps
    Add 4 Items to Cart
    Go to Cart Page
    Go to checkout info page
    Input Text    ${input_first_name}    QA_firstname
    Input Text    ${input_last_name}     QA_Lastname
    Click Button    ${button_continue} 
    Wait Until Element Is Visible    ${message_checkout_error}    timeout=5s
    Element Should Contain    ${message_checkout_error}    Error: Postal Code is required

6 Verify when cancel checkout
# Initialize steps
    Add 4 Items to Cart
    Go to Cart Page
    Go to checkout info page
    Click Button    ${button_cancel}
    Wait Until Location Is    ${url_cart}    timeout=5s
    Location Should Be    ${url_cart}

