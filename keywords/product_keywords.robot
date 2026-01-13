*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add Backpack To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    1    timeout=5s

Add Bike Light To Cart
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    2    timeout=5s

Add 5 item to cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket
    Click Button    id=add-to-cart-sauce-labs-onesie
    
    