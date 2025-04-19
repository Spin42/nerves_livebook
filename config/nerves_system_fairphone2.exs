import Config

# Configure the network using vintage_net
# See https://github.com/nerves-networking/vintage_net for more information
config :vintage_net,
  config: [
    {"usb0", %{type: VintageNetDirect}},
    {"eth0", %{type: VintageNetEthernet, ipv4: %{method: :dhcp}}},
    {"wlan0", %{type: VintageNetWiFi}},
    {"wwan0",
      %{
        type: VintageNetQMI,
        vintage_net_qmi: %{
          service_providers: [%{apn: "simbase"}],
          device_path: "/dev/wwan0qmi0"
        }
      }
    }
  ]

config :logger,
  backends: [RingLogger, :console],
  level: :debug
