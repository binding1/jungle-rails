describe("home page for jungle app", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  it("Visit a product page", () => {
    cy.get(".products article").should("be.visible");
    cy.get('[alt="Cliff Collard"]').click();
    cy.get(".products-show").should("be.visible");
  });
});
