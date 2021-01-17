*** Settings ***
Documentation    Amazon login based keywords
Library           ../../Libraries/WebDriverManager.py

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${FIRSTNAME}    Test User
${LASTNAME}    Test User
${POSTALCODE}    1234
${USERNAME_ID}    id:user-name
${PASSWORD_ID}    id:password
${FIRSTNAME_ID}    id:first-name
${LASTNAME_ID}    id:last-name
${POSTALCODE_ID}    id:postal-code
${PASSWORD}    secret_sauce
${LOGIN_BUTTON}    id:login-button
${TITLE_CART}    Your Cart

*** Keywords ***
Checkout products
    Click Element    xpath=//*[@id='shopping_cart_container']
    Element Should Contain    xpath=//*[@class='subheader']    ${TITLE_CART}
    Element Should Be Visible    xpath=//*[@class='btn_action checkout_button']
    Click Element    xpath=//*[@class='btn_action checkout_button']
    Input Text    ${FIRSTNAME_ID}    ${FIRSTNAME}
    Input Text    ${LASTNAME_ID}    ${LASTNAME}
    Input Text    ${POSTALCODE_ID}    ${POSTALCODE}
    Element Should Be Visible    xpath=//*[@class='btn_primary cart_button']
    Click Element    xpath=//*[@class='btn_primary cart_button']
    Element Should Be Visible    xpath=//*[@class='btn_action cart_button']
    Click Element    xpath=//*[@class='btn_action cart_button']

Verify order placed successfully
    Element Text Should Be    xpath=//*[@class='complete-header']    THANK YOU FOR YOUR ORDER
    Log    ${TEST_ID}