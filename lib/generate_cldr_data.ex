defmodule M.GenerateCLDRData do
  alias NimbleCSV.RFC4180, as: CSV

  def generate(language \\ 1) do
    "priv/big_numbers.csv"
    |> File.stream!()
    |> CSV.parse_stream()
    |> Enum.reduce({nil, []}, fn data, {previous_entry, cldr} ->
      base = Integer.pow(10, String.to_integer(Enum.at(data, 0)))

      new_entry = %{
        "base_value" => base,
        "definition" => "←← #{String.downcase(Enum.at(data, language))}[ →→]",
        "divisor" => base,
        "radix" => 10
      }

      if previous_entry do
        previous_entry = Map.put(previous_entry, "range", base)
        {new_entry, cldr ++ [previous_entry]}
      else
        {new_entry, cldr}
      end
    end)
    |> case do
      {last_entry, cldr} ->
        last_entry = Map.put(last_entry, "range", last_entry["base_value"] * 10)
        cldr ++ [last_entry]
    end
    |> IO.inspect()
    |> Jason.encode()
    |> case do
      {:ok, json} ->
        IO.puts(json)
        :ok
    end
  end
end
