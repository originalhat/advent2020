defmodule ReportRepairTest do
  use ExUnit.Case

  test "return the product of the matching values" do
    target = 6
    list = [1, 2, 3, 5]
    assert ReportRepair.magic_product(list, target) == 6
  end
end
