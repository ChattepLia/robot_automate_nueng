*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ${CURDIR}/../resources/product_variables.resource  

*** Keywords ***
Add backpack to cart from list page
    Click Button    ${add_to_cart_sauce_labs_backpack_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1
    Wait Until Element Is Visible    ${remove_sauce_labs_backpack_xpath}    timeout=5s
    Page Should Contain Element    ${remove_sauce_labs_backpack_xpath}

Add tsirt red to cart from list page
    Click Button    ${add_to_cart_sauce_labs_bolt_t_shirt_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1
    Wait Until Element Is Visible    ${remove_sauce_labs_bolt_t_shirt_xpath}    timeout=5s
    Page Should Contain Element    ${remove_sauce_labs_bolt_t_shirt_xpath}

Add 5 Items to Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket    
    Click Button    id=add-to-cart-sauce-labs-onesie

Get Product List    
    ${items_list}=    Create List
    FOR    ${index}    IN RANGE    1    7
        ${item_text}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[${index}]
        Append To List    ${items_list}    ${item_text}
    END
    RETURN    ${items_list}