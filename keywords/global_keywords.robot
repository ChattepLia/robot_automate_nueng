*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Resource   ../resources/global_variables.resource
Resource   ../resources/login_variables.resource

*** Keywords ***
Load Login Test Data From Json
    ${json_text}=    Get File    ${EXECDIR}${/}test_data${/}login_data.json
    ${login_data}=    Evaluate    json.loads($json_text)    json

    ${standard_user}=    Get From Dictionary    ${login_data}    standard_user
    ${problem_user}=    Get From Dictionary    ${login_data}    problem_user
    ${performance_glitch_user}=    Get From Dictionary    ${login_data}    performance_glitch_user
    ${locked_out_user}=    Get From Dictionary    ${login_data}    locked_out_user
    ${password}=    Get From Dictionary    ${login_data}    password
    ${invalid_data}=    Get From Dictionary    ${login_data}    invalid_data

    Set Global Variable    ${standard_user}
    Set Global Variable    ${problem_user}
    Set Global Variable    ${performance_glitch_user}
    Set Global Variable    ${locked_out_user}
    Set Global Variable    ${password}
    Set Global Variable    ${invalid_data}

Open Chrome Without Password Dialog
   Open Browser    ${URL}    ${BROWSER}
    ...    options=add_experimental_option("detach",True);add_experimental_option("prefs", {"profile.password_manager_leak_detection": False})
    Maximize Browser Window

Login With Valid Credentials
    Load Login Test Data From Json
    Open Chrome Without Password Dialog
    Wait Until Element Is Visible   ${login_user_name_xpath}    timeout=5s
    Input Text    ${login_user_name_xpath}    ${standard_user}
    Input Text    ${login_password_xpath}    ${password}
    Click Button    ${login_button_xpath}
    Wait Until Location Is    ${url_inventory}    timeout=5s
