*** Settings ***
Documentation    Add product to shopping cart
Suite Setup       Default Suite Setup
Suite Teardown    Default Suite Teardown
Library           SeleniumLibrary
Resource    ../Keywords/ShoppingCart/Products.robot
Resource    ../Keywords/Checkout/Checkout.robot

*** Test Cases ***
Swaglab online shopping
    [Documentation]    Select a product and add product
    Given Login to swaglab application
    And mapped testcase to TC03
    When user add product to cart
    And checkout products
    Then verify order placed successfully
