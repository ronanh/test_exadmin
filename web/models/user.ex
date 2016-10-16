defmodule TestExadmin.User do
  use TestExadmin.Web, :model

  schema "users" do
    field :email, :string
    belongs_to :role, TestExadmin.Role

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email])
    |> validate_required([:email])
  end
end
