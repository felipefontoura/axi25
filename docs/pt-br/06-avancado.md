# 6. Avançado / Power Users

> **Usuário leigo não precisa deste capítulo.** Se você só quer usar o AXI25, abra a pasta no
> Obsidian e digite `onboarding` (veja [`../../SETUP.md`](../../SETUP.md)). Este capítulo é para quem
> roda o próprio harness de IA, quer estender o sistema ou empacotá-lo.

## Rode em qualquer harness

As skills são pastas reais, então todo agente suportado as descobre sem configuração. Na pasta do
cofre:

```bash
npx axi25 doctor    # checa seu ambiente e imprime o próximo passo exato
```

| Harness | Início | Lê skills de |
|---|---|---|
| Claude Code (terminal) | `claude` → `onboarding` | `.claude/skills/` |
| OpenAI Codex | `codex` → `onboarding` | `.agents/skills/` + `AGENTS.md` |
| OpenCode | `opencode` → `onboarding` | `.agents/skills/` (+ `.claude/skills/`) |
| Pi.dev | `pi` → `onboarding` | `.agents/skills/` |

Todos leem o `AGENTS.md` (a constituição). Falta um CLI? Peça no chat: **"check my setup"** → a skill
`axi25-doctor` instala pra você, com consentimento, cross-OS.

## A CLI

```bash
npx axi25 doctor [dir]   # checagem de ambiente + próximo passo
npx axi25 init [dir]     # monta um cofre completo do zero (qualquer pasta vazia)
npx axi25 wire [dir]     # re-sincroniza a cópia .claude/skills a partir de .agents/skills
```

O `init` funciona até do nada: constrói a árvore de pastas, os arquivos de referência e as duas
pastas de skills — o cofre se auto-cura (veja `AGENTS.md` § Self-healing environment).

## Estenda o sistema

- **Adicionar uma skill:** crie `.agents/skills/<nome>/SKILL.md` com frontmatter `name` +
  `description` e as instruções, depois rode `npx axi25 wire` para copiá-la em
  `.claude/skills`. Ela dispara por linguagem natural assim que sua descrição for descoberta;
  adicione uma linha em `AGENTS.md` § Skills Reference para o roteador conhecê-la.
- **Adicionar uma área da vida:** crie `20-wiki/areas/<area>.md` a partir do template de Área em
  `90-system/references/page-templates.md`.
- **Customizar a colheita do worklog:** as cinco lentes são genéricas. Defina canais de conteúdo ou
  pilares de negócio nomeados em `90-system/references/user-profile.md` (seção "Strategy framework")
  e a colheita mapeia as lentes de Conteúdo/Ferramentas neles.

## Customize o comportamento

Tudo que é voltado ao usuário é controlado por `90-system/references/user-profile.md`:

| Campo | Efeito |
|---|---|
| `language` | a língua em que a IA fala e escreve o conteúdo do cofre |
| `filename_language` | `match` (padrão) espelha sua língua; `en` força slugs em inglês |
| `works_with_media` | `true` enfatiza o pilar Zeitgeist; `false` o mantém mínimo |
| Strategy framework | canais/pilares nomeados para onde a colheita roteia |

O comportamento do painel do Obsidian (modo de permissão, a pasta de comandos-skill, o arquivo de
contexto) fica em `.obsidian/plugins/axi25/data.json` — já vem pré-configurado
(`commandsFolder: .agents/skills`, `contextFilePath: CLAUDE.md`, `permissionMode: acceptEdits`).
Aumente ou reduza a autonomia por ali.

## Backups: pasta na nuvem, Obsidian Sync ou git

Para backup simples, uma pasta na nuvem (Google Drive / Dropbox / iCloud) ou o Obsidian Sync já
bastam. Veja [`../../SETUP.md`](../../SETUP.md) § Backup do seu cofre para essas opções leigas e suas
ressalvas (sincronizar pastas ocultas; não rodar dois métodos no mesmo cofre). Esta seção é o caminho
avançado, **git + GitHub**, que te dá algo que os outros não dão: um histórico completo e navegável de
cada mudança.

### Por que git para um cofre de conhecimento

Cada commit tira uma foto do cofre inteiro. Com isso você pode:

- ver exatamente o que mudou e quando, e comparar dois pontos no tempo;
- restaurar uma nota (ou o cofre todo) para um estado anterior depois de uma edição ruim ou um erro da IA;
- manter um backup privado fora da máquina no GitHub;
- revisar o que a IA fez numa sessão como um diff, antes de confiar.

Para um cofre que uma IA edita o tempo todo, esse histórico de revisões é uma rede de segurança de verdade.

### Setup (uma vez)

```bash
cd "caminho/para/AXI25"
git init
git add -A
git commit -m "AXI25 — cofre inicial"
```

Depois crie um repositório **privado** no GitHub e faça push (mantenha privado — o cofre é seu):

```bash
git remote add origin git@github.com:voce/seu-cofre.git
git push -u origin main
```

### No dia a dia

- O plugin **Git** do Obsidian faz auto-commit num intervalo (um clique, sem terminal).
- Ou pelo terminal: `git add -A && git commit -m "..."` para um checkpoint, e `git push`.
- Histórico: `git log --oneline`. Restaurar um arquivo: `git checkout <commit> -- caminho/da/nota.md`.

O `.gitignore` já exclui o estado local do harness, segredos e o arquivo de auditoria interno. A cópia
`.claude/skills` é commitada para o cofre ficar autocontido. Não rode git e uma pasta na nuvem no
mesmo cofre ao mesmo tempo — escolha um caminho de backup.

## Empacotar como plugin do Claude (opcional, para updates em escala)

O AXI25 chega vault-bundled (zip), então nada precisa ser instalado. Se você preferir distribuir as
skills como **plugin/marketplace do Claude Code** (versionamento central, `/plugin update`), adicione
um manifesto `.claude-plugin/plugin.json` apontando para o conjunto `skills/` e publique um
`marketplace.json`. Os usuários então fazem `/plugin marketplace add <repo>` + `/plugin install axi25`.
Isso é só-Claude — Codex/OpenCode/Pi continuam lendo `.agents/skills/` direto.

## O que não está aqui de propósito (add-ons Pro)

Esta edição traz apenas as skills puras em Markdown, sem dependências. Capacidades que precisam de
modelos de ML locais, credenciais ou ferramentas específicas de plataforma — transcrição de áudio/
vídeo, ingestão do YouTube, conversão automática de PDF/EPUB→Markdown, análise de narração/prosódia —
são candidatas a um add-on avançado/Pro separado, não incluído aqui.

---

Voltar para o [índice da documentação](../README.md) · [Implementação](04-implementacao.md)
