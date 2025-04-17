#!/bin/bash

# Instalacja Arch Linux ARM (AArch64) na Raspberry Pi 4 na dysku SSD (/dev/sda)

SSD_DEV="/dev/sda"  # <- Twój dysk SSD
BOOT_DIR="./boot"
ROOT_DIR="./root"

if [[ "$EUID" -ne 0 ]]; then
  echo "Uruchom ten skrypt jako root."
  exit 1
fi

echo "UWAGA: Wszystko na $SSD_DEV zostanie usunięte!"
read -p "Kontynuować? (tak/nie): " confirm
[[ "$confirm" != "tak" ]] && exit 1

echo "[1/7] Partycjonowanie SSD..."
parted -s "$SSD_DEV" mklabel msdos
parted -s "$SSD_DEV" mkpart primary fat32 1MiB 201MiB
parted -s "$SSD_DEV" set 1 boot on
parted -s "$SSD_DEV" mkpart primary ext4 201MiB 100%

sync

echo "[2/7] Formatowanie systemów plików..."
mkfs.vfat "${SSD_DEV}1"
mkfs.ext4 "${SSD_DEV}2"

mkdir -p "$BOOT_DIR" "$ROOT_DIR"

echo "[3/7] Montowanie partycji..."
mount "${SSD_DEV}2" "$ROOT_DIR"
mkdir -p "$ROOT_DIR/boot"
mount "${SSD_DEV}1" "$ROOT_DIR/boot"

echo "[4/7] Pobieranie Arch Linux ARM AArch64..."
wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz -O /tmp/archarm.tar.gz

echo "[5/7] Rozpakowywanie systemu..."
bsdtar -xpf /tmp/archarm.tar.gz -C "$ROOT_DIR"

echo "[6/7] Aktualizacja fstab (mmcblk0 -> sda)..."
sed -i 's/mmcblk0/sda/g' "$ROOT_DIR/etc/fstab"

echo "[7/7] Synchronizacja i odmontowanie..."
sync
umount "$ROOT_DIR/boot"
umount "$ROOT_DIR"

rm -rf "$BOOT_DIR" "$ROOT_DIR" /tmp/archarm.tar.gz

echo "✅ Gotowe! Włóż SSD do Raspberry Pi 4 i uruchom."
echo "➡ Domyślny login: alarm / hasło: alarm"
echo "➡ Root: root / root"
