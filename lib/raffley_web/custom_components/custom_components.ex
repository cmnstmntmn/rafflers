defmodule RaffleyWeb.CustomComponents do
  use Phoenix.Component
  use RaffleyWeb, :verified_routes

  embed_templates "icons/*"

  attr :status, :atom, required: true, values: [:upcoming, :open, :closed]
  attr :class, :string, default: nil

  def badge(assigns) do
    ~H"""
    <div class={[
      "rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border",
      @status == :open && "text-lime-600 border-lime-600",
      @status == :upcoming && "text-amber-600 border-amber-600",
      @status == :closed && "text-gray-600 border-gray-600"
    ]}>
      {@status}

      <.moon_icon />

      <a href={~p"/"}>Home</a>
    </div>
    """
  end

  slot :inner_block, required: true
  slot :details

  def banner(assigns) do
    assigns = assign(assigns, :emoji, ~w(🎉 ❤️) |> Enum.random())

    ~H"""
    <div class="banner">
      <h1>
        {render_slot(@inner_block)}
      </h1>
      <div :for={details <- @details} :if={@details != []} class="details">
        {render_slot(details, @emoji)}
      </div>
    </div>
    """
  end
end
