{ config, pkgs, ... }: {
  services.udev.enable = true;
  services.udev.extraRules = ''
    # qFlipper configuration
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ATTRS{manufacturer}=="Flipper Devices Inc.", TAG+="uaccess"

    # probe-rs configuration
    ACTION!="add|change", GOTO="probe_rs_rules_end"

    SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"

    SUBSYSTEM!="usb|tty|hidraw", GOTO="probe_rs_rules_end"

    # Please keep this list sorted by VID:PID

    # STMicroelectronics ST-LINK V1
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3744", TAG+="uaccess"

    # STMicroelectronics ST-LINK/V2
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", TAG+="uaccess"

    # STMicroelectronics ST-LINK/V2.1
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", TAG+="uaccess"
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3752", TAG+="uaccess"

    # STMicroelectronics STLINK-V3
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374d", TAG+="uaccess"
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374e", TAG+="uaccess"
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374f", TAG+="uaccess"
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3753", TAG+="uaccess"
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3754", TAG+="uaccess"

    # SEGGER J-Link
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0101", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0102", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0103", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0104", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0105", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0107", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0108", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1001", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1002", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1003", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1004", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1005", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1006", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1007", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1008", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1009", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="100a", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="100b", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="100c", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="100d", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="100e", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="100f", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1010", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1011", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1012", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1013", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1014", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1015", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1016", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1017", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1018", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1019", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="101a", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="101b", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="101c", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="101d", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="101e", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="101f", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1020", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1021", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1022", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1023", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1024", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1025", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1026", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1027", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1028", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1029", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="102a", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="102b", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="102c", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="102d", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="102e", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="102f", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1050", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1051", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1052", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1053", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1054", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1055", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1056", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1057", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1058", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1059", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="105a", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="105b", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="105c", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="105d", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="105e", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="105f", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1060", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1061", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1062", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1063", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1064", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1065", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1066", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1067", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1068", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1069", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="106a", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="106b", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="106c", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="106d", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="106e", TAG+="uaccess"
    ATTRS{idVendor}=="1366", ATTRS{idProduct}=="106f", TAG+="uaccess"


    # Espressif USB JTAG/serial debug unit
    ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1001", TAG+="uaccess"
    # Espressif USB Bridge
    ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1002", TAG+="uaccess"

    # CMSIS-DAP compatible adapters
    ATTRS{product}=="*CMSIS-DAP*", TAG+="uaccess"

    LABEL="probe_rs_rules_end"
  '';
}
