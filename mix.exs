defmodule Crud.MixProject do
  use Mix.Project

  def project do
    [
      app: :crud,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Crud.Application, []}
    ]
  end

  defp deps do
    []
  end
end
