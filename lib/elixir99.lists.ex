defmodule Elixir99.Lists do
  @moduledoc false

  # 1. Write a function last : 'a list -> 'a option that returns the last element of a list. (easy)
  def p01([]), do: nil
  def p01([h]), do: h
  def p01([_|t]), do: p01(t)

  # 2. Find the last but one (last and penultimate) elements of a list. (easy)
  def p02([]), do: nil
  def p02([_|[]]), do: nil
  def p02([pn|[l]]), do: [pn, l]
  def p02([_|t]), do: p02(t)

  # 3. Find the k'th element of a list. (easy)
  def p03([], _), do: nil
  def p03(l, 1) when is_list(l), do: hd(l)
  def p03(l, k) when is_list(l) and is_integer(k) and k > 1 do
    p03(tl(l), k-1)
  end

  # 4. Find the number of elements of a list. (easy)
  def p04(l) when is_list(l), do: p04_rec(l, 0)
  defp p04_rec([], acc), do: acc
  defp p04_rec([_|t], acc), do: p04_rec(t, acc+1)

  # 5. Reverse a list. (easy)
  def p05(l) when is_list(l), do: p05_rec(l, [])
  defp p05_rec([], acc), do: acc
  defp p05_rec([h|t], acc), do: p05_rec(t, [h|acc])

  # 6. Find out whether a list is a palindrome. (easy)
  def p06([]), do: true
  def p06([_]), do: true
  def p06(l) when is_list(l), do: p06_rec(l, p05(l), true)
  defp p06_rec(l1, l2, false) when is_list(l1) and is_list(l2), do: false
  defp p06_rec([h1], [h2], true), do: h1 == h2
  defp p06_rec([h1|t1], [h2|t2], true), do: p06_rec(t1, t2, (h1 == h2))

  # 6a. Find out whether a list is a palindrome. (easy)
  def p06a(l) when is_list(l), do: l == Enum.reverse(l)

  # 7. Flatten a nested list structure. (medium)
  def p07([]), do: []
  def p07(l) when is_list(l), do: p07_rec(l, [])

  defp p07_rec([h], acc) when not is_list(h), do: [h|acc]
  defp p07_rec([h], acc) when is_list(h), do: p07_rec(h, []) ++ acc
  defp p07_rec([h|t], acc) when not is_list(h), do: [h] ++ p07_rec(t, []) ++ acc
  defp p07_rec([h|t], acc) when is_list(h), do: p07_rec(h, []) ++ p07_rec(t, []) ++ acc

  # 7a. Flatten a nested list structure. (medium)
  def p07a(l) when is_list(l), do: p07a_rec(l, []) |> Enum.reverse
  defp p07a_rec([], acc), do: acc
  defp p07a_rec([h|t], acc) when not is_list(h), do: p07a_rec(t, [h|acc])
  defp p07a_rec([h|t], acc) when is_list(h), do: p07a_rec(t, p07a_rec(h, acc))

  # 8. Eliminate consecutive duplicates of list elements. (medium)
  def p08(l) when is_list(l), do: p08_rec(l, []) |> Enum.reverse
  defp p08_rec([], acc), do: acc
  defp p08_rec([h|t], []), do: p08_rec(t, [h])
  defp p08_rec([h|t], [h|t2]), do: p08_rec(t, [h|t2])
  defp p08_rec([h|t], [h2|t2]), do: p08_rec(t, [h|[h2|t2]])

  # 9. Pack consecutive duplicates of list elements into sublists. (medium)
  def p09(l) when is_list(l), do: p09_rec(l, [], []) |> Enum.reverse
  defp p09_rec([], [], acc), do: acc
  defp p09_rec([], lacc, acc), do: [lacc | acc]
  defp p09_rec([h | t], [], acc), do: p09_rec(t, [h], acc)
  defp p09_rec([h | t], [h | t2], acc), do: p09_rec(t, [h | [h|t2]], acc)
  defp p09_rec([h | t], [h2 | t2], acc), do: p09_rec(t, [h], [[h2|t2] | acc])

  # 10. Run-length encoding of a list. (easy)i
  def p10(l) when is_list(l), do: p10_rec(l, [], 0, []) |> Enum.reverse
  defp p10_rec([], [], 0, acc), do: acc
  defp p10_rec([], lacc, n, acc), do: [{n, hd(lacc)} | acc]
  defp p10_rec([h | t], [], 0, acc), do: p10_rec(t, [h], 1, acc)
  defp p10_rec([h | t], lacc, n, acc) do
    case h == hd(lacc) do
      true -> p10_rec(t, [h|lacc], n+1, acc)
      false -> p10_rec(t, [h], 1, [{n, hd(lacc)} | acc])
    end
  end    

  # 10a. Run-length encoding of a list. (easy)
  def p10a(l) when is_list(l), do: p10a_rec(l, 0, []) |> Enum.reverse
  defp p10a_rec([], 0, []), do: [] # initial list empty
  defp p10a_rec([h], count, acc), do: [{count+1, h} | acc]
  defp p10a_rec([h | [h|t]], count, acc), do: p10a_rec([h|t], count+1, acc)
  defp p10a_rec([h | [h2|t]], count, acc), do: p10a_rec([h2|t], 0, [{count+1, h} | acc])

  # 11. Modified run-length encoding. (easy) (non duplicates appear directly/flatten in the list)
  def p11(l) when is_list(l), do: p11_rec(l, [], 0, []) |> Enum.reverse
  defp p11_rec([], [], 0, acc), do: acc
  defp p11_rec([], [h], 1, acc), do: [h | acc]
  defp p11_rec([], lacc, n, acc), do: [{n, hd(lacc)} | acc]
  defp p11_rec([h | t], [], 0, acc), do: p11_rec(t, [h], 1, acc)
  defp p11_rec([h | t], lacc, n, acc) do
    case h == hd(lacc) do
      true -> p11_rec(t, [h|lacc], n+1, acc)
      false -> 
      case n == 1 do
        true -> p11_rec(t, [h], 1, [hd(lacc) | acc])
        false -> p11_rec(t, [h], 1, [{n, hd(lacc)} | acc])
      end
    end
  end

  # 11a. Modified run-length encoding. (easy) (non duplicates appear directly/flatten in the list)
  def p11a(l) when is_list(l), do: p11a_rec(l, 0, []) |> Enum.reverse
  defp p11a_rec([], _, _), do: [] # initial list empty
  defp p11a_rec([h], 0, acc), do: [h | acc]
  defp p11a_rec([h], count, acc), do: [{count+1, h} | acc]
  defp p11a_rec([h | [h|t]], count, acc), do: p11a_rec([h|t], count+1, acc)
  defp p11a_rec([h | [h2|t]], 0, acc), do: p11a_rec([h2|t], 0, [h | acc])
  defp p11a_rec([h | [h2|t]], count, acc), do: p11a_rec([h2|t], 0, [{count+1, h} | acc])

  # 12. Duplicate the elements of a list. (easy)
  def p12(l) when is_list(l), do: Enum.reverse(p12(l, []))
  defp p12([], acc), do: acc
  defp p12([h|t], acc), do: p12(t, [h,h|acc])

  # 13. Replicate the elements of a list a given number of times. (medium)
  def p13(l, n) when is_list(l) and n > 0, do: Enum.reverse(do_p13(l, n, n, []))
  defp do_p13([], _, _, acc), do: acc
  defp do_p13([_h | t], 0, n, acc), do: do_p13(t, n, n, acc)
  defp do_p13([h | t], c, n, acc), do: do_p13([h | t], c-1, n, [h | acc])

  # 14. Drop every N'th element from a list. (medium)
  def p14(l, k) when is_list(l) and k > 0, do: Enum.reverse(do_p14(l, k, k, []))
  defp do_p14([], _, _, acc), do: acc
  defp do_p14([_h | t], 1, n, acc), do: do_p14(t, n, n, acc) # drop element
  defp do_p14([h | t], c, n, acc), do: do_p14(t, c-1, n, [h | acc])

  # 15. Split a list into two parts; the length of the first part is given. (easy)
  def p15(l, n) when is_list(l) and n >= 0, do: do_p15(l, n, [])
  defp do_p15([], _, acc), do: [Enum.reverse(acc), []]
  defp do_p15(l, 0, acc), do: [Enum.reverse(acc), l]
  defp do_p15([h | t], c, acc), do: do_p15(t, c-1, [h | acc])

  # 16. Extract a slice from a list. (medium)
  def p16(l, from, to) when is_list(l) and from >= 0 and to >= from, do: do_p16(l, from, to, 0, [])
  defp do_p16([], _, _, _, acc), do: Enum.reverse(acc)
  defp do_p16([_h | t], from, to, cidx, acc) when cidx < from, do: do_p16(t, from, to, cidx+1, acc)
  defp do_p16(_l, _from, to, cidx, acc) when cidx > to, do: Enum.reverse(acc)
  defp do_p16([h | t], from, to, cidx, acc), do: do_p16(t, from, to, cidx+1, [h | acc])

  # 17. Rotate a list N places to the left. (medium)
  def p17(l, n) when is_list(l) and n>=0, do: do_p17(l, n, [])
  def p17(l, n) when is_list(l) and n<0, do: Enum.reverse(do_p17(Enum.reverse(l), -n, []))
  defp do_p17([], _, acc), do: acc
  defp do_p17(l, 0, acc), do: l ++ Enum.reverse(acc)
  defp do_p17([h | t], c, acc), do: do_p17(t, c-1, [h | acc])

  # 18. Remove the K'th element from a list. (easy)
  def p18(l, k) when is_list(l) and k>=0, do: do_p18(l, k, [])
  defp do_p18([], _, acc), do: Enum.reverse(acc)
  defp do_p18([_ | t], 0, acc), do: Enum.reverse(acc) ++ t
  defp do_p18([h | t], c, acc), do: do_p18(t, c-1, [h | acc])

  # 19. Insert an element at a given position into a list. (easy)
  def p19(l, v, idx) when is_list(l) and idx>=0, do: do_p19(l, v, idx, [])
  defp do_p19([], v, _, acc), do: Enum.reverse([v | acc])
  defp do_p19(l, v, 0, acc), do: Enum.reverse(acc) ++ [v | l]
  defp do_p19([h | t], v, c, acc), do: do_p19(t, v, c-1, [h | acc])

  # 20. Create a list containing all integers within a given range. (easy)
  # If first argument is greater than second, produce a list in decreasing order.
  def p20(from, to) when is_integer(from) and is_integer(to) and from<=to, do: do_p20(from, to, [])
  def p20(from, to) when is_integer(from) and is_integer(to), do: Enum.reverse(do_p20(to, from, []))
  defp do_p20(from, to, acc) when from > to, do: Enum.reverse(acc)
  defp do_p20(from, to, acc), do: do_p20(from+1, to, [from | acc])

  # 21. Extract a given number of randomly selected elements from a list. (medium)
  def p21(l, n) when is_list(l) and n >= 0, do: do_p21(l, n, [])
  defp do_p21([], _, _), do: []
  defp do_p21(_, 0, acc), do: acc
  defp do_p21(l, c, acc), do: do_p21(l, c-1, [Enum.random(l) | acc])

  # 22. Lotto: Draw N different random numbers from the set 1..M. (easy)
  def p22(upto, n) when upto>0 and n >= 0, do: do_p22(upto, n, [])
  defp do_p22(_, 0, acc), do: acc
  defp do_p22(upto, c, acc), do: do_p22(upto, c-1, [Kernel.round(:rand.uniform * upto) | acc])

  # 23. Generate a random permutation of the elements of a list. (easy)
  def p23(l) when is_list(l), do: do_p23(l)
  defp do_p23(l) do
    sz = length(l)
    Enum.map(l, &({Kernel.round(:rand.uniform * sz), &1}))
    |> Enum.sort(fn({a, _}, {b, _}) -> a < b end)
    |> Enum.map(fn({_, wa}) -> wa end)
  end

  # 24. Generate the combinations of K distinct objects chosen from the N elements of a list. (medium)
  # The algorithm as described in http://stackoverflow.com/a/128592
  def p24(l, k) when is_list(l) and k>0, do: do_p24(Enum.sort(l), k, length(l))
  defp do_p24(l, 1, _sz) do
    for x<-l do [x] end
  end
  defp do_p24(l, k, sz) do
    for x<-0..(sz-k) do
      newList = Enum.drop(l, x)
      Enum.map(do_p24(tl(newList), k-1, sz-x), &([hd(newList) | &1]))
    end
    |> Enum.flat_map(&(&1))
  end
 
  # Same algorithm without the explicit for-comprehension
  # Inspired by https://wiki.haskell.org/99_questions/Solutions/26
  def p24a(l, k) when is_list(l) and k>0, do: do_p24a(Enum.sort(l), k, length(l))
  defp do_p24a(l, 1, _sz), do: (for x<-l do [x] end)
  defp do_p24a([], _, _), do: []
  defp do_p24a(l, k, sz), do: Enum.map(do_p24a(tl(l), k-1, sz), &([hd(l) | &1])) ++ do_p24a(tl(l), k, sz)

end

