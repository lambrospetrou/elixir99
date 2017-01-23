defmodule Elixir99.ListsTest do
  use ExUnit.Case
  doctest Elixir99.Lists
  
  alias Elixir99.Lists

  test "p01 - find the last element of a list" do
    assert Lists.p01([]) == nil
    assert Lists.p01(["h"]) == "h"
    assert Lists.p01(["a", "b", "c"]) == "c"
  end
  
  test "p02 - find the last and penultimate elements of a list" do
    assert Lists.p02([]) == nil
    assert Lists.p02(["a"]) == nil
    assert Lists.p02(["a", "b"]) == ["a", "b"]
    assert Lists.p02(["a", "b", "c", "d"]) == ["c", "d"]
  end
  
  test "p03 - find the kth element of a list" do
    assert Lists.p03([], 1) == nil
    assert Lists.p03(["a"], 1) == "a"
    assert Lists.p03(["a", "b"], 1) == "a"
    assert Lists.p03(["a", "b", "c", "d"], 3) == "c"
  end
  
  test "p04 - length of a list" do
    assert Lists.p04([]) == 0
    assert Lists.p04(["a"]) == 1
    assert Lists.p04(["a", "b"]) == 2
    assert Lists.p04(["a", "b", "c", "d"]) == 4
  end
  
  test "p05 - reverse a list" do
    assert Lists.p05([]) == []
    assert Lists.p05(["a"]) == ["a"]
    assert Lists.p05(["a", "b"]) == ["b", "a"]
    assert Lists.p05(["a", "b", "c", "d"]) == ["d", "c", "b", "a"]
  end
  
  test "p06 - is palindrome" do
    assert Lists.p06([]) == true
    assert Lists.p06(["a"]) == true
    assert Lists.p06(["a", "b"]) == false
    assert Lists.p06(["a", "a"]) == true
    assert Lists.p06(["a", "b", "c", "a"]) == false
    assert Lists.p06(["a", "b", "b", "a"]) == true
    assert Lists.p06(["a", "b", "c", "b", "a"]) == true
  end
  test "p06a - is palindrome" do
    assert Lists.p06a([]) == true
    assert Lists.p06a(["a"]) == true
    assert Lists.p06a(["a", "b"]) == false
    assert Lists.p06a(["a", "a"]) == true
    assert Lists.p06a(["a", "b", "c", "a"]) == false
    assert Lists.p06a(["a", "b", "b", "a"]) == true
    assert Lists.p06a(["a", "b", "c", "b", "a"]) == true
  end

  test "p07 - flatmap" do
    assert Lists.p07([1, [2,3], 4, [5, [6, 7]]]) == [1,2,3,4,5,6,7]
    assert Lists.p07([1, [2,3], 4, [5, 6, 7]]) == [1,2,3,4,5,6,7]
    assert Lists.p07([1, [2,3], 4, 5, 6, 7]) == [1,2,3,4,5,6,7]
    assert Lists.p07([1, 2,3, 4, 5, 6, 7]) == [1,2,3,4,5,6,7]
    assert Lists.p07([1, [2, [3, [[[4]]], 5], 6], 7]) == [1,2,3,4,5,6,7]
  end
end
