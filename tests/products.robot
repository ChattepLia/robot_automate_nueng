*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/product_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot
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
    Add 5 Items to Cart
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
    Wait Until Element Contains    css=.product_sort_container    Name (A to Z)    timeout=5s
    Wait Until Element Contains   xpath=(//div[contains(@class,'inventory_item_name')])[1]   Sauce Labs Backpack  timeout=5s
    #Create list and verify order
    ${get_product_list}=    Get Product list
    ${expected_product_list}=    Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    Lists Should Be Equal    ${get_product_list}    ${expected_product_list}

    # ${first_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[1]
    # Should Be Equal    ${first_item}    Sauce Labs Backpack
    # ${second_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[2]
    # Should Be Equal    ${second_item}   Sauce Labs Bike Light
    # ${third_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[3]
    # Should Be Equal    ${third_item}    Sauce Labs Bolt T-Shirt
    # ${fourth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[4]
    # Should Be Equal    ${fourth_item}   Sauce Labs Fleece Jacket
    # ${fifth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[5]
    # Should Be Equal    ${fifth_item}    Sauce Labs Onesie
    # ${sixth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[6]
    # Should Be Equal    ${sixth_item}    Test.allTheThings() T-Shirt (Red)
    Close Browser

5 Sorting by Z to A
    Login With Valid Credentials
    Select From List By Value    css=.product_sort_container    za
    Wait Until Element Contains    css=.product_sort_container    Name (Z to A)    timeout=5s
    Wait Until Element Contains   xpath=(//div[contains(@class,'inventory_item_name')])[1]   Test.allTheThings() T-Shirt (Red)  timeout=5s
    # Create list and verify order
    ${get_product_list}=    Get Product list
    ${expected_product_list}=    Create List    Test.allTheThings() T-Shirt (Red)    Sauce Labs Onesie    Sauce Labs Fleece Jacket    Sauce Labs Bolt T-Shirt    Sauce Labs Bike Light    Sauce Labs Backpack
    Lists Should Be Equal    ${get_product_list}    ${expected_product_list}
    # ${first_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[1]
    # Should Be Equal    ${first_item}    Test.allTheThings() T-Shirt (Red)
    # ${second_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[2]
    # Should Be Equal    ${second_item}   Sauce Labs Onesie
    # ${third_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[3]
    # Should Be Equal    ${third_item}    Sauce Labs Fleece Jacket
    # ${fourth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[4]
    # Should Be Equal    ${fourth_item}   Sauce Labs Bolt T-Shirt
    # ${fifth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[5]
    # Should Be Equal    ${fifth_item}    Sauce Labs Bike Light
    # ${sixth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[6]
    # Should Be Equal    ${sixth_item}    Sauce Labs Backpack
    Close Browser

6 Sorting by Price Low to High
    Login With Valid Credentials
    Select From List By Value    css=.product_sort_container    lohi
    Wait Until Element Contains    css=.active_option    Price (low to high)    timeout=5s
    Wait Until Element Contains   xpath=(//div[contains(@class,'inventory_item_name')])[1]   Sauce Labs Onesie  timeout=5s
    ${get_product_list}=    Get Product list
    ${expected_product_list}=    Create List    Sauce Labs Onesie    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Test.allTheThings() T-Shirt (Red)    Sauce Labs Backpack    Sauce Labs Fleece Jacket
    Lists Should Be Equal    ${get_product_list}    ${expected_product_list}
    # ${first_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[1]
    # Should Be Equal    ${first_item}    Sauce Labs Onesie
    # ${second_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[2]
    # Should Be Equal    ${second_item}   Sauce Labs Bike Light
    # ${third_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[3]
    # Should Be Equal    ${third_item}    Sauce Labs Bolt T-Shirt
    # ${fourth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[4]
    # Should Be Equal    ${fourth_item}   Test.allTheThings() T-Shirt (Red)
    # ${fifth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[5]
    # Should Be Equal    ${fifth_item}    Sauce Labs Backpack
    # ${sixth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[6]
    # Should Be Equal    ${sixth_item}    Sauce Labs Fleece Jacket
    Close Browser

7 Sorting by Price High to Low
    Login With Valid Credentials
    Select From List By Value    css=.product_sort_container    hilo
    Wait Until Element Contains    css=.active_option    Price (high to low)    timeout=5s
    Wait Until Element Contains   xpath=(//div[contains(@class,'inventory_item_name')])[1]   Sauce Labs Fleece Jacket  timeout=5s
    ${get_product_list}=    Get Product list
    ${expected_product_list}=    Create List    Sauce Labs Fleece Jacket    Sauce Labs Backpack    Sauce Labs Bolt T-Shirt    Test.allTheThings() T-Shirt (Red)    Sauce Labs Bike Light    Sauce Labs Onesie
    Lists Should Be Equal    ${get_product_list}    ${expected_product_list}
    # ${first_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[1]
    # Should Be Equal    ${first_item}    Sauce Labs Fleece Jacket
    # ${second_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[2]
    # Should Be Equal    ${second_item}   Sauce Labs Backpack
    # ${third_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[3]
    # Should Be Equal    ${third_item}    Sauce Labs Bolt T-Shirt
    # ${fourth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[4]
    # Should Be Equal    ${fourth_item}   Test.allTheThings() T-Shirt (Red)
    # ${fifth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[5]
    # Should Be Equal    ${fifth_item}    Sauce Labs Bike Light
    # ${sixth_item}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[6]
    # Should Be Equal    ${sixth_item}    Sauce Labs Onesie
    Close Browser

8 Add Product from Product Details Page by Click Product Name
    Login With Valid Credentials
    Click Element    xpath=//div[contains(text(),'Sauce Labs Backpack')]
    Wait Until Location Is    ${sauce_labs_backpack_url}    timeout=5s
    Wait Until Element Is Visible    id=add-to-cart  timeout=5s
    Click Button    id=add-to-cart
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    1    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    1   
    Wait Until Element Is Visible    id=remove   timeout=5s
    Page Should Contain Element    id=remove 
    Close Browser

9 Add Product from Product Details Page by Click Product Image
    Login With Valid Credentials
    Click Element    id=item_2_img_link
    Wait Until Location Is    ${sauce_labs_onesie_url}    timeout=5s
    Wait Until Element Is Visible    id=add-to-cart  timeout=5s
    Click Button    id=add-to-cart
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    1    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    1 
    Wait Until Element Is Visible    id=remove   timeout=5s
    Page Should Contain Element    id=remove 
    Close Browser

10 Add Product from Click Product Name at Cart Page
    Login With Valid Credentials
    Click Button    id=add-to-cart-test.allthethings()-t-shirt-(red)
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    1    timeout=5s
    Click Element    id=shopping_cart_container
    Wait Until Location Is    ${cart_url}    timeout=5s
    Click Element    id=item_3_title_link
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Button    id=remove
    Wait Until Element Is Not Visible   css=#shopping_cart_container .shopping_cart_badge    timeout=5s
    Click Button    id=add-to-cart
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    1    timeout=5s
    Element Text Should Be    css=#shopping_cart_container .shopping_cart_badge    1
    Close Browser

11 Remove Product from Cart at Product Details Page
    Login With Valid Credentials
    Click Element    id=item_3_title_link
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Element    id=add-to-cart
    Wait Until Element Is Visible   id=remove   timeout=5s
    Click Element    id=remove
    Wait Until Element Is Not Visible   css=#shopping_cart_container .shopping_cart_badge   timeout=5s
    Element Should Not Be Visible   css=#shopping_cart_container .shopping_cart_badge
    Wait Until Element Is Visible    id=add-to-cart   timeout=5s
    Element Should Be Visible   id=add-to-cart
    Close Browser

12 Remove Product from Cart at Cart Page
    Login With Valid Credentials
    Click Button    id=add-to-cart-test.allthethings()-t-shirt-(red)
    Wait Until Element Contains   css=#shopping_cart_container .shopping_cart_badge    1    timeout=5s
    Click Element    id=shopping_cart_container
    Wait Until Location Is    ${cart_url}    timeout=5s
    Click Element    id=item_3_title_link
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Button    id=remove
    Wait Until Element Is Not Visible   css=#shopping_cart_container .shopping_cart_badge   timeout=5s
    Element Should Not Be Visible   css=#shopping_cart_container .shopping_cart_badge
    Wait Until Element Is Visible    id=add-to-cart   timeout=5s
    Element Should Be Visible   id=add-to-cart
    Close Browser

13 CLick Back Buttom at Product Details Page
    Login With Valid Credentials
    Click Element    xpath=//div[contains(text(),'Test.allTheThings() T-Shirt (Red)')] 
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Element    id=back-to-products
    Wait Until Location Is    ${inventory_url}    timeout=5s
    Location Should Be   ${inventory_url}
    Close Browser