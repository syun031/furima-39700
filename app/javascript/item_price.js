document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  // 価格入力フィールドの値が変更されたときに呼び出す関数
  function updatePriceInfo() {
    const inputValue = priceInput.value;
    if (inputValue !== "") {
      const price = parseFloat(inputValue);

      // 販売手数料と利益の計算
      let tax, profit;

      if (price < 1000) {
        // 価格が1000未満の場合、手数料0円
        tax = 0;
        profit = price;
      } else {
        // 価格が1000以上の場合、10%の手数料を計算
        tax = Math.floor(price * 0.1);
        profit = price - tax;
      }

      // HTML要素に結果を表示
      addTaxDom.textContent = `¥${tax.toLocaleString()}`;
      profitDom.textContent = `¥${profit.toLocaleString()}`;
    } else {
      // 値が空の場合も手数料と利益をクリア
      addTaxDom.textContent = "";
      profitDom.textContent = "";
    }
  }

  // 価格入力フィールドの値が変更されたときに呼び出すイベントリスナーを設定
  priceInput.addEventListener("input", updatePriceInfo);

  // ページロード時にも手数料と利益を更新
  updatePriceInfo();
});
