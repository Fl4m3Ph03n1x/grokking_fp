defmodule Chapter8.IOInTheWild do
  def cast_the_die_impure do
    IO.puts("The die is cast")
    :rand.uniform(10)
  end
end
