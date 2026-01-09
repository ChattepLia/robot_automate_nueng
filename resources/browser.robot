*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Open Chrome Without Password Dialog
    [Arguments]    ${url}    ${browser}=chrome    ${user_data_dir}=None    ${headless}=False
    ${opts}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
    Call Method    ${opts}    add_argument    --disable-extensions
    Call Method    ${opts}    add_argument    --disable-popup-blocking
    Call Method    ${opts}    add_argument    --no-first-run
    Call Method    ${opts}    add_argument    --no-default-browser-check
    Run Keyword If    ${headless}    Call Method    ${opts}    add_argument    --headless=new
    ${prefs}=    Create Dictionary    credentials_enable_service=False    profile.password_manager_enabled=False    password_manager_enabled=False    safebrowsing.enabled=False
    Call Method    ${opts}    add_experimental_option    prefs    ${prefs}
    ${sw}=    Create List    enable-automation
    Call Method    ${opts}    add_experimental_option    excludeSwitches    ${sw}
    Call Method    ${opts}    add_experimental_option    useAutomationExtension    False
    ${user_data_dir}=    Run Keyword If    '${user_data_dir}' == 'None'    Evaluate    tempfile.mkdtemp()    tempfile    ELSE    Set Variable    ${user_data_dir}
    Call Method    ${opts}    add_argument    --user-data-dir=${user_data_dir}
    Open Browser    ${url}    ${browser}    options=${opts}
