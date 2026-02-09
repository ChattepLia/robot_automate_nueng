*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/cart_variables.resource
Resource   ${CURDIR}/../resources/product_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot
Resource   ${CURDIR}/../keywords/product_keywords.robot
Resource   ${CURDIR}/../keywords/cart_keywords.robot


Test Setup    Login With Valid Credentials
Test Teardown    Close Browser

*** Test Cases ***
1 Ensure products correct in your cart
    # Initialize steps
    Add 4 Items to Cart
    Click Element    ${cart_icon}
    Wait Until Location Is  ${cart_url}    5s
    # Assertions
    Location Should Be   ${cart_url}
    Page Should Contain  ${desc_backpack}
    Page Should Contain  ${desc_bike_light}
    Page Should Contain  ${desc_bolt_tshirt}
    Page Should Contain  ${desc_fleece_jacket}
    Page Should Contain  ${price_backpack}
    Page Should Contain  ${price_bike_light}
    Page Should Contain  ${price_bolt_tshirt}
    Page Should Contain  ${price_fleece_jacket}
    Element Text Should Be    ${shopping_cart_badge_xpath}    4

2 Ensure products correct in your cart when add product from detail page
    # Initialize steps
    Click Element    ${sauce_labs_backpack_title_xpath}
    Wait Until Location Is    ${sauce_labs_backpack_url}    5s
    Click Button    ${add_to_cart_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Click Element    ${cart_icon}
    Wait Until Location Is  ${cart_url}    5s
    # Assertions
    Location Should Be   ${cart_url}
    Page Should Contain  ${desc_backpack}
    Page Should Contain  ${price_backpack}
    Element Text Should Be    ${shopping_cart_badge_xpath}    1
    
3 Remove product from your cart
    # Initialize steps
    Add 4 Items to Cart
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    4    timeout=5s
    Click Element    ${cart_icon}
    Wait Until Location Is  ${cart_url}    5s
    Click Button   ${remove_sauce_labs_backpack_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    3    timeout=5s
    Wait Until Element Is Not Visible   ${remove_sauce_labs_backpack_xpath}    timeout=5s
    # Assertions
    Element Text Should Be    ${shopping_cart_badge_xpath}    3
    Page Should Not Contain  ${desc_backpack}
    
4 Verify empty cart after removing all products
    # Initialize steps
    Add 4 Items to Cart
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    4    timeout=5s
    Click Element    ${cart_icon}
    Wait Until Location Is  ${cart_url}    5s
    Remove all products from cart
    # Assertions
    Page Should Not Contain  ${desc_backpack}
    Page Should Not Contain  ${desc_bike_light}
    Element Should Not Be Visible    ${shopping_cart_badge_xpath}

5 Click continue shopping button from cart page
    # Initialize steps
    Add 4 Items to Cart
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    4    timeout=5s
    Click Element    ${cart_icon}
    Wait Until Location Is  ${cart_url}    5s
    Click Button    ${continue_shopping_button_xpath}
    Wait Until Location Is    ${inventory_url}    5s
    # Assertions
    Location Should Be   ${inventory_url}

6 Click checkout button from cart page
    # Initialize steps
    Add 4 Items to Cart
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    4    timeout=5s
    Click Element    ${cart_icon}
    Wait Until Location Is  ${cart_url}    5s
    Click Button    ${checkout_button_xpath}
    Wait Until Location Is    ${checkout_info_url}    5s
    # Assertions
    Location Should Be   ${checkout_info_url}