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
    Click Button    ${add_to_cart_sauce_labs_backpack_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1
    Wait Until Element Is Visible    ${remove_sauce_labs_backpack_xpath}    timeout=5s
    Page Should Contain Element    ${remove_sauce_labs_backpack_xpath}
    Close Browser

2 Add Multi Product to Cart
    Login With Valid Credentials
    #Add Backpack To Cart
    Click Button    ${add_to_cart_sauce_labs_backpack_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1
    Wait Until Element Is Visible    ${remove_sauce_labs_backpack_xpath}    timeout=5s
    Page Should Contain Element    ${remove_sauce_labs_backpack_xpath}
    #Add Bike Light To Cart
    Click Button    ${add_to_cart_sauce_labs_bike_light_xpath}
    Wait Until Element Contains  ${shopping_cart_badge_xpath}    2    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    2
    Wait Until Element Is Visible    ${remove_sauce_labs_bike_light_xpath}    timeout=5s
    Page Should Contain Element    ${remove_sauce_labs_bike_light_xpath}
    #Add Bolt T-Shirt To Cart
    Click Button    ${add_to_cart_sauce_labs_bolt_tshirt_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    3    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    3
    Wait Until Element Is Visible    ${remove_sauce_labs_bolt_tshirt_xpath}    timeout=5s
    Page Should Contain Element    ${remove_sauce_labs_bolt_tshirt_xpath}
    #Add Fleece Jacket To Cart
    Click Button    ${add_to_cart_sauce_labs_fleece_jacket_xpath}
    wait Until Element Contains   ${shopping_cart_badge_xpath}    4    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    4
    Wait Until Element Is Visible    ${remove_sauce_labs_fleece_jacket_xpath}    timeout=5s
    Page Should Contain Element    ${remove_sauce_labs_fleece_jacket_xpath}
    #Add Onesie To Cart
    Click Button    ${add_to_cart_sauce_labs_onesie_xpath}
    wait Until Element Contains   ${shopping_cart_badge_xpath}    5    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    5
    Wait Until Element Is Visible    ${remove_sauce_labs_onesie_xpath}    timeout=5s
    Page Should Contain Element    ${remove_sauce_labs_onesie_xpath}
    Close Browser

3 Remove Product from Cart
    Login With Valid Credentials
    #Add Product To Cart
    Add 5 Items to Cart
    #Remove Products from cart
    Click Button    ${remove_sauce_labs_backpack_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    4    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    4
    Page Should Contain Element    ${add_to_cart_sauce_labs_backpack_xpath}
    Click Button    ${remove_sauce_labs_bike_light_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    3    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    3
    Page Should Contain Element    ${add_to_cart_sauce_labs_bike_light_xpath}
    Click Button    ${remove_sauce_labs_bolt_tshirt_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    2    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    2
    Page Should Contain Element    ${add_to_cart_sauce_labs_bolt_tshirt_xpath}
    Click Button    ${remove_sauce_labs_fleece_jacket_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1
    Page Should Contain Element    ${add_to_cart_sauce_labs_fleece_jacket_xpath}
    Click Button    ${remove_sauce_labs_onesie_xpath}
    Page Should Not Contain Element    ${shopping_cart_badge_xpath}
    Page Should Contain Element    ${add_to_cart_sauce_labs_onesie_xpath}
    Close Browser

4 Sorting by A to Z
    Login With Valid Credentials
    Select From List By Value    ${product_sort_container_xpath}    az
    Wait Until Element Contains    ${product_sort_container_xpath}    Name (A to Z)    timeout=5s
    Wait Until Element Contains   ${inventory_item_name_1_xpath}   Sauce Labs Backpack  timeout=5s
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
    Select From List By Value    ${product_sort_container_xpath}    za
    Wait Until Element Contains    ${product_sort_container_xpath}    Name (Z to A)    timeout=5s
    Wait Until Element Contains   ${inventory_item_name_1_xpath}   Test.allTheThings() T-Shirt (Red)  timeout=5s
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
    Select From List By Value    ${product_sort_container_xpath}    lohi
    Wait Until Element Contains    ${active_option_xpath}    Price (low to high)    timeout=5s
    Wait Until Element Contains   ${inventory_item_name_1_xpath}   Sauce Labs Onesie  timeout=5s
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
    Select From List By Value    ${product_sort_container_xpath}    hilo
    Wait Until Element Contains    ${active_option_xpath}    Price (high to low)    timeout=5s
    Wait Until Element Contains   ${inventory_item_name_1_xpath}   Sauce Labs Fleece Jacket  timeout=5s
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
    Click Element    ${sauce_labs_backpack_name_xpath}
    Wait Until Location Is    ${sauce_labs_backpack_url}    timeout=5s
    Wait Until Element Is Visible    ${add_to_cart_xpath}  timeout=5s
    Click Button    ${add_to_cart_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1   
    Wait Until Element Is Visible    ${remove_xpath}   timeout=5s
    Page Should Contain Element    ${remove_xpath}
    Close Browser

9 Add Product from Product Details Page by Click Product Image
    Login With Valid Credentials
    Click Element    ${item_2_img_link_xpath}
    Wait Until Location Is    ${sauce_labs_onesie_url}    timeout=5s
    Wait Until Element Is Visible    ${add_to_cart_xpath}  timeout=5s
    Click Button    ${add_to_cart_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1 
    Wait Until Element Is Visible    ${remove_xpath}   timeout=5s
    Page Should Contain Element    ${remove_xpath}
    Close Browser

10 Add Product from Click Product Name at Cart Page
    Login With Valid Credentials
    Click Button    ${add_to_cart_test_allthethings_tshirt_red_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Click Element    ${shopping_cart_container_xpath}
    Wait Until Location Is    ${cart_url}    timeout=5s
    Click Element    ${item_3_title_link_xpath}
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Button    ${remove_xpath}
    Wait Until Element Is Not Visible   ${shopping_cart_badge_xpath}    timeout=5s
    Click Button    ${add_to_cart_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Element Text Should Be    ${shopping_cart_badge_xpath}    1
    Close Browser

11 Remove Product from Cart at Product Details Page
    Login With Valid Credentials
    Click Element    ${item_3_title_link_xpath}
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Element    ${add_to_cart_xpath}
    Wait Until Element Is Visible   ${remove_xpath}   timeout=5s
    Click Element    ${remove_xpath}
    Wait Until Element Is Not Visible   ${shopping_cart_badge_xpath}   timeout=5s
    Element Should Not Be Visible   ${shopping_cart_badge_xpath}
    Wait Until Element Is Visible    ${add_to_cart_xpath}   timeout=5s
    Element Should Be Visible   ${add_to_cart_xpath}
    Close Browser

12 Remove Product from Cart at Cart Page
    Login With Valid Credentials
    Click Button    ${add_to_cart_test_allthethings_tshirt_red_xpath}
    Wait Until Element Contains   ${shopping_cart_badge_xpath}    1    timeout=5s
    Click Element    ${shopping_cart_container_xpath}
    Wait Until Location Is    ${cart_url}    timeout=5s
    Click Element    ${item_3_title_link_xpath}
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Button    ${remove_xpath}
    Wait Until Element Is Not Visible   ${shopping_cart_badge_xpath}   timeout=5s
    Element Should Not Be Visible   ${shopping_cart_badge_xpath}
    Wait Until Element Is Visible    ${add_to_cart_xpath}   timeout=5s
    Element Should Be Visible   ${add_to_cart_xpath}
    Close Browser

13 CLick Back Buttom at Product Details Page
    Login With Valid Credentials
    Click Element    ${test_allthethings_tshirt_red_name_xpath} 
    Wait Until Location Is    ${test_allthethings_tshirt_red_url}    timeout=5s
    Click Element    ${back_to_products_xpath}
    Wait Until Location Is    ${inventory_url}    timeout=5s
    Location Should Be   ${inventory_url}
    Close Browser