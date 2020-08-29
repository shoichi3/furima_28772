calc = function () {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (item_price.value < 300) {
    add_tax_price.innerHTML = NaN;
    profit.innerHTML = NaN;
  }else{
    let value = item_price.value;
    let tax = Math.floor(value / 10);
    add_tax_price.innerHTML = tax;
    let earning = value - tax;
    profit.innerHTML = earning;
  }
}

window.addEventListener('keyup',calc);