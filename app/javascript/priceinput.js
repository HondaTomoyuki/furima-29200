function priceInput() {

    var price= document.getElementById("item-price")
        price.addEventListener("keyup", () => {
  const priceValue = document.getElementById("item-price").value
        
    var salesCommission = document.getElementById("add-tax-price");
    var fee = priceValue * 0.1
    var feeDecimal = Math.floor(fee); //小数点切捨て
    var numericalValue = feeDecimal
        numericalValue.toLocaleString()
        var sales = numericalValue.toLocaleString()
        salesCommission.innerHTML = sales
        
    var salesProfit = document.getElementById("profit");
    var profit = priceValue - fee
    var profitDecimal = Math.floor(profit); //小数点切捨て
    var numericalProfit = profitDecimal
        numericalProfit.toLocaleString()
    var sales = numericalProfit.toLocaleString()
        salesProfit.innerHTML = sales
    });
}
window.addEventListener = ('load', priceInput)