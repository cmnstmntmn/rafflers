defmodule RaffleyWeb.RaffleLive.Index do
  use RaffleyWeb, :live_view
  use RaffleyNative, :live_view

  alias Raffley.Rafflers
  # alias RaffleyWeb.CustomComponents

  def mount(_params, _session, socket) do
    socket = assign(socket, :raffles, Rafflers.list_raffles())
    {:ok, socket}
  end

  def raffle_card(assigns) do
    ~H"""
    <div class="card relative">
      <.link
        navigate={~p"/raffler/#{@raffle}"}
        class="absolute inset-0 z-10"
        aria-label="View details for my Card"
      >
        <span class="sr-only">View details for My Card</span>
      </.link>
      <img src={@raffle.image_path} />
      <h2>{@raffle.prize}</h2>
      <div class="details">
        <div class="price">
          ${@raffle.ticket_price}/ticket
        </div>
        <.badge status={@raffle.status} />
      </div>
    </div>
    """
  end
end
