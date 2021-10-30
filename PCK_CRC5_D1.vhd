library ieee;
use ieee.std_logic_1164.all;

package PCK_CRC5_D1 is
  -- polynomial: x^5 + x^2 + 1
  -- data width: 1
  -- convention: the first serial bit is D[0]
  function nextCRC5_D1 (
    Data : std_logic;
    Seed : std_logic_vector(4 downto 0)
    ) return std_logic_vector;
end PCK_CRC5_D1;


package body PCK_CRC5_D1 is

  -- polynomial: x^5 + x^2 + 1
  -- data width: 1
  -- convention: the first serial bit is D[0]
  function nextCRC5_D1 (
    Data : std_logic;
    Seed : std_logic_vector(4 downto 0)
    ) return std_logic_vector is

    variable newSeed : std_logic_vector(4 downto 0);

  begin
    newSeed(0) := Data xor Seed(4);
    newSeed(1) := Seed(0);
    newSeed(2) := Data xor Seed(1) xor Seed(4);
    newSeed(3) := Seed(2);
    newSeed(4) := Seed(3);
    
    return newSeed;
  end nextCRC5_D1;

end PCK_CRC5_D1;