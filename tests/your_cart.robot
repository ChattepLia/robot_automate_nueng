*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../keywords/global_keywords.robot
Resource   ${CURDIR}/../keywords/product_keywords.robot

Test Setup    Login With Valid Credentials
Test Teardown    Close Browser

*** Test Cases ***
1 Ensure products correct in your cart
    Add backpack to cart from list page
    Click Element    ${shopping_cart_link_xpath}
    Wait Until Location Is    ${cart_url}    timeout=5s
    Location Should Be    ${cart_url}
    Page Should Contain Element    ${cart_item_sauce_labs_backpack_xpath}
    Element Text Should Be    ${cart_item_sauce_labs_backpack_name_xpath}    Sauce Labs Backpack