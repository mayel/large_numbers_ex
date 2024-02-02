defmodule M do
  def infinity do
    Stream.iterate(1, &(&1 * 10))
    |> Enum.reduce_while(1, fn i, _acc ->
      case M.Cldr.Number.to_string(i, format: :spellout) do
        {:ok, "1" <> _} ->
          IO.puts("......infinity.....")
          {:halt, :ok}

        {:ok, n} ->
          IO.puts("#{i} : #{n} (#{length(Integer.digits(i)) - 1} zeros)")
          {:cont, :ok}
      end
    end)
  end
end
