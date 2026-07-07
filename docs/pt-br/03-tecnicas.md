# 3. Técnicas

> Se [Os Cinco Pilares](02-os-cinco-pilares.md) é o *quê* — as pastas e as skills — isto é o
> *como*: as decisões de ofício que separam uma base de conhecimento que compõe juros de um
> cemitério bem organizado. Cada técnica aqui tem conexão direta com pelo menos um pilar; várias
> atravessam todos. Para os mecanismos de arquivo e frontmatter, veja
> [Implementação](04-implementacao.md).

## Notas atômicas

Uma ideia por página. Não um tópico, não um capítulo, não uma fonte — uma ideia clara e nomeável.

Por que importa: ideias enterradas dentro de documentos longos não podem ser linkadas de forma
independente, não podem ser encontradas por travessia e não podem colidir inesperadamente com
conceitos não relacionados. Quando você separa ideias em átomos, torna as conexões visíveis e
acionáveis.

**Como dividir.** Se o título de uma página contém "e", provavelmente são duas páginas.
`sleep-debt-and-recovery.md` → `sleep-debt.md` + `sleep-recovery.md`. Se uma página cobre tanto um
mecanismo quanto sua aplicação de formas que não pertencem obviamente juntas, separe. Na dúvida,
prefira duas páginas curtas a uma longa.

**Nomeação.** Titule páginas como conceitos ou afirmações, não como fontes. Prefira
`attention-residue.md` a `cal-newport-notes.md`. O título é a ideia, não o recipiente de onde ela
veio. Um bom teste: o título ainda faria sentido se você deletasse a fonte?

O número mínimo de conexões (3 links por página) impõe atomicidade de forma indireta — se você não
consegue achar 3 conexões reais, a ideia provavelmente é estreita demais para ficar sozinha, ou
ampla demais e precisa ser dividida.

---

## Linkagem agressiva

Toda página de wiki precisa de pelo menos **3 `[[wikilinks]]`**. Esse é o mínimo, não a meta. Os
links são o produto: quando você diz *por que* duas notas se conectam, você está pensando, não só
arquivando.

**Linke para frente E para trás.** Se `sleep-debt.md` linka para `attention-residue.md`, então
`attention-residue.md` deveria reconhecer a conexão de volta. Páginas órfãs — zero links de entrada
— existem, mas nunca podem ser descobertas por travessia. O `axi25-lint` as sinaliza.

**A linkagem entre domínios é onde o sistema faz jus ao nome.** Um insight de trabalho conectando a
um padrão de saúde conectando a uma decisão de família é o que um segundo cérebro de fato faz. Linke
entre áreas da vida, não só dentro delas.

**Uma regra firme: wikilinks são nus.** Escreva `[[link]]`, nunca `` `[[link]]` ``. Trechos de
código com crase são para caminhos, comandos de shell e valores literais — não para links que você
quer de fato navegar. Envolver um wikilink em crases quebra a resolução do link na maioria dos
editores. Essa regra está na constituição AGENTS.md, nos Anti-Padrões, por um motivo: é o erro de
formatação mais comum e quebra o grafo em silêncio.

---

## A escada de maturidade & regras de promoção

Nem todo pensamento pertence a `20-wiki/`. A escada de maturidade é a regra anti-pântano.

```
00-capture/   entrada bruta, sem interpretação        ← tudo começa aqui
40-journal/   vida, reflexão, estado interior         ← amadurece como experiência vivida
25-studies/   estudo em formação                      ← entrada intelectual sendo digerida
35-worklogs/  trabalho executado denso                ← matéria-prima estratégica para minerar
20-wiki/      conhecimento promovido, atômico, linkado ← conquistou seu lugar
```

**A promoção para `20-wiki/` exige uma de:**

- Pedido explícito do usuário ("promove isso para um conceito")
- Evidência repetida — a ideia apareceu em 2+ dias, 2+ fontes ou 2+ projetos
- Impacto em decisão — mudou ou mudaria uma decisão real
- Vocabulário recorrente — é um termo que você usa repetidamente ao pensar ou escrever
- Pelo menos 3 conexões reais com páginas de wiki existentes

Até que uma dessas dispare, mantenha as ideias no seu degrau atual. Uma nota de estudo que fica em
`25-studies/` por uma semana não está falhando — está funcionando corretamente. Uma página de wiki
criada de um único pensamento fugaz que nunca é linkado é a falha. Isso é o pântano.

**O eixo vida/estudo/trabalho.** Três gêneros, três casas — imponha-as:

| Gênero | Casa | Frase desambiguadora |
|---|---|---|
| Vida interior, humor, família, eventos | `40-journal/daily/` | "como me senti hoje", "jantar em família", "questão espiritual" |
| Entrada intelectual em formação | `25-studies/` | "estudei X", "notas sobre…", "reflexão sobre o livro" |
| Sessão de trabalho executado | `35-worklogs/` | "sessão integral de…", "~3h colocando X pra rodar", "depurei Y" |

O roteamento errado quebra o pipeline de colheita (feito para worklogs) e o pipeline de promoção de
estudo (feito para `25-studies/`). A checagem #11 do `axi25-lint` sinaliza descompassos de gênero.
Se ambíguo, pergunte.

---

## Deep Extraction Standard (DES)

Quando você ingere uma fonte madura — livro, artigo, curso, paper — o `axi25-ingest` aplica o Deep
Extraction Standard. É isso que separa um segundo cérebro de uma coleção de resumos linkados.

**7 camadas por ideia significativa:**

1. **A ideia** — com sua própria voz, precisa e clara. Não uma citação, não uma paráfrase — sua
   síntese do que aquilo significa.
2. **Mecanismo** — por que funciona? O princípio subjacente, não o fato de superfície. "A dívida de
   sono se acumula" é o fato; "a taxa de depuração de adenosina define um teto de dívida que
   determina o tempo de recuperação cognitiva" é o mecanismo.
3. **Exemplo da fonte** — desdobrado, não só nomeado. O que acontece, em que contexto, como o
   exemplo opera na obra original.
4. **Exemplo aplicado** — mapeado para o seu contexto quando a transferência é óbvia. Pule isto se a
   aplicação não estiver clara; não invente uma.
5. **Anti-padrão ou variante** — como falha; como varia por contexto. Uma ideia sem seu modo de
   falha está incompleta.
6. **Quando usar / quando NÃO usar** — aplicabilidade contextual. As condições que ativam ou
   desativam a ideia.
7. **Gancho operacional** — como você aplica isso amanhã. Uma primeira ação concreta.

**Frameworks vs. jogadas táticas.** Frameworks grandes — uma estrutura de 3 atos, um pipeline de
vendas, um modelo de desenvolvimento de produto — recebem decomposição completa. Cada componente
conquista suas 7 camadas. Padrões individuais dentro de uma *família* de padrões relacionados não
recebem 7 camadas cada; a categoria recebe, e a família é coberta em ≤100 linhas.

**Voz.** Fria, analítica, cética. Corte adjetivos de hype: "ouro puro", "brutal", "sinal forte",
"estado da arte" são muletas proibidas. Se uma ideia exige ênfase, descreva o mecanismo — não a
decore com adjetivos. Uma síntese que parece uma landing page falhou. Ela deve parecer um memorando
técnico para você mesmo daqui a 6 meses.

**Metas de tamanho.**

| Tipo de fonte | Faixa alvo |
|---|---|
| Livro denso / curso completo / manifesto | 400-700 linhas |
| Playbook tático curto | 200-400 linhas |
| Paper acadêmico (5-15 páginas) | 150-350 linhas |
| Artigo isolado / capítulo único | 100-200 linhas |

Um resumo de 50 linhas de um curso de 45 minutos é sinal de alerta. Um resumo de 800 linhas de um
paper de 8 páginas é inflação.

**O teste dos 6 meses.** Depois de escrever uma síntese, pergunte: "Lendo só esta página daqui a 6
meses, consigo ensinar o conteúdo sem reabrir o original?" Se não, está rasa. Isso é uma régua
mental para o autor — não uma seção para adicionar no fim do documento.

Especificação completa: `.agents/skills/axi25-ingest/SKILL.md`.

---

## A colheita do worklog

A colheita transforma uma sessão de trabalho bruta em oportunidades reveladas ao longo de uma
jornada de aprendizado. Não é uma lista de tarefas gerada de um log — é um relatório de inteligência
sobre o que a sessão rendeu.

**Modelo de gatilho: teaser → confirmar.** Quando um rascunho de worklog fica pronto, o
`axi25-worklog` oferece um teaser breve: "esta sessão tem ~6 oportunidades (2 lições caras, 2
sementes de conteúdo, 1 fio recorrente com a sessão anterior)." Você confirma, e a colheita roda. Se
você pedir direto ("colhe o log de hoje"), ele pula o teaser.

**As cinco lentes acionáveis mais a Jornada:**

| Lente | O que revela | Formato |
|---|---|---|
| Aprendizado | Lições caras e duráveis; candidatas a conceito | Checkboxes (`- [ ]`) |
| Projetos | Sementes novas ou o que alimenta trabalho existente | Checkboxes |
| Conteúdo | Ângulos com gancho para vídeo, post, thread ou artigo | Checkboxes |
| Ferramentas | Padrões reutilizáveis que valem virar template ou script | Checkboxes |
| Relações | Como a sessão conecta com outros conceitos e projetos | Bullets simples |
| Jornada | Fios recorrentes de logs anteriores; competências emergentes | Bullets simples |

**Checkboxes são rastreadores de conversão.** Cada `- [ ]` é uma oportunidade aberta. Quando você
age em uma, ela sai para a casa real dela — um projeto, uma nota de estudo, um rascunho de conteúdo
— e é marcada como feita: `- [x] … → [[destino]]`. Relações e Jornada não usam checkboxes porque são
análise, não ações.

**O relatório é lido, não drenado.** Você abre a colheita, escolhe o que é acionável agora e age
nesses itens. Não é uma caixa de entrada para esvaziar. Uma sessão que revela 5 oportunidades e você
age em 2 é uma boa colheita. O relatório fica como registro permanente: "esta sessão bruta rendeu 2
itens convertidos".

---

## Mapas de Conteúdo (MOCs)

Um Mapa de Conteúdo é um hub de navegação: uma página que organiza conceitos, entidades, decisões e
projetos relacionados em torno de um tema. Não é uma pasta de categoria nem um resumo — é um índice
curado, mantido ao longo do tempo.

**Quando fazer um.** Quando você percebe um agrupamento de páginas relacionadas difícil de navegar
sem um hub. Uma heurística útil: 5+ páginas de conceito sobre um tema, com conexões que se sobrepõem
e que nenhum conceito isolado captura. Exemplos: `20-wiki/maps/map-ai-engineering.md`,
`20-wiki/maps/map-sleep-performance.md`, `20-wiki/maps/map-stoic-philosophy.md`.

**O que um MOC faz.** Ele linka os conceitos abaixo dele e fornece notas de orientação breves — quais
são fundacionais, quais são aplicadas, quais são contestadas. As páginas linkadas fazem o trabalho
profundo; o MOC só mostra o formato do território.

**O que um MOC não é.** Um MOC não é desculpa para adiar a criação de notas atômicas. "Vou colocar
tudo no mapa e separar depois" não é como funciona — os átomos vêm primeiro, o mapa emerge dos
átomos. MOCs também não substituem a organização de pastas; coexistem com ela como uma camada de
navegação por cima.

MOCs vivem em `20-wiki/maps/`. Template: `90-system/references/page-templates.md`.

---

## Confiança & contradições

**Marque a confiança.** Toda página de conceito carrega um campo `confidence` no frontmatter:
`high`, `medium`, `low` ou `speculative`. Afirmações sustentadas por múltiplas fontes e experiência
vivida são `high`. Afirmações de uma única fonte sem verificação são `low`. Hipóteses que valem
rastrear mas não testadas são `speculative`. A confiança rastreia onde você fez o trabalho e onde
está chutando.

**Registre contradições, não as suavize.** Quando o `axi25-ingest` encontra uma fonte nova que
conflita com uma página de wiki existente, ele sinaliza a contradição. A resposta certa não é
escolher um lado e deletar o outro — é registrar ambos, marcar a tensão explicitamente e deixá-la
aberta. Conhecimento real tem arestas. Um wiki que se contradiz é mais honesto que um que finge estar
resolvido.

**Contradições são sinais.** Uma contradição sinalizada muitas vezes significa que você bateu numa
complexidade genuína do domínio — uma dependência de contexto, um trade-off, um lugar onde ambas as
coisas são verdadeiras sob condições diferentes. A checagem #4 do `axi25-lint` revela contradições
nas verificações de saúde. O objetivo não é eliminá-las, mas torná-las legíveis.

---

## Ritmo semanal

O sistema funciona melhor com uma cadência semanal — uma sessão olhando para trás, uma olhando para
frente e verificações de saúde periódicas.

**Review (`axi25-review`).** Acionado por "review semanal" ou "como foi minha semana". Lê entradas
de diário, notas de estudo, o `log.md`, páginas de área e projetos ativos dos últimos 7 dias. Gera
`40-journal/weekly/YYYY-WNN.md` com: um resumo narrativo, avaliação área por área, crescimento de
conhecimento, notas de estudo em formação, loops abertos e um "foco da próxima semana". Também
atualiza páginas de área e roda um lint leve.

**Plan (`axi25-plan`).** Acionado por "plano semanal" ou "planejar a semana". O complemento
prospectivo do review. Lê o último review e todo o contexto vivo, então **dialoga antes de escrever**
— pergunta sobre seu ranking de prioridades, capacidade, inegociáveis e a lista explícita do "que
NÃO fazer esta semana". O plano inclui uma tese da semana, metas por área, uma distribuição dia a
dia, inegociáveis, a lista do NÃO e indicadores de sucesso mensuráveis.

A lista do NÃO importa tanto quanto a lista de metas. Todo "não fazer" explícito libera capacidade
para o que importa. Um plano sem lista do NÃO é uma lista de desejos.

**Lint (`axi25-lint`).** Rode periodicamente — depois de uma ingestão grande, ou como parte do
review semanal — para manter o wiki saudável. Encontra órfãos, páginas fracas, links fantasmas,
contradições, conteúdo obsoleto, frontmatter incompleto, conceitos duplicados, dívida de colheita,
descompassos de gênero e mais. Corrige automaticamente os problemas óbvios; pergunta antes de mesclar
ou re-rotear os ambíguos.

O ritmo semanal é o que impede o sistema de estagnar. Sem review, o wiki cresce mas para de ser
usado. Sem planejamento, o sistema captura mas não impulsiona ação. Lint sem o ritmo é faxina sem
propósito.

---

Voltar: **[Os Cinco Pilares](02-os-cinco-pilares.md)** ·
Próximo: **[Implementação](04-implementacao.md)** · **[Referências](05-referencias.md)**
