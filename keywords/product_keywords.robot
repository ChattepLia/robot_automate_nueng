*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
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