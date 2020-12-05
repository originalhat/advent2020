defmodule PassportTest do
  use ExUnit.Case
  doctest Passport

  test "invalid passport" do
    valid_passport = %{
      :byr => "1988",
      :iyr => "2020",
      :eyr => "2030",
      :hgt => "180cm",
      :hcl => "#ffffff",
      :ecl => "brn",
      :pid => "000000999",
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
      :hgt => "180cm",
      :hcl => "#ffffff",
      :ecl => "brn",
      :pid => "000000999",
      :cid => "1"
    }

    assert Passport.is_valid?(valid_passport) == true
  end

  test "country ID can be missing if all other fields are present" do
    north_pole_passport = %{
      :byr => "1988",
      :iyr => "2020",
      :eyr => "2030",
      :hgt => "180cm",
      :hcl => "#ffffff",
      :ecl => "brn",
      :pid => "000000999"
    }

    assert Passport.is_valid?(north_pole_passport) == true
  end

  test "solution" do
    passports = Passport.parse_file()

    assert Passport.num_valid_passports(passports) == 115
  end

  test "valid birth year" do
    assert Passport.valid_byr?(123) == false
    assert Passport.valid_byr?(1919) == false
    assert Passport.valid_byr?(1920) == true
    assert Passport.valid_byr?(2002) == true
    assert Passport.valid_byr?(2003) == false
    assert Passport.valid_byr?(1988) == true
    assert Passport.valid_byr?(2) == false
  end

  test "valid height" do
    assert Passport.valid_hgt?("123cm") == false
    assert Passport.valid_hgt?("149cm") == false
    assert Passport.valid_hgt?("150cm") == true
    assert Passport.valid_hgt?("193cm") == true
    assert Passport.valid_hgt?("194cm") == false

    assert Passport.valid_hgt?("57in") == false
    assert Passport.valid_hgt?("58in") == false
    assert Passport.valid_hgt?("59in") == true
    assert Passport.valid_hgt?("76in") == true
    assert Passport.valid_hgt?("77in") == false
  end

  test "valid hair color" do
    assert Passport.valid_hcl?("#fff000") == true
    assert Passport.valid_hcl?("fff000") == false
    assert Passport.valid_hcl?("#fff***") == false
    assert Passport.valid_hcl?("7c63aa") == false
    assert Passport.valid_hcl?("z") == false
  end

  test "valid eye color" do
    assert Passport.valid_ecl?("amb") == true
    assert Passport.valid_ecl?("brn") == true
    assert Passport.valid_ecl?("ylw") == false
  end
end
