*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add Backpack To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    css=#shopping_cart_container .shopping_cart_badge    timeout=5s

Remove Backpack From Cart
    Click Button    id=remove-sauce-labs-backpack
    Wait Until Element Is Visible    id=add-to-cart-sauce-labs-backpack    timeout=5s

Assert Cart Badge Is
    [Arguments]    ${expected}
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    ${expected}
