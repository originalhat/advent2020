defmodule ReportRepairTest do
  use ExUnit.Case

  test "return the product of the matching values" do
    list = [1, 2, 3, 4]
    assert ReportRepair.magic_product(list, 6) == 8
  end
end
