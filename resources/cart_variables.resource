*** Variables ***
${cart_icon}    id=shopping_cart_container
${cart_badge}    css=#shopping_cart_container .shopping_cart_badge

# Product descriptions
${desc_backpack}    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
${desc_bike_light}    A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.
${desc_bolt_tshirt}    Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.
${desc_fleece_jacket}    It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office.
${price_backpack}    $29.99
${price_bike_light}    $9.99
${price_bolt_tshirt}    $15.99
${price_fleece_jacket}    $49.99

# Button locators
${remove_backpack_xpath}         id=remove-sauce-labs-backpack
${continue_shopping_button_xpath}    id=continue-shopping
${checkout_button_xpath}            id=checkout