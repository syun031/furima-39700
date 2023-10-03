document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  // 手数料と利益を計算して表示する関数
  function calculateAndDisplay() {
    const inputValue = priceInput.value;
    if (inputValue !== "") {
      const price = parseFloat(inputValue);
      let tax, profit;

      if (price < 1000) {
        tax = 0;
        profit = price;
      } else {
        tax = Math.floor(price * 0.1);
        profit = price - tax;
      }

      addTaxDom.textContent = `¥${tax.toLocaleString()}`;
      profitDom.textContent = `¥${profit.toLocaleString()}`;
    } else {
      addTaxDom.textContent = `¥`;
      profitDom.textContent = `¥`;
    }
  }

  // 価格入力フィールドの値が変更されたときに呼び出すイベントリスナー
  priceInput.addEventListener("input", calculateAndDisplay);

  // ページロード時に初期表示として手数料と利益を計算
  calculateAndDisplay();
});
