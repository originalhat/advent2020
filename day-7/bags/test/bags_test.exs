defmodule BagsTest do
  use ExUnit.Case
  doctest Bags

  test "returns the correct bag count" do
    nodes = %{
      :light_red => [:bright_white, :muted_yellow],
      :dark_orange => [:bright_white, :muted_yellow],
      :bright_white => [:shiny_gold],
      :muted_yellow => [:shiny_gold, :faded_blue],
      :shiny_gold => [:dark_olive, :vibrant_plum],
      :dark_olive => [:faded_blue, :dotted_black],
      :vibrant_plum => [:faded_blue, :dotted_black],
      :faded_blue => [],
      :dotted_black => []
    }

    assert Bags.count_bags(nodes, :shiny_gold) == 4
  end

  test "returns the correct nodes" do
    nodes = %{
      :light_red => [:bright_white, :muted_yellow],
      :dark_orange => [:bright_white, :muted_yellow],
      :bright_white => [:shiny_gold],
      :muted_yellow => [:shiny_gold, :faded_blue],
      :shiny_gold => [:dark_olive, :vibrant_plum],
      :dark_olive => [:faded_blue, :dotted_black],
      :vibrant_plum => [:faded_blue, :dotted_black],
      :faded_blue => [],
      :dotted_black => []
    }

    assert Bags.count_nodes(nodes, :shiny_gold) == [[4, 4], [4, 4]]
  end

  test "askjd" do
    nodes = %{
      :light_red => [:bright_white, :muted_yellow],
      :dark_orange => [:bright_white, :muted_yellow],
      :bright_white => [:shiny_gold],
      :muted_yellow => [:shiny_gold, :faded_blue],
      :shiny_gold => [:dark_olive, :vibrant_plum],
      :dark_olive => [:faded_blue, :dotted_black],
      :vibrant_plum => [:faded_blue, :dotted_black],
      :faded_blue => [],
      :dotted_black => []
    }

    assert Bags.find_parents(nodes, :shiny_gold) == [:bright_white, :muted_yellow]
  end
end
