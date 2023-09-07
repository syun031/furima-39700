window.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    if (inputValue !== "") {
      // 販売手数料の計算
      const tax = Math.floor(inputValue * 0.1); // 10%の手数料と仮定

      // 利益の計算
      const profit = inputValue - tax;

      // HTML要素に結果を表示
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = `¥${tax.toLocaleString()}`; // 手数料を通貨形式で表示
      const profitDom = document.getElementById("profit");
      profitDom.innerHTML = `¥${profit.toLocaleString()}`; // 利益を通貨形式で表示
    } else {
      // 入力が空の場合、結果をクリア
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = "";
      const profitDom = document.getElementById("profit");
      profitDom.innerHTML = "";
    }
  });
});