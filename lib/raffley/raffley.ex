defmodule Raffley.Raffle do
  defstruct [:id, :prize, :ticket_price, :status, :image_path, :description]
end

defmodule Raffley.Rafflers do
  def list_raffles do
    [
      %Raffley.Raffle{
        id: 1,
        prize: "Comic book",
        ticket_price: 2,
        status: :upcoming,
        image_path: "/images/comic-book.jpg",
        description: "A rare yeti"
      },
      %Raffley.Raffle{
        id: 2,
        prize: "Authographed Jersey",
        ticket_price: 3,
        status: :open,
        image_path: "/images/jersey.jpg",
        description: "A rare yeti"
      },
      %Raffley.Raffle{
        id: 3,
        prize: "Pet",
        ticket_price: 2,
        status: :closed,
        image_path: "/images/pet-photo.jpg",
        description: "A rare yeti"
      }
    ]
  end

  def get_raffle(id) when is_integer(id) do
    list_raffles() |> Enum.find(fn r -> r.id == id end)
  end

  def get_raffle(id) when is_binary(id) do
    id |> String.to_integer() |> get_raffle()
  end

  def featured_raffles(raffle) do
    list_raffles() |> List.delete(raffle)
  end
end
