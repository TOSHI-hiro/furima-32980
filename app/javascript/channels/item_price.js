window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     console.log(inputValue);
     
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = inputValue * 0.1;

     const calcProfit = document.getElementById("profit");
     calcProfit.innerHTML = inputValue * 0.9;
     
    })
});
