*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../resources/global_variables.resource
Resource    ${CURDIR}/../keywords/global_keywords.robot
Resource    ${CURDIR}/../keywords/product_keywords.robot
Resource    ${CURDIR}/../keywords/cart_keywords.robot
Resource    ${CURDIR}/../keywords/checkout_info_keyword.robot
Test Setup    Login With Valid Credentials
Test Teardown    Close Browser


*** Test Cases ***
1 Verify one product on checkout order page
    Add tsirt red to cart from list page
    Go to Cart Page
    Click Button   ${checkout_button_xpath}
    Input valid info and go to checkout order page
    Page Should Contain    Checkout: Overview
    Page Should Contain    ${name_tshirt_red}
    Page Should Contain    ${desc_tshirt_red}
    Page Should Contain    ${price_tshirt_red}
    1