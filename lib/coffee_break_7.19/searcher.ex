defmodule CoffeeBreak719.Searcher do
  alias CoffeeBreak719.User
  alias Option

  @spec generate_users :: [User.t()]
  def generate_users do
    [
      %User{name: "Alice", city: Option.some("Melbourne"), favorite_artists: ["Bee Gees"]},
      %User{name: "Bob", city: Option.some("Lagos"), favorite_artists: ["Bee Gees"]},
      %User{name: "Eve", city: Option.some("Tokyo"), favorite_artists: []},
      %User{name: "Mallory", city: Option.none(), favorite_artists: ["Metallica", "Bee Gees"]},
      %User{name: "Trent", city: Option.some("Buenos Aires"), favorite_artists: ["Led Zeppelin"]}
    ]
  end

  @spec f1([User.t()]) :: [User.t()]
  def f1(users) do
    Enum.filter(users, &Enum.all?(&1.city, fn c -> c == "Melbourne" end))
  end

  @spec f2([User.t()]) :: [User.t()]
  def f2(users) do
    Enum.filter(users, &Enum.any?(&1.city, fn c -> c == "Lagos" end))
  end

  @spec f3([User.t()]) :: [User.t()]
  def f3(users) do
    Enum.filter(users, &Enum.any?(&1.favorite_artists, fn a -> a == "Bee Gees" end))
  end

  @spec f4([User.t()]) :: [User.t()]
  def f4(users) do
    Enum.filter(users, &Enum.any?(&1.city, fn c -> String.first(c) == "T" end))
  end

  @spec f5([User.t()]) :: [User.t()]
  def f5(users) do
    Enum.filter(users, &Enum.all?(&1.favorite_artists, fn a -> String.length(a) > 8 end))
  end

  @spec f6([User.t()]) :: [User.t()]
  def f6(users) do
    Enum.filter(users, &Enum.any?(&1.favorite_artists, fn a -> String.first(a) == "M" end))
  end
end
