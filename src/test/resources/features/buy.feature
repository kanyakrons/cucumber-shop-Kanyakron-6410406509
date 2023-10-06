Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Butter" with price 80.00 and stock of 15 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00
    Then "Bread" stock should be 3

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00
    Then "Bread" stock should be 3
    Then "Jam" stock should be 9

Scenario Outline: Buy one product in table
    When I buy "Bread" with quantity 2
    Then total should be 41.00
    Then "Bread" stock should be 3
    Examples:
        | product  | quantity |  total  | stock |
        | "Bread"  |     1    |   20.50 |   4   |
        | "Jam"    |     2    |  160.00 |   8   |
