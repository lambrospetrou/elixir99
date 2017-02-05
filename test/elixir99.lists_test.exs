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
    assert Lists.p07([]) == []
    assert Lists.p07([[[[1]]]]) == [1]
    assert Lists.p07([1, [2,3], 4, [5, [6, 7]]]) == [1,2,3,4,5,6,7]
    assert Lists.p07([1, [2,3], 4, [5, 6, 7]]) == [1,2,3,4,5,6,7]
    assert Lists.p07([1, [2,3], 4, 5, 6, 7]) == [1,2,3,4,5,6,7]
    assert Lists.p07([1, 2,3, 4, 5, 6, 7]) == [1,2,3,4,5,6,7]
    assert Lists.p07([1, [2, [3, [[[4]]], 5], 6], 7]) == [1,2,3,4,5,6,7]
  end
  test "p07a - flatmap" do
    assert Lists.p07a([]) == []
    assert Lists.p07a([[[[1]]]]) == [1]
    assert Lists.p07a([1, [2,3], 4, [5, [6, 7]]]) == [1,2,3,4,5,6,7]
    assert Lists.p07a([1, [2,3], 4, [5, 6, 7]]) == [1,2,3,4,5,6,7]
    assert Lists.p07a([1, [2,3], 4, 5, 6, 7]) == [1,2,3,4,5,6,7]
    assert Lists.p07a([1, 2,3, 4, 5, 6, 7]) == [1,2,3,4,5,6,7]
    assert Lists.p07a([1, [2, [3, [[[4]]], 5], 6], 7]) == [1,2,3,4,5,6,7]
  end

  test "p08 - unique list" do
    assert Lists.p08([]) == []
    assert Lists.p08([1]) == [1]
    assert Lists.p08([1,2,3,4,5]) == [1,2,3,4,5]
    assert Lists.p08([1,2,2,2,2,2,3,4,4,5,5]) == [1,2,3,4,5]
    assert Lists.p08([1,2,2,1,2,2,2,3,4,4,5,4,4,5]) == [1,2,1,2,3,4,5,4,5]
  end

  test "p09 - pack duplicates" do
    assert Lists.p09([]) == []
    assert Lists.p09([1]) == [[1]]
    assert Lists.p09([1,2,3,4,5]) == [[1],[2],[3],[4],[5]]
    assert Lists.p09([1,2,2,2,2,2,3,4,4,5,5]) == [[1],[2,2,2,2,2],[3],[4,4],[5,5]]
    assert Lists.p09([1,2,2,1,2,2,2,3,4,4,5,4,4,5]) == [[1],[2,2],[1],[2,2,2],[3],[4,4],[5],[4,4],[5]]
  end

  test "p10 - run length encoding" do
    assert Lists.p10([]) == []
    assert Lists.p10([1]) == [{1,1}]
    assert Lists.p10([1,2,3,4,5]) == [{1,1},{1,2},{1,3},{1,4},{1,5}]
    assert Lists.p10([1,2,2,2,2,2,3,4,4,5,5]) == [{1,1},{5,2},{1,3},{2,4},{2,5}]
    assert Lists.p10([1,2,2,1,2,2,2,3,4,4,5,4,4,5]) == [{1,1},{2,2},{1,1},{3,2},{1,3},{2,4},{1,5},{2,4},{1,5}]
  end
  test "p10a - run length encoding second implementation" do
    assert Lists.p10a([]) == []
    assert Lists.p10a([1]) == [{1,1}]
    assert Lists.p10a([1,2,3,4,5]) == [{1,1},{1,2},{1,3},{1,4},{1,5}]
    assert Lists.p10a([1,2,2,2,2,2,3,4,4,5,5]) == [{1,1},{5,2},{1,3},{2,4},{2,5}]
    assert Lists.p10a([1,2,2,1,2,2,2,3,4,4,5,4,4,5]) == [{1,1},{2,2},{1,1},{3,2},{1,3},{2,4},{1,5},{2,4},{1,5}]
  end

  test "p11 - run length encoding modified" do
    assert Lists.p11([]) == []
    assert Lists.p11([1]) == [1]
    assert Lists.p11([1,2,3,4,5]) == [1,2,3,4,5]
    assert Lists.p11([1,2,2,2,2,2,3,4,4,5,5]) == [1,{5,2},3,{2,4},{2,5}]
    assert Lists.p11([1,2,2,1,2,2,2,3,4,4,5,4,4,5]) == [1,{2,2},1,{3,2},3,{2,4},5,{2,4},5]
  end
  test "p11a - run length encoding modified" do
    assert Lists.p11a([]) == []
    assert Lists.p11a([1]) == [1]
    assert Lists.p11a([1,2,3,4,5]) == [1,2,3,4,5]
    assert Lists.p11a([1,2,2,2,2,2,3,4,4,5,5]) == [1,{5,2},3,{2,4},{2,5}]
    assert Lists.p11a([1,2,2,1,2,2,2,3,4,4,5,4,4,5]) == [1,{2,2},1,{3,2},3,{2,4},5,{2,4},5]
  end

  test "p12 - duplicate the elements of a list" do
    assert Lists.p12([]) == []
    assert Lists.p12([1]) == [1,1]
    assert Lists.p12([1,2,3,4,5,6]) == [1,1,2,2,3,3,4,4,5,5,6,6]
  end
  
  test "p13 - duplicate the elements of a list N times" do
    assert Lists.p13([], 1) == []
    assert Lists.p13([1], 1) == [1]
    assert Lists.p13([1,2,3,4,5,6], 1) == [1,2,3,4,5,6]
    assert Lists.p13([1], 2) == [1,1]
    assert Lists.p13([1,2,3,4,5,6], 2) == [1,1,2,2,3,3,4,4,5,5,6,6]
    assert Lists.p13([1], 3) == [1,1,1]
    assert Lists.p13([1,2,3,4,5,6], 3) == [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6]
  end

  test "p14 - drop every k-th element of a list" do
    assert Lists.p14([], 4) == []
    assert Lists.p14([1], 2) == [1]
    assert Lists.p14([1], 1) == []
    assert Lists.p14([1,2,3,4,5,6], 2) == [1,3,5]
    assert Lists.p14([1,2,3,4,5,6], 3) == [1,2,4,5]
  end
  
  test "p15 - split the list in two parts with first part having up to N elements" do
    assert Lists.p15([], 3) == [[], []]
    assert Lists.p15([1], 1) == [[1],[]]
    assert Lists.p15([1,2,3,4,5,6], 3) == [[1,2,3],[4,5,6]]
  end
  
  test "p16 - extract a slice of a list" do
    assert Lists.p16([1,2,3,4,5,6,7,8], 2, 6) == [3,4,5,6, 7]
    assert Lists.p16([1], 0, 10) == [1]
    assert Lists.p16([1,2,3,4,5,6], 0, 5) == [1,2,3,4,5,6]
    assert Lists.p16([1,2,3,4,5,6], 5, 5) == [6]
  end

  test "p17 - rotate a list N places to the left" do
    assert Lists.p17([1,2,3,4,5,6,7,8], 3) == [4,5,6,7,8,1,2,3]
    assert Lists.p17([1,2,3,4,5,6,7,8], -2) == [7,8,1,2,3,4,5,6]
  end
  
  test "p18 - remove the k-th element of a list" do
    assert Lists.p18([1,2,3,4,5,6,7,8], 3) == [1,2,3,5,6,7,8]
    assert Lists.p18([1,2,3,4,5,6,7,8], 0) == [2,3,4,5,6,7,8]
    assert Lists.p18([1,2,3,4,5,6,7,8], 10) == [1,2,3,4,5,6,7,8]
    assert Lists.p18([1,2,3,4,5,6,7,8], 7) == [1,2,3,4,5,6,7]
  end

  test "p19 - add an element to k-th position of a list" do
    assert Lists.p19([1,2,4,5,6,7,8], 3, 2) == [1,2,3,4,5,6,7,8]
    assert Lists.p19([2,3,4,5,6,7,8], 1, 0) == [1,2,3,4,5,6,7,8]
    assert Lists.p19([1,2,3,4,5,6,7,8], 9, 100) == [1,2,3,4,5,6,7,8,9]
    assert Lists.p19([1,2,3,4,5,6,7,8], 9, 8) == [1,2,3,4,5,6,7,8,9]
  end
  
  test "p20 - create a list containing the numbers of a range" do
    assert Lists.p20(5, 5) == [5]
    assert Lists.p20(5, -5) == [5,4,3,2,1,0,-1,-2,-3,-4,-5]
    assert Lists.p20(-5, 5) == [-5,-4,-3,-2,-1,0,1,2,3,4,5]
  end

  test "p21 - Extract a given number of randomly selected elements from a list. (medium)" do
    l = [1,2,3,4,5,6,7,8,9,0]
    selected = Lists.p21(l, 3)
    assert length(selected) == 3
    assert Enum.all?(selected, &(Enum.member?(l, &1))) == true
  end

  test "p22. Lotto: Draw N different random numbers from the set 1..M. (easy)" do
    m = 100
    selected = Lists.p22(m, 3)
    assert length(selected) == 3
    assert Enum.all?(selected, &(1<=&1 and &1<=M)) == true
  end

  test "p23. Create a random permutation of a list. (easy)" do
    l = [1,2,3,4,5,6,7,8]
    selected = Lists.p23(l)
    assert length(selected) == length(l)
    assert Enum.sort(l) == Enum.sort(selected)
  end

  test "p24. Generate the combinations of K distinct objects chosen from the N elements of a list. (medium)" do
    l = [1,2,3,4,5,6]
    method_a = Lists.p24(l, 3)
    assert method_a == [[1,2,3],[1,2,4],[1,2,5],[1,2,6],[1,3,4],[1,3,5],[1,3,6],[1,4,5],[1,4,6],[1,5,6],[2,3,4],[2,3,5],[2,3,6],[2,4,5],[2,4,6],[2,5,6],[3,4,5],[3,4,6],[3,5,6],[4,5,6]]
  end
end
