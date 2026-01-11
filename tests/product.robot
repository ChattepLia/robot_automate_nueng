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

2 Add Multi Product to Cart
    Open Chrome Without Password Dialog    ${url}
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    #Add Backpack To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    id=remove-sauce-labs-backpack    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    1
    Page Should Contain Element    id=remove-sauce-labs-backpack
    #Add Bike Light To Cart
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Wait Until Element Is Visible    id=remove-sauce-labs-bike-light    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    2
    Page Should Contain Element    id=remove-sauce-labs-bike-light
    #Add Bolt T-Shirt To Cart
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Wait Until Element Is Visible    id=remove-sauce-labs-bolt-t-shirt    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    3
    Page Should Contain Element    id=remove-sauce-labs-bolt-t-shirt
    #Add Fleece Jacket To Cart
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket
    Wait Until Element Is Visible    id=remove-sauce-labs-fleece-jacket    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    4
    Page Should Contain Element    id=remove-sauce-labs-fleece-jacket
    #Add Onesie To Cart
    Click Button    id=add-to-cart-sauce-labs-onesie
    Wait Until Element Is Visible    id=remove-sauce-labs-onesie    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    5
    Page Should Contain Element    id=remove-sauce-labs-onesie
    Close Browser

3 Remove Product from Cart
    Open Chrome Without Password Dialog    ${url}
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    #Add Product To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket
    Click Button    id=add-to-cart-sauce-labs-onesie
    #Remove Products from cart
    Click Button    id=remove-sauce-labs-backpack
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    4
    Page Should Contain Element    id=add-to-cart-sauce-labs-backpack
    Click Button    id=remove-sauce-labs-bike-light
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    3
    Page Should Contain Element    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=remove-sauce-labs-bolt-t-shirt
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    2
    Page Should Contain Element    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id=remove-sauce-labs-fleece-jacket
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    1
    Page Should Contain Element    id=add-to-cart-sauce-labs-fleece-jacket
    Click Button    id=remove-sauce-labs-onesie
    Page Should Not Contain Element    css=#shopping_cart_container .shopping_cart_badge
    Page Should Contain Element    id=add-to-cart-sauce-labs-onesie
    Close Browser

4 Sorting by A to Z
    Open Chrome Without Password Dialog    ${url}
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Select From List By Value    css=.product_sort_container    az
    ${first_item}=    Get Text    xpath=(//div[@class='inventory_item_name'])[1]
    Should Be Equal    ${first_item}    Sauce Labs Backpack
    Close Browser