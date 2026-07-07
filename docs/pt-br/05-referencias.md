# 5. Referências

> Estas são obras de terceiros citadas para fins educativos. O AXI25 não é afiliado, endossado
> nem patrocinado por nenhum dos autores, editoras ou organizações listados abaixo.

---

## Zettelkasten

**"Introduction to the Zettelkasten Method"** — Sascha Fast, Zettelkasten.de, 2020 —
<https://zettelkasten.de/introduction/>

A referência fundacional do método de caixa de fichas de Luhmann, reproduzindo o argumento central
do ensaio de Luhmann de 1981 "Communicating with Slip Boxes". A caixa de fichas não é um dispositivo
de armazenamento, e sim um parceiro de pensamento — a unidade produtiva não é a nota, mas a *teia de
notas*, gerada por atomicidade e links explícitos. O AXI25 leva os dois princípios inteiros para o
`20-wiki/`: uma ideia por arquivo, mínimo de 3 conexões por página.

---

**"How to Take Smart Notes"** — Sönke Ahrens, 2017 (2ª ed. 2022) —
<https://www.soenkeahrens.de/en/takesmartnotes>

O tratamento moderno e acessível do Zettelkasten para o trabalho de conhecimento contemporâneo.
Introduz o modelo de três níveis: notas fugazes (captura bruta) → notas de literatura (material de
fonte processado) → notas permanentes (sua própria síntese, com suas palavras). Argumento central: a
maioria dos sistemas de anotação falha porque otimiza para entrada, não para saída; escrever é
pensar, e a caixa de fichas força a escrita. O AXI25 mapeia os três níveis diretamente:
`00-capture/` → `25-studies/` (ou `35-worklogs/`) → `20-wiki/`.

---

## PARA & Building a Second Brain

**"Building a Second Brain: The Definitive Introductory Guide"** — Tiago Forte, Forte Labs, 2023 —
<https://fortelabs.com/blog/basboverview/>

A afirmação central de Forte: *"nossos cérebros servem para ter ideias, não para armazená-las."* O
método PARA organiza tudo por acionabilidade — **P**rojects (projetos), **A**reas, **R**esources
(recursos), **A**rchive (arquivo) — em vez de por assunto. O pipeline CODE descreve o loop completo
da entrada à saída: **C**apture, **O**rganize, **D**istill, **E**xpress. A Sumarização Progressiva é
a técnica de destilação: voltar às notas em várias passagens, a cada vez destacando só o que ainda
importa. O AXI25 pega a lente de acionabilidade e o pipeline capturar-para-destilar; substitui a
sumarização progressiva manual pelo Deep Extraction Standard operado por IA
([Técnicas](03-tecnicas.md#deep-extraction-standard-des)).

---

## Notas evergreen & jardins digitais

**"Evergreen notes"** — Andy Matuschak —
<https://notes.andymatuschak.org/z5E5QawiXCMbtNtupvxeoEX>

A definição de Matuschak para notas feitas para evoluir e se acumular ao longo de projetos, não só
capturar no momento. Três propriedades obrigatórias: atômica (um conceito por nota), orientada a
conceito (titulada como afirmação, não como fonte) e densamente linkada. A observação-chave: a
maioria das notas que as pessoas tomam é transitória, e tudo bem — a disciplina está em identificar
as poucas que merecem se tornar evergreen. Essa distinção transitório-vs-evergreen é o que o AXI25
formaliza como escada de maturidade.

---

**"A Brief History & Ethos of the Digital Garden"** — Maggie Appleton, 2020 —
<https://maggieappleton.com/garden-history>

Traça o conceito de jardim digital a partir do ensaio de 2015 de Mike Caulfield "The Garden and the
Stream": o jardim (um espaço cultivado e linkado de ideias) vs. o fluxo (um feed cronológico de
posts). Appleton examina como o ethos do jardim — público, linkado, não linear, sempre em progresso —
emergiu como reação à finalidade performática do blog. Pano de fundo útil para entender por que o
AXI25 é organizado como um wiki em evolução contínua, e não como uma coleção de documentos
acabados.

---

**Linking Your Thinking (LYT) / Maps of Content** — Nick Milo —
<https://www.linkingyourthinking.com/>

O sistema de Milo introduz os Maps of Content (MOCs) como notas-índice flexíveis — hubs de navegação
que ficam acima das notas atômicas sem impor hierarquia rígida. MOCs substituem a dicotomia
pasta-ou-tag por uma terceira opção: um índice curado e evolutivo que cresce com seu conhecimento. O
AXI25 entrega MOCs em `20-wiki/maps/`. Veja [Técnicas](03-tecnicas.md#mapas-de-conteúdo-mocs) para
como usá-los.

---

## O padrão LLM Wiki

**"LLM Wiki"** — Andrej Karpathy, GitHub Gist, 2026 —
<https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f>

A nota de design de Karpathy para um padrão em que uma LLM *constrói e mantém incrementalmente* um
wiki Markdown persistente e interligado à medida que você o alimenta com fontes — em vez de re-derivar
conhecimento de trechos crus no momento da pergunta (o RAG padrão). O enquadramento dele: o
conhecimento é *"compilado uma vez e mantido em dia, não re-derivado a cada pergunta,"* e o wiki vira
*"um artefato persistente que compõe juros"* onde *"as referências cruzadas já estão lá."* O
diagnóstico dele de por que humanos abandonam wikis — o peso da manutenção cresce mais rápido que o
valor, e LLMs não ficam entediadas, não esquecem de atualizar uma referência cruzada e conseguem
tocar 15 arquivos numa passagem só — é a motivação central do AXI25.

**Nota de precisão.** "LLM Wiki" é o termo de Karpathy para essa nota de design de 2026; "wiki-llm" é
apelido da comunidade derivado do nome do arquivo do gist. O AXI25 é *inspirado* no padrão — não
afiliado a Karpathy nem à obra dele. Não confunda com os enquadramentos separados dele "Software 2.0"
(ensaio de 2017) ou "LLM OS"; são ideias distintas sobre coisas diferentes.

---

**(contexto) "As We May Think"** — Vannevar Bush, *The Atlantic*, 1945 —
<https://en.wikipedia.org/wiki/Memex>

O ensaio de 1945 de Bush imaginou o Memex: um dispositivo do tamanho de uma escrivaninha para
armazenar e recuperar documentos por trilhas associativas, não por índices hierárquicos. O Memex é o
ancestral intelectual do hipertexto, dos wikis e do padrão LLM Wiki — a ideia de que o conhecimento
deveria ser navegável por associação, não por arquivamento alfabético, antecede o computador em anos.
Citado aqui como contexto histórico, não como fonte direta de método.

---

## Zeitgeist

**"Zeitgeist"** — Wikipedia —
<https://en.wikipedia.org/wiki/Zeitgeist>

Zeitgeist (alemão: *Zeit* = tempo, *Geist* = espírito) significa o "espírito da época" — as ideias,
humores e pressupostos dominantes de um período, vivenciados pelos participantes como simplesmente
como as coisas são. O filósofo Johann Gottfried Herder cunhou o composto alemão em 1769. O conceito
tornou-se central na filosofia da história de Hegel: "nenhum homem pode ultrapassar o seu tempo, pois
o espírito do seu tempo é também o seu próprio espírito." O AXI25 usa o termo para sua camada
`50-zeitgeist/`: fotografias temporais de discurso que capturam o que está vivo na conversa pública
agora, com a compreensão explícita de que esses sinais vão se deteriorar em meses. Veja
[Os Cinco Pilares](02-os-cinco-pilares.md) § Zeitgeist para o que vai lá e o que não vai.

---

## Maturidade das notas

Não existe uma única fonte definitiva para o conceito de maturidade de notas — ele emerge da
convergência de duas tradições independentes:

O **modelo de três níveis do Zettelkasten** (Ahrens 2017, zettelkasten.de) distingue notas fugazes
(transitórias, dependentes de contexto, feitas para serem processadas) de notas de literatura
(material de fonte processado com suas palavras) de notas permanentes (sua síntese, feita para durar
e se acumular). Nem toda nota é feita para ser permanente — só as ideias trabalhadas conquistam a
permanência.

A técnica de **Sumarização Progressiva do BASB** (Forte, fortelabs.com) chega à mesma conclusão
estrutural por outro caminho: você volta às notas em várias passagens, destilando só o que ainda
ressoa a cada passagem. Ideias que não sobrevivem às passagens não são promovidas. O processo em si é
o filtro.

Ambos os frameworks chegam, de forma independente, à mesma verdade: **nem todo pensamento deve virar
conhecimento permanente de imediato.** O AXI25 torna isso literal com sua escada de maturidade —
veja [Filosofia](01-filosofia.md) para o argumento completo e o diagrama.

Fontes: [Zettelkasten](#zettelkasten) · [PARA & Building a Second Brain](#para--building-a-second-brain)
