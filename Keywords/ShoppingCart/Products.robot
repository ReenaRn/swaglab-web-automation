*** Settings ***
Documentation    Amazon login based keywords
Library           ../../Libraries/WebDriverManager.py
Library           ../../Libraries/TestReporter.py

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${USERNAME_ID}    id:user-name
${PASSWORD_ID}    id:password
${PASSWORD}    secret_sauce
${LOGIN_BUTTON}    id:login-button
${TITLE_CART}    Your Cart
${STATUS_PASS}    pass
${STATUS_FAIL}    fail

*** Keywords ***
Default Suite Setup
    set web driver    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}

Default Suite Teardown
    Close Browser

Login to swaglab application
    Input Text    ${USERNAME_ID}    ${USERNAME}
    Input Text    ${PASSWORD_ID}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Title Should Be    Swag Labs

User add product to cart
    ${status}=  Run keyword And Return status    User select and add product to cart
    Run keyword If    ${status}    report event    ${TEST_ID}    user add selected product to cart    Add selected product to cart    ${STATUS_PASS}    True
    ...    ELSE    report event    ${TEST_ID}    user add selected product to cart    Unable to add products to cart    ${STATUS_FAIL}    False

User select and add product to cart
    Element Should Be Visible    xpath=//*[@class='btn_primary btn_inventory'][1]
    Click Element    xpath=//*[@class='btn_primary btn_inventory'][1]
    Element Should Be Visible    xpath=//*[@class='fa-layers-counter shopping_cart_badge'][1]
    Click Element    xpath=//*[@class='fa-layers-counter shopping_cart_badge']
    Click Element    xpath=//*[@id='shopping_cart_container']
    Element Should Contain    xpath=//*[@class='subheader']    ${TITLE_CART}
    ${product_price}=    Get Text    xpath=//*[@class='inventory_item_price']
    Element Should Be Visible    xpath=//*[@class='btn_secondary cart_button']

Mapped testcase to ${test_case_id}
    Set Suite Variable     ${TEST_ID}    ${test_case_id}