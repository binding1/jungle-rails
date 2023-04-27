describe("home page for jungle app", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Adds a product to cart", () => {
    cy.get(".products article").should("be.visible");
    cy.get('[alt="Cliff Collard"]').click();
    cy.get(".products-show").should("be.visible");
    cy.get(".btn").click();
    cy.get(".end-0 > .nav-link").should("contain.text", "My Cart (1)");
  });
});
