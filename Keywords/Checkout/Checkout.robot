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
${STATUS_PASS}    pass
${STATUS_FAIL}    fail

*** Keywords ***
Checkout products
    ${status}=  Run keyword And Return status    Checkout products from cart
    Run keyword If    ${status}    report event    ${TEST_ID}    checkout products    Selected products checkout    ${STATUS_PASS}    True
    ...    ELSE    report event    ${TEST_ID}    checkout products    Checkout failed    ${STATUS_FAIL}    False

Checkout products from cart
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
    ${status}=  Run keyword And Return status    Purchase products
    Run keyword If    ${status}    report event    ${TEST_ID}    verify order placed successfully    Successfully purchased product    ${STATUS_PASS}    True
    ...    ELSE    report event    ${TEST_ID}    verify order placed successfully    Purchase order failed    ${STATUS_FAIL}    False

Purchase products
    Element Text Should Be    xpath=//*[@class='complete-header']    THANK YOU FOR YOUR ORDER
    Log    ${TEST_ID}