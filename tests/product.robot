*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/variables.robot
Resource   ${CURDIR}/../resources/product_page.robot

*** Test Cases ***
1 Add Single Product to Cart
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Add Backpack To Cart
    Assert Cart Badge Is    1
    Page Should Contain Element    id=remove-sauce-labs-backpack
    Close Browser

#2 Add Multi Product to Cart