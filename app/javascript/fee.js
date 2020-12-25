function fee() {
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const priceValue = price.value;

    const tax = document.getElementById("add-tax-price");
    const taxResult = Math.floor(priceValue / 10);
    tax.innerHTML = `${taxResult}`;

    const profit = document.getElementById("profit");
    const profitResult = priceValue - taxResult;
    profit.innerHTML = `${profitResult}`;
  });
}
window.addEventListener("load", fee);