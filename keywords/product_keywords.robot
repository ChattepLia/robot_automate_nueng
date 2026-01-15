*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add 5 item to cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket
    Click Button    id=add-to-cart-sauce-labs-onesie
    
