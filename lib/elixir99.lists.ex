defmodule Elixir99.Lists do

    # last element
    def p01([]), do: nil
    def p01([h]), do: h
    def p01([_|t]), do: p01(t)

    # penultimate element
    def p02([]), do: nil
    def p02([_|[]]), do: nil
    def p02([pn|[l]]), do: [pn, l]
    def p02([_|t]), do: p02(t)

    # K-th element
    def p03([], _), do: nil
    def p03(l, 1) when is_list(l), do: hd(l)
    def p03(l, k) when is_list(l) and is_integer(k) and k > 1 do
        p03(tl(l), k-1)
    end

    # length of a list
    def p04(l) when is_list(l), do: p04_rec(l, 0)
    defp p04_rec([], acc), do: acc
    defp p04_rec([_|t], acc), do: p04_rec(t, acc+1)

    # reverse a list
    def p05(l) when is_list(l), do: p05_rec(l, [])
    defp p05_rec([], acc), do: acc
    defp p05_rec([h|t], acc), do: p05_rec(t, [h|acc])

    # is palindrome
    def p06([]), do: true
    def p06([_]), do: true
    def p06(l) when is_list(l), do: p06_rec(l, p05(l), true)
    defp p06_rec(l1, l2, false) when is_list(l1) and is_list(l2), do: false
    defp p06_rec([h1], [h2], true), do: h1 == h2
    defp p06_rec([h1|t1], [h2|t2], true), do: p06_rec(t1, t2, (h1 == h2))

    def p06a(l) when is_list(l), do: l == Enum.reverse(l)

    # flatten a list of lists
    def p07([]), do: []
    def p07(l) when is_list(l), do: p07_rec(l, [])

    defp p07_rec([h], acc) when not is_list(h), do: [h|acc]
    defp p07_rec([h], acc) when is_list(h), do: p07_rec(h, []) ++ acc
    defp p07_rec([h|t], acc) when not is_list(h), do: [h] ++ p07_rec(t, []) ++ acc
    defp p07_rec([h|t], acc) when is_list(h), do: p07_rec(h, []) ++ p07_rec(t, []) ++ acc

    # flatten second implementation
    def p07a(l) when is_list(l), do: p07a_rec(l, []) |> Enum.reverse
    defp p07a_rec([], acc), do: acc
    defp p07a_rec([h|t], acc) when not is_list(h), do: p07a_rec(t, [h|acc])
    defp p07a_rec([h|t], acc) when is_list(h), do: p07a_rec(t, p07a_rec(h, acc))

    # eliminate duplicates
    def p08(l) when is_list(l), do: p08_rec(l, []) |> Enum.reverse
    defp p08_rec([], acc), do: acc
    defp p08_rec([h|t], []), do: p08_rec(t, [h])
    defp p08_rec([h|t], [h|t2]), do: p08_rec(t, [h|t2])
    defp p08_rec([h|t], [h2|t2]), do: p08_rec(t, [h|[h2|t2]])

    # pack duplicates into sublists
    def p09(l) when is_list(l), do: p09_rec(l, [], []) |> Enum.reverse
    defp p09_rec([], [], acc), do: acc
    defp p09_rec([], lacc, acc), do: [lacc | acc]
    defp p09_rec([h | t], [], acc), do: p09_rec(t, [h], acc)
    defp p09_rec([h | t], [h | t2], acc), do: p09_rec(t, [h | [h|t2]], acc)
    defp p09_rec([h | t], [h2 | t2], acc), do: p09_rec(t, [h], [[h2|t2] | acc])
    
    # Run-length encoding
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

    # Run-length encoding second implementation
    def p10a(l) when is_list(l), do: p10a_rec(l, 0, []) |> Enum.reverse
    defp p10a_rec([], 0, []), do: [] # initial list empty
    defp p10a_rec([h], count, acc), do: [{count+1, h} | acc]
    defp p10a_rec([h | [h|t]], count, acc), do: p10a_rec([h|t], count+1, acc)
    defp p10a_rec([h | [h2|t]], count, acc), do: p10a_rec([h2|t], 0, [{count+1, h} | acc])

    # Run-length encoding modified (non duplicates appear directly in the list)
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
end
