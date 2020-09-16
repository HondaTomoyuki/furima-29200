function priceInput() {

    var price= document.getElementById("item-price")
        price.addEventListener("keyup", () => {
        const priceValue = document.getElementById("item-price").value
        var maxPriceInput = 99999999;
        var minPriceInput = 300
        
    var salesCommission = document.getElementById("add-tax-price");
    var fee = priceValue * 0.1
        salesCommission.innerHTML = fee
    var total_profit = Math.floor(fee); //小数点切捨て

    var salesProfit = document.getElementById("profit");
        profit = priceValue - fee
        salesProfit.innerHTML = profit
    });
}
window.addEventListener = ('load', priceInput)