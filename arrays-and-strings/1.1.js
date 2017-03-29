// Solution with additional data structures

function allUnique(str) {
  var charsSeen = {};

  for (var i = 0; i < str.length; i++) {
    var char = str.charAt(i);
    if (charsSeen[char]) === true {
      return false;
    } else {
      charsSeen[char] = true;
    }
  }

  return true;
}

// Solution without additional data structures

function allUniqueSmall(str) {
  for (var i = 0; i < str.length; i++) {
    var base = str.charAt(i);

    for (var j = i + 1; j < str.length; j++) {
      var check = str.charAt(j);
      if (base === check) {
        return false;
      }
    }
  }

  return true;
}
