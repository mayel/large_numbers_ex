# Playing with large numbers in Elixir

1. Install deps with `mix deps.get`
2. `iex -S mix` and then run `M.GenerateCLDRData.generate` which will give you some JSON output
3. copy that JSON into the appropriate place in `deps/ex_cldr/priv/cldr/locales/en.json`
4. change the `ex_cldr` `path` in `mix.exs` to `deps/ex_cldr`
5. `mix deps.compile jason ex_cldr ex_cldr_numbers --force`
6. You're ready, try commands like `M.infinity` or `M.calc "890 ^ 70"`
