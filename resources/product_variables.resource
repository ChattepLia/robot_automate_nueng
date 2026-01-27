*** Variables ***
# Product detail URLs
${sauce_labs_backpack_url}   https://www.saucedemo.com/inventory-item.html?id=4
${sauce_labs_onesie_url}   https://www.saucedemo.com/inventory-item.html?id=2
${sauce_labs_fleece_jacket_url}   https://www.saucedemo.com/inventory-item.html?id=5
${sauce_labs_bike_light_url}   https://www.saucedemo.com/inventory-item.html?id=0
${sauce_labs_bolt_tshirt_url}   https://www.saucedemo.com/inventory-item.html?id=1
${test_allthethings_tshirt_red_url}   https://www.saucedemo.com/inventory-item.html?id=3

# Button locators
${add_to_cart_sauce_labs_backpack_xpath}    id=add-to-cart-sauce-labs-backpack
${remove_sauce_labs_backpack_xpath}         id=remove-sauce-labs-backpack
${add_to_cart_sauce_labs_bike_light_xpath}  id=add-to-cart-sauce-labs-bike-light
${remove_sauce_labs_bike_light_xpath}       id=remove-sauce-labs-bike-light
${add_to_cart_sauce_labs_bolt_tshirt_xpath}    id=add-to-cart-sauce-labs-bolt-t-shirt
${remove_sauce_labs_bolt_tshirt_xpath}      id=remove-sauce-labs-bolt-t-shirt
${add_to_cart_sauce_labs_fleece_jacket_xpath}    id=add-to-cart-sauce-labs-fleece-jacket
${remove_sauce_labs_fleece_jacket_xpath}    id=remove-sauce-labs-fleece-jacket
${add_to_cart_sauce_labs_onesie_xpath}      id=add-to-cart-sauce-labs-onesie
${remove_sauce_labs_onesie_xpath}           id=remove-sauce-labs-onesie
${shopping_cart_badge_xpath}               css=#shopping_cart_container .shopping_cart_badge
${product_sort_container_xpath}            css=.product_sort_container
${active_option_xpath}                     css=.active_option
${sauce_labs_backpack_name_xpath}        xpath=//div[contains(text(),'Sauce Labs Backpack')]
${add_to_cart_xpath}                        id=add-to-cart
${remove_xpath}                             id=remove
${shopping_cart_container_xpath}            id=shopping_cart_container
${add_to_cart_test_allthethings_tshirt_red_xpath}    id=add-to-cart-test.allthethings()-t-shirt-(red)
${test_allthethings_tshirt_red_name_xpath}    xpath=//div[contains(text(),'Test.allTheThings() T-Shirt (Red)')]
${back_to_products_xpath}                   id=back-to-products

# Image locators
${inventory_item_name_1_xpath}           xpath=(//div[contains(@class,'inventory_item_name')])[1]
${item_2_img_link_xpath}                    id=item_2_img_link
${item_3_title_link_xpath}                  id=item_3_title_link