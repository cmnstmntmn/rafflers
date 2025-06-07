defmodule RaffleyWeb.RuleHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use RaffleyWeb, :html

  embed_templates "rule_html/*"

  def show(assigns) do
    ~H"""
    <h1>Don't forget...</h1>
    {@rule.text}
    """
  end
end
