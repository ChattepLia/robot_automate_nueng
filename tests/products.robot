*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/product_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot
Resource   ${CURDIR}/../keywords/login_keywords.robot
Resource   ${CURDIR}/../keywords/product_keywords.robot
Test Setup    Login With Valid Credentials
Test Teardown    Close Browser


*** Test Cases ***
1 Add Single Product to Cart
    #Add Backpack To Cart by keyword
    Add backpack to cart from list page

2 Add Multi Product to Cart
    ${products}=    Create List    backpack    bike_light    bolt_tshirt    fleece_jacket    onesie
    ${removes}=    Create List    backpack    bike_light    bolt_tshirt    fleece_jacket    onesie
    FOR    ${index}    ${product}    IN ENUMERATE    @{products}
        ${add_btn}=    Set Variable    ${add_to_cart_sauce_labs_${product}_xpath}
        ${remove_btn}=    Set Variable    ${remove_sauce_labs_${product}_xpath}
        ${expected_count}=    Evaluate    ${index}+1
        Click Button    ${add_btn}
        Wait Until Element Contains    ${shopping_cart_badge_xpath}    ${expected_count}    timeout=5s
        Element Text Should Be    ${shopping_cart_badge_xpath}    ${expected_count}
        Wait Until Element Is Visible    ${remove_btn}    timeout=5s
        Page Should Contain Element    ${remove_btn}
    END

3 Remove Product from Cart
    #Add Product To Cart
    Add 5 Items to Cart
    #Remove Products from cart
    @{products}=    Create List
    ...    ${remove_sauce_labs_backpack_xpath}|${add_to_cart_sauce_labs_backpack_xpath}|4
    ...    ${remove_sauce_labs_bike_light_xpath}|${add_to_cart_sauce_labs_bike_light_xpath}|3
    ...    ${remove_sauce_labs_bolt_tshirt_xpath}|${add_to_cart_sauce_labs_bolt_tshirt_xpath}|2
    ...    ${remove_sauce_labs_fleece_jacket_xpath}|${add_to_cart_sauce_labs_fleece_jacket_xpath}|1
    ...    ${remove_sauce_labs_onesie_xpath}|${add_to_cart_sauce_labs_onesie_xpath}|0
    FOR    ${product}    IN    @{products}
        @{parts}=    Split String    ${product}    |
        Click Button    ${parts}[0]
        IF    '${parts}[2]' != '0'
            Wait Until Element Contains   ${shopping_cart_badge_xpath}    ${parts}[2]    timeout=5s
            Element Text Should Be    ${shopping_cart_badge_xpath}    ${parts}[2]
        ELSE
            Page Should Not Contain Element    ${shopping_cart_badge_xpath}
        END
        Page Should Contain Element    ${parts}[1]
    END

4 Sorting by A to Z
    Select From List By Value    ${product_sort_container_xpath}    az
    Wait Until Element Contains    ${product_sort_container_xpath}    Name (A to Z)    timeout=5s
    Wait Until Element Contains   ${inventory_item_name_1_xpath}   Sauce Labs Backpack  timeout=5s
    #Create list and verify order
    ${get_product_list}=    Get Product list
    ${expected_product_list}=    Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    Lists Should Be Equal    ${get_product_list}    ${expected_product_list}

5 Sorting by Z to A
    Select From List By Value    ${product_sort_container_xpath}    za
    Wait Until Element Contains    ${product_sort_container_xpath}    Name (Z to A)    timeout=5s
    Wait Until Element Contains   ${inventory_item_name_1_xpath}   Test.allTheThings() T-Shirt (Red)  timeout=5s
    # Create list and verify order
    ${get_product_list}=    Get Product list
    ${expected_product_list}=    Create List    Test.allTheThings() T-Shirt (Red)    Sauce Labs Onesie    Sauce Labs Fleece Jacket    Sauce Labs Bolt T-Shirt    Sauce Labs Bike Light    Sauce Labs Backpack
    Lists Should Be Equal    ${get_product_list}    ${expected_product_list}

6 Sorting by Price Low to High
    Select From List By Value    ${product_sort_container_xpath}    lohi
    Wait Until Element Contains    ${active_option_xpath}    Price (low to high)    timeout=5s
    Wait Until Element Contains   ${inventory_item_name_1_xpath}   Sauce Labs Onesie  timeout=5s
    ${get_product_list}=    Get Product List
    ${expected_product_list}=    Create List    Sauce Labs Onesie    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Test.allTheThings() T-Shirt (Red)    Sauce Labs Backpack    Sauce Labs Fleece Jacket
    Lists Should Be Equal    ${get_product_list}    ${expected_product_list}

7 Sorting by Price High to Low
    Select From List By Value    ${product_sort_container_xpath}    hilo
    Wait Until Element Contains    ${active_option_xpath}    Price (high to low)    timeout=5s
    Wait Until Element Contains   ${inventory_item_name_1_xpath}   Sauce Labs Fleece Jacket  timeout=5s
    ${get_product_list}=    Get Product list
    ${expected_product_list}=    Create List    Sauce Labs Fleece Jacket    Sauce Labs Backpack    Sauce Labs Bolt T-Shirt    Test.allTheThings() T-Shirt (Red)    Sauce Labs Bike Light    Sauce Labs Onesie
    Lists Should Be Equal    ${get_product_list}    ${expected_product_list}

8 Add Product from Product Details Page by Click Product Name
    Click Element    ${sauce_labs_backpack_name_xpath}
    Wait Until Location Is    ${sauce_labs_backpack_url}    timeout=5s
    Wait Until Element Is Visible    ${add_to_cart_xpath}  timeout=5s
    Click Button    ${add_to_cart_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1   
    Wait Until Element Is Visible    ${remove_xpath}   timeout=5s
    Page Should Contain Element    ${remove_xpath}

9 Add Product from Product Details Page by Click Product Image
    Click Element    ${item_2_img_link_xpath}
    Wait Until Location Is    ${sauce_labs_onesie_url}    timeout=5s
    Wait Until Element Is Visible    ${add_to_cart_xpath}  timeout=5s
    Click Button    ${add_to_cart_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1 
    Wait Until Element Is Visible    ${remove_xpath}   timeout=5s
    Page Should Contain Element    ${remove_xpath}

10 Add Product from Click Product Name at Cart Page
    #Add tsirt red by keyword
    Add tsirt red to cart from list page
    Click Element    ${item_3_title_link_xpath}
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Button    ${remove_xpath}
    Wait Until Element Is Not Visible   ${shopping_cart_badge_xpath}    timeout=5s
    Click Button    ${add_to_cart_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1

11 Remove Product from Cart at Product Details Page
    Click Element    ${item_3_title_link_xpath}
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Element    ${add_to_cart_xpath}
    Wait Until Element Is Visible   ${remove_xpath}   timeout=5s
    Click Element    ${remove_xpath}
    Wait Until Element Is Not Visible   ${shopping_cart_badge_xpath}   timeout=5s
    Element Should Not Be Visible   ${shopping_cart_badge_xpath}
    Wait Until Element Is Visible    ${add_to_cart_xpath}   timeout=5s
    Element Should Be Visible   ${add_to_cart_xpath}

12 Remove Product from Cart at Cart Page
    Add tsirt red to cart from list page
    Click Element    ${shopping_cart_container_xpath}
    Wait Until Location Is    ${cart_url}    timeout=5s
    Click Element    ${item_3_title_link_xpath}
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Button    ${remove_xpath}
    Wait Until Element Is Not Visible   ${shopping_cart_badge_xpath}   timeout=5s
    Element Should Not Be Visible   ${shopping_cart_badge_xpath}
    Wait Until Element Is Visible    ${add_to_cart_xpath}   timeout=5s
    Element Should Be Visible   ${add_to_cart_xpath}

13 CLick Back Buttom at Product Details Page
    Click Element    ${test_allthethings_tshirt_red_name_xpath} 
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Element    ${back_to_products_xpath}
    Wait Until Location Is    ${inventory_url}    timeout=5s
    Location Should Be   ${inventory_url}