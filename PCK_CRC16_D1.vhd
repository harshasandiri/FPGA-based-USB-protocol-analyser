
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package PCK_CRC16_D1 is
  -- polynomial: x^16 + x^15 + x^2 + 1
  -- data width: 1
  -- convention: the first serial bit is D[0]
  function nextCRC16_D1
    (Data: std_logic;
	  Seed: std_logic_vector(15 downto 0))
    return std_logic_vector;
end PCK_CRC16_D1;


package body PCK_CRC16_D1 is

  -- polynomial: x^16 + x^15 + x^2 + 1
  -- data width: 1
  -- convention: the first serial bit is D[0]
  function nextCRC16_D1
    (Data: std_logic;
	  Seed: std_logic_vector(15 downto 0))
    return std_logic_vector is


    variable newSeed: std_logic_vector(15 downto 0);

  begin

    newSeed(0) := Data xor Seed(15);
    newSeed(1) := Seed(0);
    newSeed(2) := Data xor Seed(1) xor Seed(15);
    newSeed(3) := Seed(2);
    newSeed(4) := Seed(3);
    newSeed(5) := Seed(4);
    newSeed(6) := Seed(5);
    newSeed(7) := Seed(6);
    newSeed(8) := Seed(7);
    newSeed(9) := Seed(8);
    newSeed(10) := Seed(9);
    newSeed(11) := Seed(10);
    newSeed(12) := Seed(11);
    newSeed(13) := Seed(12);
    newSeed(14) := Seed(13);
    newSeed(15) := Data xor Seed(14) xor Seed(15);
    return newSeed;
  end nextCRC16_D1;

end PCK_CRC16_D1;
