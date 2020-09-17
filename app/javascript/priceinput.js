function priceInput() {

    let price= document.getElementById("item-price")
        price.addEventListener("keyup", () => {
  const priceValue = document.getElementById("item-price").value
        
    let salesCommission = document.getElementById("add-tax-price");
    let fee = priceValue * 0.1
    let feeDecimal = Math.floor(fee); //小数点切捨て
    let numericalValue = feeDecimal
        numericalValue.toLocaleString()
        sales = numericalValue.toLocaleString()
        salesCommission.innerHTML = sales
        
    let salesProfit = document.getElementById("profit");
    let profit = priceValue - fee
    let profitDecimal = Math.floor(profit); //小数点切捨て
    let numericalProfit = profitDecimal
        numericalProfit.toLocaleString()
        sales = numericalProfit.toLocaleString()
        salesProfit.innerHTML = sales
    });
}
window.addEventListener = ('load', priceInput)