defmodule RaffleyWeb.RaffleLive.Show do
  use RaffleyWeb, :live_view
  use RaffleyNative, :live_view

  alias Raffley.Rafflers
  # alias RaffleyWeb.CustomComponents

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    raffle = Rafflers.get_raffle(id)
    featured_raffles = Rafflers.featured_raffles(raffle)

    socket =
      socket
      |> assign(:raffle, raffle)
      |> assign(:featured_raffles, featured_raffles)
      |> assign(:page_title, raffle.prize)

    {:noreply, socket}
  end

  def raffle_card(assigns) do
    ~H"""
    <div class="card">
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
