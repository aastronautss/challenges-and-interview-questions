// A child can hop up the stairs in intervals of 1, 2, or 3 stairs. Write a
// function that computes the number of possible ways in which the child can
// hop up n stairs.

function stairHops(numStairs) {
  return stairHopsMemo(numStairs, 0);
}

function stairHopsMemo(stairsLeft, count) {
  if (stairsLeft === 0) return count + 1;
  if (stairsLeft < 0) return count;

  return count + stairHopsMemo(stairsLeft - 1, 0) + stairHopsMemo(stairsLeft - 2, 0) + stairHopsMemo(stairsLeft - 3, 0);
}
