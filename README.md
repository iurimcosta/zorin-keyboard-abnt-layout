# Linux US International Keyboard (Windows-Style Behavior) 🇧🇷🇺🇸

Este repositório contém arquivos de configuração personalizados para o layout de teclado **US International (ANSI)** no Linux (Zorin OS, Ubuntu, Pop!_OS, GNOME).

O objetivo é replicar o comportamento exato do layout **"Estados Unidos (Internacional)" do Windows**, facilitando a vida de desenvolvedores que migraram para o Linux e possuem memória muscular das teclas de atalho.

## 🎯 O Problema
No Linux padrão, o layout "US International with dead keys" possui comportamentos que atrapalham quem vem do Windows:
1.  **Aspas Duplas (`"`) são teclas mortas:** Você precisa digitar `"` + `Espaço` para que elas apareçam. Isso é péssimo para programação.
2.  **Cedilha (`ç`) incorreto:** Ao digitar `'` + `c`, o sistema gera um `ć` (c com acento agudo) em vez de `ç`.
3.  **Símbolos ABNT ocultos:** Caracteres como `°`, `ª`, `º` e `§` ficam em posições não intuitivas ou inexistentes.

## ✅ A Solução (O que este Repo faz)
Ao aplicar estas configurações, seu teclado terá o seguinte comportamento:

| Tecla / Atalho | Comportamento | Descrição |
| :--- | :--- | :--- |
| **Aspas Simples (`'`)** | **Morta** (Dead Key) | Aguarda vogal para acentuar (ex: `'` + `e` = `é`). |
| **Aspas Duplas (`"`)** | **Viva** (Direta) | Imprime `"` imediatamente (ideal para Strings/JSON). |
| **Cedilha (`ç`)** | `'` + `c` | Gera o caractere **ç** corretamente. |
| **Trema (`ü`)** | `AltGr` + `Shift` + `'` | Movemos a trema para cá já que as aspas duplas agora são diretas. |
| **Grau (`°`)** | `AltGr` + `;` | Padrão ABNT. |
| **Ordinal Fem. (`ª`)** | `AltGr` + `[` | Padrão ABNT. |
| **Ordinal Masc. (`º`)** | `AltGr` + `]` | Padrão ABNT. |
| **Parágrafo (`§`)** | `AltGr` + `s` | Atalho facilitado. |

---

## 🚀 Instalação Rápida

1.  Clone este repositório:
    ```bash
    git clone https://github.com/iurimcosta/zorin-keyboard-abnt-layout.git
    cd zorin-keyboard-abnt-layout
    ```

2.  Dê permissão de execução ao script e rode:
    ```bash
    chmod +x install.sh
    ./install.sh
    ```

3.  **Reinicie a sessão (Logoff/Login)** ou reinicie o computador para aplicar as alterações.

4.  Nas configurações de Teclado do seu Linux, certifique-se de selecionar o layout:
    * **English (US, intl., with dead keys)**

---

## 🛠️ Instalação Manual (Para entender o que foi feito)

Se preferir fazer manualmente, o script basicamente realiza duas operações:

### 1. Mapa de Teclado (Symbols)
Substitui o arquivo de símbolos original do X11:
* **Origem:** `./us_layout_customizado`
* **Destino:** `/usr/share/X11/xkb/symbols/us`

Isso corrige as aspas duplas, a trema e mapeia os símbolos ABNT (`°ªº§`) para o AltGr.

### 2. Composição (Cedilha)
Cria/Substitui o arquivo de composição do usuário para corrigir o Cedilha:
* **Origem:** `./.XCompose`
* **Destino:** `~/.XCompose`

Conteúdo do arquivo `.XCompose`:
```text
include "%L"
<dead_acute> <c> : "ç" "ccedilla"
<dead_acute> <C> : "Ç" "Ccedilla"
