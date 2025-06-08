defmodule Raffley.Raffle do
  defstruct [:id, :prize, :ticket_price, :status, :image_path, :description]
end

defmodule Raffley.Rafflers do
  def list_raffles do
    [
      %Raffley.Raffle{
        id: 1,
        prize: "Authographed Jersey",
        ticket_price: 2,
        status: :upcoming,
        image_path: "/images/comic-book.jpg",
        description: "A rare yeti"
      },
      %Raffley.Raffle{
        id: 1,
        prize: "Authographed Jersey",
        ticket_price: 3,
        status: :open,
        image_path: "/images/comic-book.jpg",
        description: "A rare yeti"
      },
      %Raffley.Raffle{
        id: 1,
        prize: "Authographed Jersey",
        ticket_price: 2,
        status: :closed,
        image_path: "/images/comic-book.jpg",
        description: "A rare yeti"
      }
    ]
  end
end
