describe("Test", () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("should go to the products/ page", () => {
    cy.get('.me-auto > .nav-item > .nav-link')
      .click()
    cy.get(':nth-child(2) > a > img')
      .click();
  })

  it("should add product in cart", () => {
    cy.visit('/categories/1')
    cy.get(':nth-child(1) > a > img')
      .click();
    cy.get('.product-detail')
      .get(':nth-child(4) > .button_to')
      .get(':nth-child(4) > .button_to > .btn')
      .click();
    cy.get('.end-0 > .nav-link')
      .click();
    cy.get(':nth-child(4) > div')
      .contains(1)
  })

})