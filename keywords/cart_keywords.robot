*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/product_variables.resource
Resource   ${CURDIR}/../resources/cart_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot


*** Keywords ***
Remove all products from cart
    ${count}=    Get Element Count    ${cart_badge}
    WHILE    ${count} > 0
        Click Button    xpath=(//button[contains(@class,'cart_button')])[1]
        Sleep    1s
        ${count}=    Get Element Count    xpath=//button[contains(@class,'cart_button')]
    END
    Page Should Not Contain Element    ${cart_badge}

Go to Cart Page
    Click Element    ${cart_icon}
    Wait Until Location Is    ${url_cart}    timeout=5s

