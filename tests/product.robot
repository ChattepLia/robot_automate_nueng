*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/variables.robot
Resource   ${CURDIR}/../resources/browser.robot

*** Test Cases ***
1 Add Single Product to Cart
    Open Chrome Without Password Dialog    ${url}
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    1
    Page Should Contain Element    id=remove-sauce-labs-backpack
    Close Browser

#2 Add Multi Product to Cart
