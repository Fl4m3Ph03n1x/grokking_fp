defmodule CoffeeBreak57.DealingWithListsOfLists do
  alias CoffeeBreak57.Book

  @spec recommended_books(String.t()) :: [Book.t()]
  def recommended_books(friend) do
    scala = [
      %Book{title: "FP in Scala", authors: ["Chiusano", "Bjarnason"]},
      %Book{title: "Get Programming with Scala", authors: ["Sfregola"]}
    ]

    fiction = [
      %Book{title: "Harry Potter", authors: ["Rowling"]},
      %Book{title: "The Lord of the Rings", authors: ["Tolkien"]}
    ]

    case friend do
      "Alice" -> scala
      "Bob" -> fiction
      _ -> []
    end
  end

  @spec recommendations([String.t()]) :: [Book.t()]
  def recommendations(friends) do
    friends
    |> Enum.flat_map(&recommended_books/1)
  end
end
