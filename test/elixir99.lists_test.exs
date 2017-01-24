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

    test "p11 - run length encoding modified" do
        assert Lists.p11([]) == []
        assert Lists.p11([1]) == [1]
        assert Lists.p11([1,2,3,4,5]) == [1,2,3,4,5]
        assert Lists.p11([1,2,2,2,2,2,3,4,4,5,5]) == [1,{5,2},3,{2,4},{2,5}]
        assert Lists.p11([1,2,2,1,2,2,2,3,4,4,5,4,4,5]) == [1,{2,2},1,{3,2},3,{2,4},5,{2,4},5]
    end
end
