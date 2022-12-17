function product_tax (){
  const productPrice = document.getElementById("item-price");
  productPrice.addEventListener("keyup", () => {
    const commission = productPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    const commissionInt = Math.floor(commission);
    addTaxPrice.innerHTML = `${commissionInt}`;
    const salesProfit = productPrice.value - commission ;
    const profit = document.getElementById("profit");
    const salesProfitInt = Math.floor(salesProfit);
    profit.innerHTML = `${salesProfitInt}`;
  });
}

window.addEventListener('load', product_tax);