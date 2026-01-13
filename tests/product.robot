*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ${CURDIR}/../resources/globle_variables.resource
Resource   ${CURDIR}/../keywords/browser.robot
Resource   ${CURDIR}/../keywords/login_keywords.robot
Resource   ${CURDIR}/../keywords/product_keywords.robot


*** Test Cases ***
1 Add Single Product to Cart
    Login With Valid Credentials
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    1    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    1
    Wait Until Element Is Visible    id=remove-sauce-labs-backpack    timeout=5s
    Page Should Contain Element    id=remove-sauce-labs-backpack
    Close Browser

2 Add Multi Product to Cart
    Login With Valid Credentials
    #Add Backpack To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    1    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    1
    Wait Until Element Is Visible    id=remove-sauce-labs-backpack    timeout=5s
    Page Should Contain Element    id=remove-sauce-labs-backpack
    #Add Bike Light To Cart
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Wait Until Element Contains  css=#shopping_cart_container .shopping_cart_badge    2    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    2
    Wait Until Element Is Visible    id=remove-sauce-labs-bike-light    timeout=5s
    Page Should Contain Element    id=remove-sauce-labs-bike-light
    #Add Bolt T-Shirt To Cart
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    3    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    3
    Wait Until Element Is Visible    id=remove-sauce-labs-bolt-t-shirt    timeout=5s
    Page Should Contain Element    id=remove-sauce-labs-bolt-t-shirt
    #Add Fleece Jacket To Cart
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket
    wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    4    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    4
    Wait Until Element Is Visible    id=remove-sauce-labs-fleece-jacket    timeout=5s
    Page Should Contain Element    id=remove-sauce-labs-fleece-jacket
    #Add Onesie To Cart
    Click Button    id=add-to-cart-sauce-labs-onesie
    wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    5    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    5
    Wait Until Element Is Visible    id=remove-sauce-labs-onesie    timeout=5s
    Page Should Contain Element    id=remove-sauce-labs-onesie
    Close Browser

3 Remove Product from Cart
    Login With Valid Credentials
    #Add Product To Cart
    Add 5 item to cart
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
    Login With Valid Credentials
    Select From List By Value    css=.product_sort_container    az
    Wait Until Element Is Visible    xpath=(//div[@class='inventory_item_name'])[1]    timeout=5s
    Page Should Contain Element   xpath=(//div[@class='inventory_item_name'])[1] = "Sauce Labs Backpack"
    Close Browser

5 Sorting by Z to A
    Login With Valid Credentials
    Select From List By Value    css=.product_sort_container    za
    Wait Until Element Is Visible    xpath=(//div[@class='inventory_item_name'])[1]    timeout=15s
    ${elements}=    Get WebElements    xpath=//div[@class='inventory_item_name']
    ${names}=    Create List
    FOR    ${el}    IN    @{elements}
        ${name}=    Get Text    ${el}
        Append To List    ${names}    ${name}
    END
    ${expected}=    Create List    Sauce Labs Onesie    Sauce Labs Fleece Jacket    Sauce Labs Bolt T-Shirt    Sauce Labs Bike Light    Sauce Labs Backpack
    Lists Should Be Equal    ${names}    ${expected}
    Close Browser