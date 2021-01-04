function count (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const countValue = itemPrice.value;


    const countTax = countValue * 1/10
    const taxFloor = Math.floor(countTax)

    const countProfit = countValue - taxFloor


    const addToTaxPrice = document.getElementById("add-tax-price");
    addToTaxPrice.innerHTML = `${taxFloor}`;

    const profit = document.getElementById("profit");
    profit.innerHTML = `${countProfit}`;
  });
}

window.addEventListener('load', count);
