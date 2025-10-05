#!/bin/bash
# ==============================
# 🚀 Instalador de entorno Hyprland + Dotfiles
# ==============================

# Colores para mensajes
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${GREEN}Iniciando instalación...${RESET}"

# --- 1️⃣ Actualizar sistema ---
sudo pacman -Syu --noconfirm

# --- 2️⃣ Instalar paquetes básicos ---
echo -e "${YELLOW}Instalando paquetes esenciales...${RESET}"
sudo pacman -S --noconfirm git hyprland waybar alacritty rofi wlogout hyprpaper sddm neovim thunar firefox network-manager-applet pamixer brightnessctl pavucontrol

# --- 3️⃣ Clonar repositorio de configuraciones ---
echo -e "${YELLOW}Clonando repositorio de dotfiles...${RESET}"
cd ~
if [ -d "~/dotfiles" ]; then
  echo "El directorio ya existe, saltando clonación."
else
  git clone https://github.com/jheff29/dotfiles.git
fi

# --- 4️⃣ Copiar configuraciones ---
echo -e "${YELLOW}Aplicando configuraciones...${RESET}"
cp -r ~/dotfiles/.config/* ~/.config/

# --- 5️⃣ Habilitar servicios ---
echo -e "${YELLOW}Habilitando servicios esenciales...${RESET}"
sudo systemctl enable sddm
sudo systemctl enable NetworkManager

# --- 6️⃣ Limpiar ---
echo -e "${YELLOW}Limpieza final...${RESET}"
sudo pacman -Sc --noconfirm

echo -e "${GREEN}✅ Instalación completa. Reinicia tu sistema y disfruta.${RESET}"
