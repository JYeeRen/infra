resource "proxmox_lxc" "penguin-logistics" {
  target_node  = "pve"
  hostname     = "penguin-logistics"
  ostemplate   = "local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst"
  password     = "ddqlSept.9th"
  unprivileged = true
  vmid         = 109
  memory       = 1024
  start        = true
  onboot       = true

  ssh_public_keys = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9PURxQWwzj7coP+ex7/K061GL7ta1++IikhC5oazBzQPXH5oFha0g+rIqP3lVSC2Ajxq+zTCkfB8zy7PxmIYR7fruRNt7RiU8fuGjcArURhRxC4wOslB9kcYDgIp3QvbuJBZNh6ekXwvxFEkgHqZ5omD2c10dPWxNY908H0k+ENXpuWOQ46ZU+t16mz1G65VY+uvzN67b6LOjRUe+b19wNFAXPgvlqnVxzXHxerqKBq8Ok4JCGYNetUucfPeRh9DC/WrzYFfIbMBuoGz0VyZ7dBAYbzeNDvUUozcAn4WXjtyA+S83ClLtH3C5E2WspnP74dpDH80+Ls7yXQAkukdFwWpIzUNiZEZhyeAZPY18kKMtmpbDM0sjrBS/OMJXu8UEODD+KZx7oVTRwOVVXqb5hfytnLTts/cO/Ic5xPfKpRtspJqg8hR1Sisv792sWUDOebuWbMt4R0gtTfJaE84IEI1vYANbQtMHWB/nZkE9nQIOMXuiBQnyo/zGsnIE7DvlQXPqfNiR7WUfyTPUGUN7qYmfeXagiJl9xLw8TbNtoRMjDX2rqbNbQlG569v2cdM3YlP+fwsd1t8IzG/euss0HIV2ZEiKcvQJxc6rap+Nqvfl/6mhO5GYgMLPhNjXyTN7TOrMLdTuqsIfv7/1wCCKnfcKA9UPFsFHxcLcmk1H0Q== chieh736@selfhost
  EOT

  features {
    nesting = true
  }

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    gw     = "192.168.123.1"
    ip     = "192.168.123.40/24"
    hwaddr = "A4:CD:A0:C6:00:C3"
  }
}

# 单播 mac 生成 https://www.lddgo.net/network/random-mac

# ata-HGST_HTS541010A9E680_170215JA104NZ406UM2V-part1
# ata-ST1000DM010-2EP102_Z9ADWTT5-part1
# ata-ST1000LM024_HN-M101MBB_S2SMJ9CD402134-part1
