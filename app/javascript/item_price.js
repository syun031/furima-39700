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
      // 入力が空の場合でも手数料と利益を空欄で表示
      addTaxDom.textContent = `¥`;
      profitDom.textContent = `¥`;
    }
  }

  // 価格入力フィールドの値が変更されたときに呼び出すイベントリスナーを設定
  priceInput.addEventListener("input", updatePriceInfo);

  // ページロード時に初期表示として手数料と利益を計算
  updatePriceInfo();
});
=======
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
