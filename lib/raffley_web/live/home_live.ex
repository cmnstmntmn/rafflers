defmodule RaffleyWeb.HomeLive do
  use RaffleyWeb, :live_view
  use RaffleyNative, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       socket_id: socket.id,
       connected: connected?(socket),
       live_view_pid: inspect(self()),
       open: false
     )}
  end

  def handle_event("sheet-changed", is_open, socket),
    do: {:noreply, assign(socket, :open, !is_open)}

  def handle_event("expansion-changed", is_open, socket),
    do: {:noreply, assign(socket, :open, is_open)}
end
