*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/global_variables.resource
Resource   ../resources/cart_variables.resource
Resource   ../resources/checkout_info_variables.resource
Resource   ../keywords/global_keywords.robot
Resource   ../keywords/product_keywords.robot
Resource   ../keywords/cart_keywords.robot
Resource   ../keywords/checkout_info_keyword.robot
Test Setup    Login With Valid Credentials
Test Teardown    Close Browser

*** Test Cases ***
1 Input invalid data
# Initialize steps
    Prepare checkout info page
    Input valid info and go to checkout order page
#Assertions
    Location Should Be    ${url_checkout_order}
    Page Should Contain    Checkout: Overview

2 Verify empty all fields
# Initialize steps
    Prepare checkout info page
    Click Button    ${button_continue}
    Wait Until Element Is Visible    ${message_checkout_error}    timeout=5s
#Assertions
    Element Should Contain    ${message_checkout_error}    Error: First Name is required

3 Verify empty first name
# Initialize steps
    Prepare checkout info page
    Input Text    ${input_last_name}     QA_Lastname
    Input Text    ${input_postal_code}   51000
    Click Button    ${button_continue} 
    Wait Until Element Is Visible    ${message_checkout_error}    timeout=5s  
    Element Should Contain    ${message_checkout_error}    Error: First Name is required

4 Verify empty last name
# Initialize steps
    Prepare checkout info page
    Input Text    ${input_first_name}    QA_firstname
    Input Text    ${input_postal_code}   51000
    Click Button    ${button_continue} 
    Wait Until Element Is Visible    ${message_checkout_error}    timeout=5s  
    Element Should Contain    ${message_checkout_error}    Error: Last Name is required

5 Verify empty postal code
# Initialize steps
    Prepare checkout info page
    Input Text    ${input_first_name}    QA_firstname
    Input Text    ${input_last_name}     QA_Lastname
    Click Button    ${button_continue} 
    Wait Until Element Is Visible    ${message_checkout_error}    timeout=5s
    Element Should Contain    ${message_checkout_error}    Error: Postal Code is required

6 Verify when cancel checkout
# Initialize steps
    Prepare checkout info page
    Click Button    ${button_cancel}
    Wait Until Location Is    ${url_cart}    timeout=5s
    Location Should Be    ${url_cart}

