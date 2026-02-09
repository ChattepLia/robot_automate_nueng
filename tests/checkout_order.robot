*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../resources/global_variables.resource
Resource    ${CURDIR}/../resources/product_variables.resource
Resource    ${CURDIR}/../resources/checkout_order_variables.resource
Resource    ${CURDIR}/../keywords/global_keywords.robot
Resource    ${CURDIR}/../keywords/product_keywords.robot
Resource    ${CURDIR}/../keywords/cart_keywords.robot
Resource    ${CURDIR}/../keywords/checkout_info_keyword.robot
Test Setup    Login With Valid Credentials
Test Teardown    Close Browser


*** Test Cases ***
1 Verify one product on checkout order page
    # Initialize steps
    Add tsirt red to cart from list page
    Go to Cart Page
    Click Button   ${checkout_button_xpath}
    Input valid info and go to checkout order page
    # Assertions
    Page Should Contain    Checkout: Overview
    Page Should Contain    ${name_tshirt_red}
    Page Should Contain    ${desc_tshirt_red}
    Page Should Contain    ${price_tshirt_red}
    Page Should Contain    ${payment_info_value}
    Page Should Contain    ${shipping_info_value}

2 Verify one product on checkout order page
    # Initialize steps
    Add tsirt red to cart from list page
    Go to Cart Page
    Click Button   ${checkout_button_xpath}
    Input valid info and go to checkout order page
    Click Element  ${title_tshirt_red}
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    5s
    # Assertions
    Location Should Be    ${test_allthethings_tshirt_red_url}

3 Verify multiple products on checkout order page
    # Initialize steps
    Add 6 Items to Cart
    Go to Cart Page
    Click Button   ${checkout_button_xpath}
    Input valid info and go to checkout order page
    # Assertions
    Page Should Contain    Checkout: Overview
    FOR    ${desc}    IN    ${desc_backpack}    ${desc_bike_light}    ${desc_bolt_tshirt}    ${desc_fleece_jacket}    ${desc_tshirt_red}    ${desc_onesie}
        Page Should Contain    ${desc}
    END
    FOR    ${price}    IN    ${price_backpack}    ${price_bike_light}    ${price_bolt_tshirt}    ${price_fleece_jacket}    ${price_tshirt_red}    ${price_onesie}
        Page Should Contain    ${price}
    END
    Page Should Contain    ${payment_info_value}
    Page Should Contain    ${shipping_info_value}

4 Verify multiple products on checkout order page
    # Initialize steps
    Add 6 Items to Cart
    Go to Cart Page
    Click Button   ${checkout_button_xpath}
    Input valid info and go to checkout order page
    Page Should Contain    Checkout: Overview
    Click Element  ${button_finish}
    Wait Until Location Is    ${url_checkout_complete}    5s
    # Assertions
    Location Should Be    ${url_checkout_complete}
    Page Should Contain    Thank you for your order!
    Page Should Contain Element    xpath=//img[@src="${checkout_image_src}"]
    Element Should Not Be Visible    ${cart_badge}
