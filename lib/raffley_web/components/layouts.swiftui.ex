defmodule RaffleyWeb.Layouts.SwiftUI do
  use RaffleyNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
