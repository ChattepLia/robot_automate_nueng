*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add Backpack To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    css=#shopping_cart_container .shopping_cart_badge    timeout=5s
    