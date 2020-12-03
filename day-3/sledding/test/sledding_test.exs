defmodule SleddingTest do
  use ExUnit.Case
  doctest Sledding

  # test "counts the number of tree" do
  #   hill = [
  #     [
  #       ".",
  #       ".",
  #       "#",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       "#"
  #     ],
  #     [
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "."
  #     ],
  #     [
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       "."
  #     ],
  #     [
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       ".",
  #       "#",
  #       ".",
  #       "#",
  #       ".",
  #       ".",
  #       "#",
  #       "."
  #     ]
  #   ]

  #   assert Sledding.how_many_trees(hill) == 2
  # end

  # test "part #1 solution" do
  #   hill = Sledding.parse_file()

  #   assert Sledding.how_many_trees(hill) == 207
  # end

  test "counts the number of tree with custom movements" do
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

    assert Sledding.how_many_trees(hill, 1, 1) == 0
    assert Sledding.how_many_trees(hill, 2, 1) == 1
  end

  test "part #2 solution" do
    hill = Sledding.parse_file()

    assert Sledding.how_many_trees(hill, 1, 1) == 72
    assert Sledding.how_many_trees(hill, 1, 3) == 207
    assert Sledding.how_many_trees(hill, 1, 5) == 90
    assert Sledding.how_many_trees(hill, 1, 7) == 60
    assert Sledding.how_many_trees(hill, 2, 1) == 33
  end
end
