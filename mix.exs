defmodule M.MixProject do
  use Mix.Project

  def project do
    [
      app: :maths,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
        {:jason, "~> 1.4"},
        {:ex_cldr, path: "forks/ex_cldr", override: true},
        # {:ex_cldr, "~> 2.37"},
        {:ex_cldr_numbers, "~> 2.32"},
        {:nimble_csv, "~> 1.1", only: [:dev]},
        {:abacus, "~> 0.4.2"}
        # {:evalex, "~> 0.1.0"},
        # {:rustler, ">= 0.0.0", optional: true}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
