// Count hash solution

function arePermutations(str1, str2) {
  if (str1.length !== str2.length) return false;

  var char_counts1 = {};
  var char_counts2 = {};
  for (var i = 0; i < str1.length; i++) {
    var char1 = str1.charAt(i);
    var char2 = str2.charAt(i);

    char_counts1[char1] = char_counts1[char1] ? char_counts1[char1] + 1 : 1;
    char_counts2[char2] = char_counts2[char2] ? char_counts2[char2] + 1 : 1;
  }

  for (var char in char_counts1) {
    if (char_counts1.hasOwnProperty(char)) {
      if (char_counts1[char] !== char_counts2[char]) return false;
    }
  }

  return true;
}
