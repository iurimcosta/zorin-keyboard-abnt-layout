#!/bin/bash

echo "Iniciando a instalação do Layout US Intl - Estilo Windows..."

# 1. Backup do arquivo original (por segurança)
if [ ! -f /usr/share/X11/xkb/symbols/us.backup ]; then
    echo "Criando backup do layout original..."
    sudo cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.backup
fi

# 2. Copia o layout customizado para a pasta do sistema
# (Usa o nome exato que está no seu repositório)
echo "Aplicando novo mapa de teclado..."
sudo cp ./teclado-ANSI-Internacional_customizado /usr/share/X11/xkb/symbols/us

# 3. Configura o Cedilha (Compose)
# (Usa o nome exato que está no seu repositório)
echo "Configurando Cedilha (Ç)..."
cp ./XCompose_add-cedilha ~/.XCompose

# 4. Mensagem final
echo ""
echo "✅ Instalação concluída com sucesso!"
echo "⚠️  IMPORTANTE: Faça LOGOFF ou REINICIE o computador para aplicar."
