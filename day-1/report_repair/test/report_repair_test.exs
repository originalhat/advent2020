defmodule ReportRepairTest do
  use ExUnit.Case

  test "return the product of the matching values" do
    list = [100, 101, 102, 103]
    assert ReportRepair.magic_product(list, 204) == 10403
  end
end
