defmodule PassportTest do
  use ExUnit.Case
  doctest Passport

  test "invalid passport" do
    valid_passport = %{
      :byr => "1988",
      :iyr => "2020",
      :eyr => "2030",
      :hgt => "180",
      :ecl => "brown",
      :pid => "123456",
      :cid => "1"
    }

    assert Passport.is_valid?(Map.delete(valid_passport, :byr)) == false
    assert Passport.is_valid?(Map.delete(valid_passport, :iyr)) == false
    assert Passport.is_valid?(Map.delete(valid_passport, :eyr)) == false
    assert Passport.is_valid?(Map.delete(valid_passport, :hgt)) == false
    assert Passport.is_valid?(Map.delete(valid_passport, :ecl)) == false
    assert Passport.is_valid?(Map.delete(valid_passport, :pid)) == false
  end

  test "valid passport" do
    valid_passport = %{
      :byr => "1988",
      :iyr => "2020",
      :eyr => "2030",
      :hgt => "180",
      :ecl => "brown",
      :pid => "123456",
      :cid => "1"
    }

    assert Passport.is_valid?(valid_passport) == true
  end

  test "country ID can be missing if all other fields are present" do
    north_pole_passport = %{
      :byr => "1988",
      :iyr => "2020",
      :eyr => "2030",
      :hgt => "180",
      :ecl => "brown",
      :pid => "123456"
    }

    assert Passport.is_valid?(north_pole_passport) == true
  end

  test "part #1" do
    passports = Passport.parse_file()

    assert Passport.num_valid_passports(passports) == 236
  end
end
