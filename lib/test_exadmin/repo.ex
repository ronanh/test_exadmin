defmodule TestExadmin.Repo do
  use Ecto.Repo, otp_app: :test_exadmin
   use Scrivener, page_size: 10  # <--- add this
end
