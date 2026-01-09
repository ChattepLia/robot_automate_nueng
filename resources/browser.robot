*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Open Chrome Without Password Dialog
    [Arguments]    ${url}    ${browser}=chrome    ${user_data_dir}=None    ${headless}=False
    ${opts}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
    Call Method    ${opts}    add_argument    --disable-extensions
    Call Method    ${opts}    add_argument    --disable-popup-blocking
    Run Keyword If    ${headless}    Call Method    ${opts}    add_argument    --headless=new
    ${prefs}=    Create Dictionary    credentials_enable_service=False    profile.password_manager_enabled=False
    Call Method    ${opts}    add_experimental_option    prefs    ${prefs}
    Run Keyword If    '${user_data_dir}' != 'None'    Call Method    ${opts}    add_argument    --user-data-dir=${user_data_dir}
    Open Browser    ${url}    ${browser}    options=${opts}
