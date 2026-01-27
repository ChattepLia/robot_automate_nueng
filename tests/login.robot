*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/login_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot
Resource   ${CURDIR}/../keywords/login_keywords.robot


*** Test Cases ***
1 Login Standard User
    login with valid credentials

2 Login Problem User
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_xpath}    ${problem_user}
    Input Text    ${login_password_xpath}     ${password}
    Click Button    ${login_button_xpath}
    Click Login Button and Assert Valid User
    Close Browser

3 Login Performance Glitch User
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_xpath}    ${performance_glitch_user}
    Input Text    ${login_password_xpath}     ${password}
    Click Login Button and Assert Valid User
    Close Browser

4 Login Invalid User Name
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_xpath}    ${invalid_data}
    Input Text    ${login_password_xpath}     ${password}
    Click Button    ${login_button_xpath}
    Wait Until Element Contains   ${login_error_message_xpath}    ${invalid_user_password}    timeout=5s
    Element Should Contain    ${login_error_message_xpath}    ${invalid_user_password}
    Close Browser

5 Login Invalid Password
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_xpath}    ${standard_user}
    Input Text    ${login_password_xpath}     ${invalid_data}
    Click Button    ${login_button_xpath}
    Wait Until Element Contains   ${login_error_message_xpath}    ${invalid_user_password}    timeout=5s
    Element Should Contain    ${login_error_message_xpath}    ${invalid_user_password}
    Close Browser
    
6 Login Invalid User Name and Password
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_xpath}    ${invalid_data}
    Input Text    ${login_password_xpath}     ${invalid_data}
    Click Button    ${login_button_xpath}
    Wait Until Element Contains   ${login_error_message_xpath}    ${invalid_user_password}    timeout=5s
    Element Should Contain    ${login_error_message_xpath}    ${invalid_user_password}
    Close Browser

7 Login With Empty User Name
    Open Chrome Without Password Dialog
    Input Text    ${login_password_xpath}     ${password}
    Click Button    ${login_button_xpath}
    Wait Until Element Contains   ${login_error_message_xpath}    ${empty_user_message}    timeout=5s
    Element Should Contain    ${login_error_message_xpath}    ${empty_user_message}
    Close Browser

8 Login With Empty Password
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_xpath}    ${standard_user}
    Click Button    ${login_button_xpath}
    Element Should Contain    ${login_error_message_xpath}    ${empty_password_message}
    Close Browser

9 Login With Empty User Name And Password
    Open Chrome Without Password Dialog
    Click Button    ${login_button_xpath}
    Element Should Contain    ${login_error_message_xpath}    ${empty_user_password_message}
    Close Browser

10 Login Locked User
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_xpath}    ${locked_out_user}
    Input Text    ${login_password_xpath}     ${password}
    Click Button    ${login_button_xpath}
    Element Should Contain    ${login_error_message_xpath}    ${locked_out_user_message}
    Close Browser