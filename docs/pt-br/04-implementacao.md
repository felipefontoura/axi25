# 4. Implementação

> Os detalhes concretos. Se [Filosofia](01-filosofia.md) é o *porquê* e
> [Técnicas](03-tecnicas.md) é o *como você pensa*, isto é *como os arquivos de fato funcionam*.

## A árvore de pastas

```
AXI25/
├── AGENTS.md            constituição — todo agente lê isto (a única fonte da verdade)
├── CLAUDE.md            arquivo de contexto do Claude Code / AXI25 → importa o AGENTS.md (@AGENTS.md)
├── opencode.json        config do OpenCode → aponta para o AGENTS.md, define o agente "axi25"
├── index.md             catálogo de todas as páginas do wiki (o agente mantém)
├── log.md               registro de operações somente-anexar (append-only)
├── .bin/install.sh / .ps1    opcional: re-sincroniza a cópia .claude/skills; checagem de saúde
├── .agents/skills/      as 13 skills — canônico (Codex, OpenCode, Pi leem daqui nativamente)
├── .claude/skills/      uma CÓPIA real das 13 skills p/ Claude Code + o wrapper AXI25
├── .obsidian/           config do vault Obsidian (plugins, aparência) — o caminho principal
├── 00-capture/          INBOX  → quick/ diary/ studies/ worklogs/
├── 10-sources/          MATERIAL BRUTO (somente leitura) → articles/ books/ courses/ papers/ assets/
├── 20-wiki/             CONHECIMENTO → concepts/ entities/ areas/ decisions/ patterns/ syntheses/ maps/
├── 25-studies/          ESTUDO EM FORMAÇÃO
├── 30-projects/         EXECUÇÃO → active/ someday/ archive/
├── 35-worklogs/         TRABALHO FEITO → + harvest/
├── 40-journal/          VIDA → daily/ weekly/ signals/
├── 50-zeitgeist/        DISCURSO TEMPORAL → discourse/{articles,papers,threads,talks} syntheses/ observations/
├── 90-system/           CONFIG → references/ (templates, operações, user-profile) prompts/ scripts/
└── docs/                esta documentação
```

Toda camada de nível superior tem um `README.md` descrevendo seu contrato local. Pastas vazias
mantêm um arquivo `.keep` para que a estrutura chegue intacta.

## Convenções de frontmatter

Toda página carrega frontmatter YAML. A base obrigatória é `type`, mais `created`/`updated` (ou
`date`) e `areas` quando relevante. Cada tipo de página tem seus próprios campos — o conjunto
canônico vive em
[`90-system/references/page-templates.md`](../../90-system/references/page-templates.md). Exemplos:

```yaml
# concept
type: concept
areas: [learning]
created: 2026-01-15
updated: 2026-01-15
confidence: high        # high | medium | low | speculative
```

```yaml
# worklog
type: worklog
date: 2026-01-15
areas: [work, learning]
projects: [my-project]
status: unprocessed     # → processed depois de colhido
```

`confidence` e `status` carregam peso: o `axi25-lint` e as regras de maturidade os leem.

## Nomeação & idioma

- **Nomes de arquivo**: kebab-case, no `filename_language` do usuário (padrão `match` = a língua do
  usuário; `en` força slugs em inglês, mesmo com conteúdo em outra língua). Ajuste em
  [`user-profile.md`](../../90-system/references/user-profile.md).
- **Conteúdo do arquivo**: sempre na língua padrão do usuário.
- **Wikilinks**: `[[nome-em-kebab-case]]`, nus — nunca envoltos em crases (isso quebra a navegação
  de links em vários editores).
- **Datas**: ISO 8601 (`YYYY-MM-DD`).

## As 13 skills

Skills são arquivos de instrução em Markdown (`SKILL.md`). Elas disparam por linguagem natural; a
tabela completa de gatilhos está no [`AGENTS.md`](../../AGENTS.md) § Skills Reference.

| Skill | Dispara em | Faz | Toca |
|---|---|---|---|
| `axi25-onboarding` | primeira execução / "onboarding" | setup guiado + micro-treinamento | user-profile, primeiras páginas |
| `axi25-doctor` | "check my setup" / ferramenta ausente | detecta e instala dependências (com consentimento) | seu ambiente |
| `axi25-core` | qualquer interação com o vault | loop operacional, convenções | index, log |
| `axi25-capture` | "captura", "salva isso" | inbox sem fricção | `00-capture/` |
| `axi25-ingest` | "ingest", "adiciona ao wiki" | Deep Extraction Standard → wiki | `10-sources/`→`20-wiki/` |
| `axi25-process` | "processa o inbox" | classifica + roteia capturas | `00-capture/` → todo o resto |
| `axi25-journal` | reflexão / "como foi meu dia" | entrada diária + sinais | `40-journal/` |
| `axi25-study` | "nota de estudo", "notas sobre…" | estudo em formação | `25-studies/` |
| `axi25-worklog` | "registro de trabalho", "colhe o log" | log + colheita | `35-worklogs/` |
| `axi25-query` | "o que eu sei sobre…" | recuperação + síntese | lê `20-wiki/` |
| `axi25-lint` | "lint", "health check" | órfãos, fantasmas, contradições | vault inteiro |
| `axi25-review` | "review semanal" | retrospectiva | `40-journal/weekly/` |
| `axi25-plan` | "plano semanal" | plano prospectivo | `40-journal/weekly/` |

Para **adicionar uma skill**, coloque `.agents/skills/<nome>/SKILL.md` (um frontmatter com nome +
descrição e as instruções) e rode o `.bin/install.sh` de novo. Para **adicionar uma área**, é só criar
`20-wiki/areas/<area>.md` a partir do template de Área.

## O loop operacional

Toda interação significativa segue: **ler `index.md` → trabalhar → atualizar `index.md` → anexar ao
`log.md`.** O formato do log é fixo:

```
## [2026-01-15] ingest | How to Take Smart Notes
- Created: atomic-notes, spaced-repetition
- Updated: learning
- Links added: 6
```

Antes de escrever qualquer `[[wikilink]]`, o agente verifica se o alvo existe (`ls 20-wiki/concepts/ |
grep …`) e só linka o que é real — ou cria um stub consciente antes. Sem links fantasmas.

## Como cada harness roda isso

O contrato universal é o **`AGENTS.md`**. Todo agente o lê; as skills vêm de duas pastas **reais**
(nunca symlinks), então nada quebra em nenhum SO:

- **Obsidian + Claude Code** (o caminho pensado, zero-comando) — o wrapper AXI25 lê o `CLAUDE.md`
  como arquivo de contexto e o `commandsFolder` já aponta para as skills, então cada uma vira um
  comando. O `claude` CLI por baixo também descobre `.claude/skills/` nativamente.
- **OpenAI Codex** — lê o `AGENTS.md` nativamente e descobre skills em `.agents/skills/`.
- **OpenCode** — o `opencode.json` define `instructions: ["AGENTS.md"]`; descobre skills em
  `.agents/skills/` (e `.claude/skills/`).
- **Pi.dev** — lê o `AGENTS.md`; descobre skills em `.agents/skills/`.

Como os arquivos de skill são Markdown puro e o `AGENTS.md` documenta onde eles vivem, o sistema
degrada com elegância: até um harness sem suporte a skills funciona lendo os arquivos SKILL.md.

### Sem symlinks — à prova de Windows por design

As skills chegam como duas pastas **reais**: `.agents/skills/` (canônica) e `.claude/skills/` (uma
cópia). Nenhum symlink em lugar nenhum, então qualquer descompactador em qualquer SO — inclusive
Windows — resulta num vault funcional, com zero setup. O `.bin/install.sh` / `.bin/install.ps1` /
`npx @axi25/vault@latest wire` só re-sincronizam a cópia `.claude/skills` depois de você editar
`.agents/skills`; o usuário leigo nunca os roda.

## Backups & histórico de versões

O vault é composto de arquivos simples, então o **git** é a camada natural de backup e histórico. O
caminho Obsidian inclui o plugin Git para commits em um clique; a partir de um terminal, `git init` +
`git commit` periódico dá um histórico completo, local e privado. O `.gitignore` já exclui o estado
local do harness e qualquer segredo.

## Qualidade de Markdown

O `.markdownlint-cli2.jsonc` na raiz define uma config de lint amigável a prosa. O `axi25-lint` roda
o `markdownlint-cli2` sobre os arquivos alterados e **reporta** — nunca faz `--fix` cego, porque o
autofix pode mascarar perda estrutural. Lint verde é necessário, não suficiente.

## O que NÃO está aqui de propósito (esta edição)

Para manter a promessa de "descompactou e funciona em qualquer harness, qualquer SO", esta edição traz
apenas as skills puras em Markdown, sem dependências. Capacidades mais pesadas que precisam de modelos
de ML locais, credenciais ou ferramentas específicas de plataforma — transcrição de áudio/vídeo,
ingestão do YouTube, conversão automática de PDF/EPUB→Markdown, análise de narração/prosódia — **não**
estão incluídas. Elas são candidatas a um add-on avançado/Pro. Tudo nesta edição roda com apenas um
agente de IA e um editor de texto.

---

Voltar para: [Filosofia](01-filosofia.md) · [Pilares](02-os-cinco-pilares.md) ·
[Técnicas](03-tecnicas.md) · [Referências](05-referencias.md)
