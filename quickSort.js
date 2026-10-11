function quicksort(arr) {
  if (arr.length <= 1) {
    return arr;
  }
  const pivot = arr[arr.length - 1];
  const left = [];
  const right = [];
  for (let i = 0; i < arr.length; i++) {
    if (i === arr.length - 1) {
      continue;
    }
    if (arr[i] < pivot) {
      left.push(arr[i]);
    } else {
      right.push(arr[i]);
    }
  }
  const sortedLeft = quicksort(left);
  const sortedRight = quicksort(right);
  return [...sortedLeft, pivot, ...sortedRight];
}