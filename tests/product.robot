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
    Input Text    id=product_name    Test Product
    Input Text    id=product_description    This is a test product.
    Input Text    id=product_price    19.99
    Select From List By Value    id=product_category    electronics
    Click Button    Save Product
    Page Should Contain    Product added successfully.
    Close Browser