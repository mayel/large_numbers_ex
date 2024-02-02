defmodule M.Cldr do
  use Cldr,
    providers: [Cldr.Number],
    locales: ["fr", "es", "el", "en"]
end
