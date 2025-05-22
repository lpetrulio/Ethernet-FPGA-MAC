## System Clock
set_property PACKAGE_PIN E3 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in]
create_clock -period 10.000 [get_ports clk_in]  # Defines 100 MHz clock (10 ns period)

## Reset Button
set_property PACKAGE_PIN B8 [get_ports rst_in]
set_property IOSTANDARD LVCMOS33 [get_ports rst_in]

## UART for Debugging
set_property PACKAGE_PIN D10 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]

set_property PACKAGE_PIN A9 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]

## Ethernet Connections
set_property PACKAGE_PIN F15 [get_ports rx_clk]
set_property IOSTANDARD LVCMOS33 [get_ports rx_clk]

set_property PACKAGE_PIN H16 [get_ports tx_clk]
set_property IOSTANDARD LVCMOS33 [get_ports tx_clk]

set_property PACKAGE_PIN D18 [get_ports rxd[0]]
set_property IOSTANDARD LVCMOS33 [get_ports rxd[0]]

set_property PACKAGE_PIN E17 [get_ports rxd[1]]
set_property IOSTANDARD LVCMOS33 [get_ports rxd[1]]

set_property PACKAGE_PIN E18 [get_ports rxd[2]]
set_property IOSTANDARD LVCMOS33 [get_ports rxd[2]]

set_property PACKAGE_PIN G17 [get_ports rxd[3]]
set_property IOSTANDARD LVCMOS33 [get_ports rxd[3]]

set_property PACKAGE_PIN G16 [get_ports rx_dv]
set_property IOSTANDARD LVCMOS33 [get_ports rx_dv]

set_property PACKAGE_PIN H16 [get_ports tx_clk]
set_property IOSTANDARD LVCMOS33 [get_ports tx_clk]

set_property PACKAGE_PIN H14 [get_ports txd[0]]
set_property IOSTANDARD LVCMOS33 [get_ports txd[0]]

set_property PACKAGE_PIN J14 [get_ports txd[1]]
set_property IOSTANDARD LVCMOS33 [get_ports txd[1]]

set_property PACKAGE_PIN J13 [get_ports txd[2]]
set_property IOSTANDARD LVCMOS33 [get_ports txd[2]]

set_property PACKAGE_PIN H17 [get_ports txd[3]]
set_property IOSTANDARD LVCMOS33 [get_ports txd[3]]

set_property PACKAGE_PIN H15 [get_ports tx_en]
set_property IOSTANDARD LVCMOS33 [get_ports tx_en]

set_property PACKAGE_PIN F16 [get_ports mdc]
set_property IOSTANDARD LVCMOS33 [get_ports mdc]

set_property PACKAGE_PIN K13 [get_ports mdio]
set_property IOSTANDARD LVCMOS33 [get_ports mdio]




