function bubbleSort(arr) {
  for (let j = 0; j < arr.length - 1; j++) {
    let swaps = 0;
    for (let i = 0; i < arr.length - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        let temp = arr[i + 1];
        arr[i + 1] = arr[i];
        arr[i] = temp;
        swaps++;
      }
    }
    if (!swaps) {
      break;
    }
  }
  return arr;
}