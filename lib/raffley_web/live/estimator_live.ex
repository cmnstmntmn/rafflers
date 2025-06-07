defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    IO.inspect(self(), label: "MOUNT")

    if connected?(socket) do
      Process.send_after(self(), :tick, 2000)
    end

    socket = assign(socket, tickets: 3, price: 3)
    {:ok, socket}
  end

  def render(assigns) do
    IO.inspect(self(), label: "RENDER")

    ~H"""
    <section class="estimator bg-red-100">
      <h1 class="text-xl tex-red-500">Price calculator</h1>
      <button class="apparence-button bg-black text-red-500" phx-click="add" phx-value-quantity="5">
        +
      </button>

      <button phx-click="remove">-</button>

      <form phx-change="set-price">
        <label>Ticket price</label>
        <input type="number" name="price" value={@price} />
      </form>

      {@tickets}
      {@price} <br /> ${@tickets * @price}
    </section>
    """
  end

  def handle_event("add", %{"quantity" => quantity}, socket) do
    IO.inspect(self(), label: "ADD")
    socket = update(socket, :tickets, &(&1 + String.to_integer(quantity)))
    {:noreply, socket}
  end

  def handle_event("set-price", %{"price" => price}, socket) do
    socket = assign(socket, :price, String.to_integer(price))

    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 2000)
    {:noreply, update(socket, :tickets, &(&1 + 10))}
  end
end
