defmodule PersistantLogs do
  def get do
    :persistent_term.get(:logs)
  end

  def put(log) when is_binary(log) do
    :persistent_term.put(:logs, [{log, Time.utc_now()} | get()])
  end

  def reset do
    :persistent_term.put(:logs, [])
  end
end

PersistantLogs.reset()

defmodule RaffleyWeb.HomeLive do
  use RaffleyWeb, :live_view
  use RaffleyNative, :live_view

  def mount(_params, _session, socket) do
    PersistantLogs.put("MOUNT")

    {:ok,
     assign(socket,
       socket_id: socket.id,
       connected: connected?(socket),
       logs: PersistantLogs.get(),
       live_view_pid: inspect(self())
     )}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    PersistantLogs.put("HANDLE PARAMS")

    {:noreply, assign(socket, :logs, PersistantLogs.get())}
  end

  @impl true
  def render(assigns),
    do: ~H"""
    <button phx-click="do-thing">Do thing</button>
    """

  def handle_event("do-thing", _params, socket) do
    IO.inspect("DOING THING")
    {:noreply, socket}
  end

  @impl true
  def handle_event("redirect", _params, socket) do
    PersistantLogs.reset()
    PersistantLogs.put("--REDIRECTING--")
    {:noreply, redirect(socket, to: "/")}
  end

  def handle_event("navigate", _params, socket) do
    PersistantLogs.put("---NAVIGATING---")
    {:noreply, push_navigate(socket, to: "/")}
  end

  def handle_event("patch", _params, socket) do
    PersistantLogs.put("----PATCHING----")
    {:noreply, push_patch(socket, to: "/")}
  end
end
