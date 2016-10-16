defmodule TestExadmin.RoleView do
  use TestExadmin.Web, :view

  def render("index.json", %{roles: roles}) do
    %{data: render_many(roles, TestExadmin.RoleView, "role.json")}
  end

  def render("show.json", %{role: role}) do
    %{data: render_one(role, TestExadmin.RoleView, "role.json")}
  end

  def render("role.json", %{role: role}) do
    %{id: role.id,
      name: role.name}
  end
end
