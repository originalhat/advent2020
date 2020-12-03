defmodule SleddingTest do
  use ExUnit.Case
  doctest Sledding

  test "counts the number of tree" do
    hill = [
      [
        ".",
        ".",
        "#",
        "#",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "#",
        "#",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "#",
        "#"
      ],
      [
        "#",
        ".",
        ".",
        "#",
        "#",
        ".",
        ".",
        ".",
        "#",
        ".",
        ".",
        "#",
        ".",
        ".",
        ".",
        "#",
        ".",
        ".",
        ".",
        "#",
        ".",
        ".",
        "#",
        ".",
        ".",
        "."
      ],
      [
        ".",
        "#",
        ".",
        ".",
        ".",
        ".",
        "#",
        ".",
        ".",
        "#",
        ".",
        ".",
        "#",
        ".",
        ".",
        ".",
        ".",
        "#",
        ".",
        ".",
        "#",
        ".",
        ".",
        "#",
        ".",
        "."
      ],
      [
        ".",
        ".",
        "#",
        ".",
        "#",
        ".",
        ".",
        ".",
        "#",
        ".",
        "#",
        ".",
        ".",
        "#",
        ".",
        "#",
        ".",
        ".",
        ".",
        "#",
        ".",
        "#",
        ".",
        ".",
        "#",
        "."
      ]
    ]

    assert Sledding.how_many_trees(hill) == 2
  end
end