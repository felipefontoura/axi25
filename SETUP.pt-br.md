# Instalação

> 🇧🇷 Português (principal) · 🇺🇸 [English](SETUP.en.md) · 🏠 [Início](README.md)

O AXI25 foi feito para uma experiência **sem terminal**: você baixa, abre no **Obsidian**, e a
IA passa a operar suas notas usando a **sua própria assinatura do Claude** (Pro ou Max). Funciona
no Linux, macOS e Windows.

---

## O caminho recomendado — Obsidian + Claude (leigo-friendly)

Você vai instalar 3 coisas gratuitas (Obsidian + 2 plugins) e logar com sua conta Claude. O
próprio plugin te guia passo a passo — você não precisa saber usar terminal.

1. **Instale o Obsidian** (grátis) em <https://obsidian.md>. Abra-o e escolha
   **"Abrir pasta como cofre"** → selecione a pasta do seu AXI25 (a que você descompactou).
2. **Ative os plugins da comunidade** — o único ponto onde muita gente trava (é 1 clique).
   Ao abrir o cofre, o Obsidian mostra um aviso de segurança sobre plugins da comunidade. Clique no
   botão que **ativa/confia** (algo como **"Trust author and enable plugins"** ou **"Turn on
   community plugins"**). O painel **AXI25** já vem incluído e configurado — ao ativar, ele sobe
   sozinho. Você **não** instala nada pela loja.

   > ⚠️ **Se o aviso não aparecer, ou o painel não surgir:** abra **Configurações** (engrenagem, canto
   > inferior esquerdo) → **Plugins da comunidade** → desligue o **Modo restrito** (*Restricted mode*)
   > → confirme que o **AXI25** está **ativado** na lista. Esse passo de confiança é uma trava de
   > segurança do Obsidian e **não dá pra pular** — mas é um clique só, e nunca mais se repete neste cofre.
3. Abra o painel do AXI25 (ícone na barra lateral ou paleta de comandos → "AXI25"). Na primeira
   vez ele mostra um **assistente**:
   - **Passo "Install Claude Code"** — ele mostra um comando com botão de **copiar**. Cole onde ele
     pedir (ele abre o local certo pra você). É o único comando de toda a instalação.
   - **Passo de login** — abre o navegador para você entrar com sua **conta Claude (Pro ou Max)**.
4. Pronto. No chat do AXI25, diga um oi (ou escreva qualquer coisa). Num cofre novo isso já
   dispara o treino guiado, ele te leva pelo resto. As skills já estão pré-configuradas como
   comandos (digite `/` no chat para vê-las).

> Backup automático (opcional): instale o plugin **Git** pela loja de plugins da comunidade para
> versionar seu cofre com um clique.

> **Por que preciso do "Claude Code"?** O painel de IA do Obsidian roda em cima do Claude Code (o
> motor de linha de comando da Anthropic), que aceita login com sua assinatura Pro/Max. O
> assistente do AXI25 instala e conecta isso pra você — é o mais perto de "zero terminal" que dá.

Nada mais precisa ser configurado: as pastas, as skills e o `CLAUDE.md` já vêm prontos no cofre.

---

## Backup do seu cofre

Seu cofre é uma pasta de arquivos. Faça backup como você faria com qualquer pasta importante.

- **Recomendado (simples): uma pasta na nuvem.** Coloque a pasta do AXI25 dentro do seu **Google
  Drive** (ou Dropbox, iCloud, OneDrive). Pronto, backup contínuo. Um detalhe importante: deixe o
  app de sincronização configurado para sincronizar **todos os arquivos, inclusive os ocultos** (as
  pastas que começam com ponto, como `.agents` e `.obsidian`). Se ele pular os ocultos, suas skills
  e configurações não vão no backup. E evite abrir o cofre em dois computadores ao mesmo tempo:
  espere a sincronização terminar antes de fechar.
- **Obsidian Sync (nativo, pago).** Sincroniza suas **notas** entre dispositivos muito bem. Ressalva
  honesta: por padrão ele **não** sincroniza as pastas ocultas (`.agents`, `.claude`), então as
  skills não viajam junto. Ótimo para as notas, não é um backup completo do sistema. E **não** use o
  Obsidian Sync junto com uma pasta na nuvem no mesmo cofre: escolha um só, ou dá conflito.
- **Avançado (versões e histórico): Git + GitHub.** Se você quer poder voltar no tempo e ver cada
  mudança, use git. Tutorial completo em [`docs/`](docs/) (capítulo Avançado).

## Para usuários avançados (outros harnesses)

**Comando facilitado** — na pasta do vault, rode:

```bash
npx @axi25/vault doctor
```

Ele checa seu ambiente (quais CLIs você tem) e imprime **o próximo passo exato**. Sem terminal? Não
precisa: se você já usa um agente, o AXI25 funciona nele **sem nenhum passo extra** — as skills são
pastas reais que cada harness descobre nativamente:

| Harness | Como | Onde ele acha as skills |
|---|---|---|
| **Claude Code** (terminal) | `cd` na pasta → `claude` → `onboarding` | `.claude/skills/` |
| **OpenAI Codex** | `cd` na pasta → `codex` → `onboarding` | `.agents/skills/` + `AGENTS.md` |
| **OpenCode** | `cd` na pasta → `opencode` → `onboarding` | `.agents/skills/` + `AGENTS.md` |
| **Pi.dev** | `cd` na pasta → `pi` → `onboarding` | `.agents/skills/` + `AGENTS.md` |

Todos leem o `AGENTS.md` (a constituição). Aprofundamento em **[`docs/`](docs/)** (filosofia →
técnicas → implementação). Precisa instalar o CLI de algum deles? Peça no chat: **"check my setup"**
— a skill `axi25-doctor` detecta e instala pra você, com consentimento.

> Instalação via **npm** (opcional): `npx @axi25/vault init meu-vault` monta um cofre
> completo do zero em qualquer pasta.

---

## Idioma & nomes de arquivo

- **Você escreve na sua língua; a IA responde nela.** (Os arquivos de skill estão em inglês — é só
  como a IA é *instruída*; ela nunca devolve esse inglês pra você.)
- **Conteúdo do cofre** na sua língua padrão (definida no onboarding).
- **Nomes de arquivo** seguem sua língua por padrão; para forçar inglês, ajuste
  `filename_language: en` em `90-system/references/user-profile.md`.

---

## Resolução de problemas

- **O AXI25 diz que não achou o Claude** → você ainda não completou o assistente dele (Passo 5).
  Rode o comando "Install Claude Code" que ele mostra e faça o login. Ele usa esse mesmo programa.
- **Precisa de uma assinatura** → o login do Claude Code exige uma conta **Claude Pro ou Max**.
- **As skills não aparecem como comandos no Obsidian** → em Configurações → AXI25, confira que a
  pasta de skills (`commandsFolder`) está apontando para `.agents/skills` e que "Register skills as
  commands" está ligado (já vem assim).
- **Você disse oi e nada aconteceu** → confirme que você abriu a *pasta* como cofre (não um arquivo
  só), para a IA enxergar o `AGENTS.md`.

Tudo que a IA precisa é texto puro nesta pasta — em último caso, abra o `AGENTS.md` e a `docs/` em
qualquer editor e leia junto.
