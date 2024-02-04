defmodule M do
  def infinity do
    Stream.iterate(1, &(&1 * 10))
    |> Enum.reduce_while(1, fn i, _acc ->
      case M.Cldr.Number.to_string(i, format: :spellout) do
        {:ok, "1" <> _} ->
          IO.puts("......infinity.....")
          {:halt, :ok}

        {:ok, "one " <> _ = n} ->
          if n |> String.split() |> length() == 2 do
            IO.puts("#{i} : #{n} (#{length(Integer.digits(i)) - 1} zeros)")
          end

          {:cont, :ok}

        {:ok, _n} ->
          {:cont, :ok}
      end
    end)
  end

  def calc(input) do
    # case EvalEx.eval(input) do
    case Abacus.eval(input) do
      {:ok, n} when is_number(n) ->
        with {:ok, f} <- M.Cldr.Number.to_string(round(n), format: :spellout) do
          IO.puts(f)
          n
        end

      {:ok, res} ->
        res

      other ->
        other
    end
  end
end
