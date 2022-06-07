describe("Test", () => {
  beforeEach(() => {
    // cy.request("GET", "/")
    cy.visit('/')
  })

  it("should be passed and go main page", () => {
    cy.get(".navbar-brand")
      .first()
      .click();
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
})