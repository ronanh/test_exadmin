defmodule TestExadmin.UserView do
  use TestExadmin.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, TestExadmin.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, TestExadmin.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      role_id: user.role_id}
  end
end
