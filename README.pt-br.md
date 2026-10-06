<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset=".assets/axi25-banner-dark.png">
    <img alt="AXI25" src=".assets/axi25-banner.png" width="620">
  </picture>
</p>

<p align="center"><sub>AXI25 · Augmented eXtraction Intelligence</sub></p>

<p align="center">🇧🇷 Português (principal) · 🇺🇸 <a href="README.en.md">English</a> · 🏠 <a href="README.md">Início</a></p>

A memória da sua IA sobre você. Tudo que você lê, decide e constrói entra aqui, e a sua IA para de
começar do zero a cada conversa.

Todo mundo usa as mesmas IAs. A diferença é se a sua conhece a sua prática inteira. O AXI25 faz ela
conhecer: você abre uma pasta no Obsidian e conversa, e ela não só guarda suas notas — extrai o que
importa, conecta e deixa pronto pra sua próxima decisão. Sem servidor, sem conta nova, sem mais uma
mensalidade de app. Só arquivos de texto que são seus, na sua máquina.

## Você captura, a IA faz o resto

Todo app de notas vira um cemitério. Você anota e nunca mais acha. O trabalho chato nunca foi
anotar, foi arrumar depois: ligar uma ideia na outra, atualizar, reencontrar. Ninguém tem paciência
pra isso. Uma IA tem.

Aqui você só fala. "Anota isso." "O que eu sei sobre X?" "Como foi minha semana?" A IA classifica,
conecta e guarda no lugar certo.

## O que ele faz

- Captura qualquer coisa em uma linha. Você separa depois, ou nem isso: a IA separa.
- Digere livros, artigos e cursos em conhecimento seu, com as suas palavras, tudo ligado.
- Guarda o que você aprende num wiki que fica mais útil quanto mais você usa.
- Registra o trabalho que você faz e depois garimpa dali lições, ideias de conteúdo e projetos.
- Se você vive de mídia, captura o clima do momento: o que está subindo agora, antes de virar consenso.

Não sabe o que é Zettelkasten nem Zeitgeist? Não precisa saber pra usar. Isso é papo pra pasta
`docs/`, quando (e se) você quiser.

## Comece em 3 passos

1. Baixe o `axi25-*.zip` mais recente em [Releases](https://github.com/felipefontoura/axi25/releases/latest) e descompacte onde quiser.
2. Abra ela no Obsidian.
3. No painel de IA, diga um oi.

Um oi já dispara um treino guiado de uns 10 minutos. Ele te ensina o sistema e monta o seu cofre
junto com você. Nada aqui é template pra você apagar. Você constrói ao vivo. O passo a passo está em
[`SETUP.md`](SETUP.md).

Prefere o terminal? Estes montam o mesmo cofre:

```bash
npx @axi25/vault@latest init meu-cofre
# ou
git clone --recurse-submodules https://github.com/felipefontoura/axi25.git meu-cofre
```

Clone com `--recurse-submodules`: o plugin do painel de IA é um submódulo, e o clone simples deixa ele vazio.

## O que você precisa

Obsidian, que é grátis, e uma assinatura Claude (Pro ou Max). O painel de IA instala o resto e te
guia na tela. Você não precisa saber terminal, fora colar um comando que ele mesmo te entrega com um
botão de copiar.

## A regra que impede virar bagunça

Nem todo pensamento vira conhecimento. É isso que separa o AXI25 de mais um app de notas caótico.

Uma ideia crua fica na entrada. Ela só sobe pro wiki quando merece: quando volta em dias diferentes,
quando muda uma decisão, quando vira palavra que você usa toda hora. Até lá, ela espera. Sem essa
regra você tem um pântano. Com ela você tem um cérebro.

## É seu, e continua seu

Markdown puro e pastas. Abre no Obsidian, no VS Code, no vim, em qualquer editor. O conhecimento é
compilado uma vez e mantido em dia, não refeito a cada pergunta. Você não fica preso a nada nem a
ninguém.

## Fala a sua língua

Você escreve em português, ele responde em português. Escreve em inglês, responde em inglês. As suas
notas saem no seu idioma. Os nomes de arquivo também, ou force o inglês se preferir.

## Avançado

Usa Codex, OpenCode ou Pi no terminal? Roda direto neles, sem passo extra. Quer estender, versionar
ou empacotar? Está tudo na pasta [`docs/`](docs/).

## Usando no trabalho

Se você é dev e usa o AXI25 como memória do seu trabalho, [Wiki sem drift](https://felipefontoura.com/pt/get/no-drift-wiki/?utm_source=github&utm_medium=referral&utm_campaign=axi25-readme) é o playbook grátis de 30 dias com que eu rodo ele: house rules para reuniões e citações, os dois scripts em `90-system/scripts/` e um scorecard.

## Contribuindo

Este repo é o cofre pronto para usar. As skills e o contrato do agente ficam no
[axi25-core](https://github.com/felipefontoura/axi25-core) (`@axi25/core` no npm), e o painel do Obsidian no
[axi25-plugin](https://github.com/felipefontoura/axi25-plugin). Abra issues e pull requests onde a mudança pertence.

## Licença

[MIT](LICENSE). Componentes de terceiros incluídos mantêm suas próprias licenças; veja
[`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).
