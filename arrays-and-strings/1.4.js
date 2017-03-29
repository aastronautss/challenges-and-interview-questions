function isPalindromePermutation(str) {
  var charCounts = {};
  str = str.toLowerCase();
  for (var i = 0; i < str.length; i++) {
    var char = str.charAt(i);
    if (char.match(/[a-z]/g)) {
      charCounts[char] = charCounts[char] ? charCounts[char] + 1 : 1;
    }
  }

  return !hasMoreThanOneOdd(charCounts);
}

function hasMoreThanOneOdd(counts) {
  var foundOdd = false;
  for (var key in counts) {
    var count = counts[key]
    if (count % 2 !== 0) {
      if (foundOdd) return true;
      foundOdd = true;
    }
  }

  return false;
}
