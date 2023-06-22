defmodule GrokkingFp.MixProject do
  use Mix.Project

  def project do
    [
      app: :grokking_fp,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
      # dialyzer: [
      #   flags: ["-Wunmatched_returns", :error_handling, :race_conditions, :overspecs]
      # ]
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
      {:comprehendex, path: "../comprehendex"},
      # {:currying, "~> 1.0"},
      {:gradient, github: "esl/gradient"}
      # {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end
end
