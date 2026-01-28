*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource
Resource   ${CURDIR}/../resources/login_variables.resource
Resource   ${CURDIR}/../keywords/global_keywords.robot
Resource   ${CURDIR}/../keywords/login_keywords.robot

Documentation    Test cases for login page

*** Test Cases ***
1 Login Standard User
    login with valid credentials

2 Login Problem User
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_id}    ${problem_user}
    Input Text    ${login_password_id}     ${password}
    Click Button    ${login_button_id}
    Click Login Button and Assert Valid User
    Close Browser

3 Login Performance Glitch User
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_id}    ${performance_glitch_user}
    Input Text    ${login_password_id}     ${password}
    Click Login Button and Assert Valid User
    Close Browser

4 Login Invalid User Name
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_id}    ${invalid_data}
    Input Text    ${login_password_id}     ${password}
    Click Button    ${login_button_id}
    Wait Until Element Contains   ${login_error_message_css}    ${invalid_user_password}    timeout=5s
    Element Should Contain    ${login_error_message_css}    ${invalid_user_password}
    Close Browser

5 Login Invalid Password
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_id}    ${standard_user}
    Input Text    ${login_password_id}     ${invalid_data}
    Click Button    ${login_button_id}
    Wait Until Element Contains   ${login_error_message_css}    ${invalid_user_password}    timeout=5s
    Element Should Contain    ${login_error_message_css}    ${invalid_user_password}
    Close Browser
    
6 Login Invalid User Name and Password
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_id}    ${invalid_data}
    Input Text    ${login_password_id}     ${invalid_data}
    Click Button    ${login_button_id}
    Wait Until Element Contains   ${login_error_message_css}    ${invalid_user_password}    timeout=5s
    Element Should Contain    ${login_error_message_css}    ${invalid_user_password}
    Close Browser

7 Login With Empty User Name
    Open Chrome Without Password Dialog
    Input Text    ${login_password_id}     ${password}
    Click Button    ${login_button_id}
    Wait Until Element Contains   ${login_error_message_css}    ${empty_user_message}    timeout=5s
    Element Should Contain    ${login_error_message_css}    ${empty_user_message}
    Close Browser

8 Login With Empty Password
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_id}    ${standard_user}
    Click Button    ${login_button_id}
    Element Should Contain    ${login_error_message_css}    ${empty_password_message}
    Close Browser

9 Login With Empty User Name And Password
    Open Chrome Without Password Dialog
    Click Button    ${login_button_id}
    Element Should Contain    ${login_error_message_css}    ${empty_user_password_message}
    Close Browser

10 Login Locked User
    Open Chrome Without Password Dialog
    Input Text    ${login_user_name_id}    ${locked_out_user}
    Input Text    ${login_password_id}     ${password}
    Click Button    ${login_button_id}
    Element Should Contain    ${login_error_message_css}    ${locked_out_user_message}
    Close Browser