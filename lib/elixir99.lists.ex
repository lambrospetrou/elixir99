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

end









































