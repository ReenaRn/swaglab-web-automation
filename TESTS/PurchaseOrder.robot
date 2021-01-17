*** Settings ***
Documentation    Add product to shopping cart
Suite Setup       Default Suite Setup
Suite Teardown    Default Suite Teardown
Library           SeleniumLibrary
Resource    ../Keywords/ShoppingCart/Products.robot
Resource    ../Keywords/Checkout/Checkout.robot

*** Test Cases ***
Add product to cart
    [Documentation]    Select a product and add product
    Given Login to swaglab application
    and testcase id is TC03
    When user add selected product to cart
    And checkout products
    Then verify order placed successfully




