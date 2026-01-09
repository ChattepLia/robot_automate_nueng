*** Settings ***
Library    SeleniumLibrary
Resource   login.robot

*** Variables ***

*** Test Cases ***
Add New Product
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Close Browser

    id="remove-sauce-labs-backpack"