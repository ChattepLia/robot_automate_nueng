*** Settings ***
Library   SeleniumLibrary
Resource   ${CURDIR}/../resources/global_variables.resource

*** Variables ***
#Users login
${standard_user}    standard_user
${problem_user}    problem_user
${performance_glitch_user}    performance_glitch_user
${locked_out_user}    locked_out_user
${password}    secret_sauce
${invalid_data}    invalid

#Locators for login page
${login_user_name_id}    id:user-name
${login_password_id}    id:password
${login_button_id}    id:login-button
${login_error_message_css}    css:.error-message-container

#Messages login
${inventory_page_title}    Swag Labs
${invalid_user_password}    Epic sadface: Username and password do not match any user in this service
${locked_out_user_message}    Epic sadface: Sorry, this user has been locked out.
${empty_user_message}    Epic sadface: Username is required
${empty_password_message}    Epic sadface: Password is required
${empty_user_password_message}    Epic sadface: Username is required