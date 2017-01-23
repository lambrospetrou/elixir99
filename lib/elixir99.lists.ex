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

end
