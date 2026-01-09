*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.saucedemo.com
${standard_user}    standard_user
${problem_user}    problem_user
${performance_glitch_user}    performance_glitch_user
${locked_out_user}    locked_out_user
${password}    secret_sauce
${invalid_data}    invalid
${inventory_url}    https://www.saucedemo.com/inventory.html
${inventory_page_title}    Swag Labs
${invalid_user_password}    Epic sadface: Username and password do not match any user in this service
${locked_out_user_message}    Epic sadface: Sorry, this user has been locked out.
${empty_user_message}    Epic sadface: Username is required
${empty_password_message}    Epic sadface: Password is required
${empty_user_password_message}    Epic sadface: Username is required

*** Test Cases ***
1 Login Standard User
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Location Should Be    ${inventory_url}
    Page Should Contain        ${inventory_page_title}
    Close Browser

2 Login Problem User
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${problem_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Location Should Be    ${inventory_url}
    Page Should Contain        ${inventory_page_title}
    Close Browser

3 Login Performance Glitch User
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${performance_glitch_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Location Should Be    ${inventory_url}
    Page Should Contain        ${inventory_page_title}
    Close Browser

4 Login Invalid User Name
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${invalid_data}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Element Should Contain    css:.error-message-container    ${invalid_user_password}
    Close Browser

5 Login Invalid Password
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${standard_user}
    Input Text    id:password     ${invalid_data}
    Click Button    id:login-button
    Element Should Contain    css:.error-message-container    ${invalid_user_password}
    Close Browser
    
6 Login Invalid User Name and Password
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${invalid_data}
    Input Text    id:password     ${invalid_data}
    Click Button    id:login-button
    Element Should Contain    css:.error-message-container    ${invalid_user_password}
    Close Browser

7 Login With Empty User Name
    Open Browser    ${url}    chrome
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Element Should Contain    css:.error-message-container    ${empty_user_message}
    Close Browser

8 Login With Empty Password
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${standard_user}
    Click Button    id:login-button
    Element Should Contain    css:.error-message-container    ${empty_password_message}
    Close Browser

9 Login With Empty User Name And Password
    Open Browser    ${url}    chrome
    Click Button    id:login-button
    Element Should Contain    css:.error-message-container    ${empty_user_password_message}
    Close Browser

10 Login Locked User
    Open Browser    ${url}    chrome
    Input Text    id:user-name    ${locked_out_user}
    Input Text    id:password     ${password}
    Click Button    id:login-button
    Element Should Contain    css:.error-message-container    ${locked_out_user_message}
    Close Browser