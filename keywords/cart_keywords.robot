*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/product_variables.resource
Resource   ${CURDIR}/../resources/cart_variables.resource


*** Keywords ***
Remove all products from cart
    ${count}=    Get Element Count    ${cart_badge}
    WHILE    ${count} > 0
        Click Button    xpath=(//button[contains(@class,'cart_button')])[1]
        Sleep    1s
        ${count}=    Get Element Count    xpath=//button[contains(@class,'cart_button')]
    END
    Page Should Not Contain Element    ${cart_badge}