*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/../resources/globle_variables.resource

*** Keywords ***
Open Chrome Without Password Dialog
    [Arguments]    ${url}=${url}    ${browser}=chrome    ${user_data_dir}=None
    ${opts}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
    ${prefs}=    Create Dictionary    credentials_enable_service=False    profile.password_manager_enabled=False    password_manager_enabled=False    safebrowsing.enabled=False
    Call Method    ${opts}    add_experimental_option    prefs    ${prefs}

    # (Optional) ปิด popups บางอย่างเพิ่ม
    Call Method    ${opts}    add_argument    --disable-notifications
    Call Method    ${opts}    add_argument    --disable-popup-blocking
    ${user_data_dir}=    Run Keyword If    '${user_data_dir}' == 'None'    Evaluate    tempfile.mkdtemp()    tempfile    ELSE    Set Variable    ${user_data_dir}
    ${user_arg}=    Catenate    SEPARATOR=    --user-data-dir=    ${user_data_dir}
    Call Method    ${opts}    add_argument    ${user_arg}
    Open Browser    ${url}    ${browser}    options=${opts}