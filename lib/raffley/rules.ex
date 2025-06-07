defmodule Raffley.Rules do
  def list_rules do
    [
      %{
        id: 1,
        text: "Participants must have a hight tolerance for puns and dar jokes"
      },
      %{
        id: 2,
        text: "Winner must to a vitory dance when claiming their prize"
      },
      %{
        id: 3,
        text: "Must have fun!"
      }
    ]
  end

  def get_rule(id) when is_integer(id) do
    list_rules()
    |> Enum.find(fn r -> r.id == id end)
  end

  def get_rule(id) when is_binary(id) do
    id |> String.to_integer() |> get_rule()
  end
end
