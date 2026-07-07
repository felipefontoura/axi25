# 1. Filosofia

> O AXI25 mistura, de propósito, várias tradições conhecidas de gestão de conhecimento.
> Este capítulo nomeia cada uma com honestidade, em linguagem simples, e mostra como elas se
> encaixam. Se você já ouviu "Zettelkasten", "PARA", "segundo cérebro" ou "Zeitgeist" por aí e
> nunca soube como se relacionam — aqui está o mapa. Toda afirmação aponta para uma fonte real
> em [Referências](05-referencias.md).

## O que isto realmente é (não é armazenamento)

Não confunda o AXI25 com um lugar pra guardar e organizar conhecimento. Armazenamento é commodity —
qualquer app de nota faz. Não é o produto.

O AXI25 é a **memória persistente de você, um operador específico.** O trabalho dele é fazer a IA
que você usa ficar progressivamente mais inteligente sobre você. Toda IA começa do zero: não sabe
quem você é, o que você já decidiu, como você pensa, o que você está construindo. Este vault é o
antídoto — o registro que compõe e que a sua IA lê pra parar de recomeçar do zero a cada conversa.

O resultado não é "saber mais". É a sua **vantagem**. Todo mundo usa as mesmas IAs; a diferença é
que a sua conhece a sua prática inteira — então você decide na frente e chega mais preparado,
enquanto a IA dos outros reseta todo dia. O tempo joga a favor de você. Essa vantagem que compõe é
o produto; as notas, não.

## O problema que ele resolve

Você lê, constrói e pensa o tempo todo. Quase nada disso se acumula. Apps de notas viram
cemitérios; favoritos apodrecem; a mesma lição é reaprendida três vezes. O gargalo nunca foi
capturar — é a *manutenção* de transformar entrada dispersa em conhecimento conectado, reutilizável
e pronto pra decisão. Essa manutenção é chata, infinita e é exatamente o que os humanos abandonam.

A aposta do AXI25: **deixar uma IA cuidar da manutenção, e deixar princípios comprovados de
anotação moldarem o que ela constrói.** Você traz o julgamento e as perguntas; a IA extrai e conecta
— ela não arquiva. Guardar sem reusar é cemitério; o valor está no que compõe, não no que acumula parado.

## Cinco tradições, um sistema

O AXI25 não é um método só. É a síntese de cinco, cada um resolvendo uma peça diferente.

### 1. Zettelkasten — o DNA do wiki

Niklas Luhmann, um sociólogo alemão, publicou ~70 livros e 400+ artigos escrevendo em fichas
guardadas numa *caixa de fichas* (Zettelkasten). Cada ficha continha **uma ideia**, com suas
próprias palavras, um endereço e **links explícitos** para fichas relacionadas. A mágica não
estava no armazenamento — estava na teia de conexões, que gerava ideias novas quando as fichas
eram combinadas. Sönke Ahrens popularizou o método para todo mundo em *How to Take Smart Notes*
(2017).[^zk][^ahrens]

Dois princípios que o AXI25 pega inteiros:

- **Atomicidade** — uma ideia clara por nota. Ideias enterradas dentro de documentos grandes não
  podem ser religadas nem reencontradas.[^zk]
- **Os links são o produto** — quando você conecta duas notas, você articula *por que* elas se
  relacionam. Esse ato é pensar. (O AXI25 exige no mínimo 3 conexões por página de wiki.)

É isso que o `20-wiki/` *é*: um Zettelkasten pessoal.

### 2. PARA & "Building a Second Brain" — organizar por ação, destilar com o tempo

O insight de Tiago Forte: *"nossos cérebros servem para ter ideias, não para armazená-las."*[^basb]
O método PARA organiza tudo o que você guarda por **acionabilidade**, não por assunto —
**P**rojetos, **A**reas (áreas), **R**esources (recursos), **A**rchives (arquivos).[^basb] O ciclo
CODE — **C**apture (capturar), **O**rganize (organizar), **D**istill (destilar), **E**xpress
(expressar) — é o pipeline da entrada bruta até a saída real, com a *sumarização progressiva*
destilando notas em passagens sucessivas.[^basb]

O AXI25 pega a lente de acionabilidade (suas camadas mapeiam Projetos/Áreas/Recursos) e o
pipeline capturar→destilar→expressar, mas troca a sumarização progressiva manual pelo
[Deep Extraction Standard](03-tecnicas.md#deep-extraction-standard-des) operado pela IA.

### 3. Notas evergreen & Mapas de Conteúdo — maturidade e navegação

Andy Matuschak formalizou as **notas evergreen**: notas escritas para *evoluir e se acumular ao
longo de projetos*, que precisam ser atômicas, orientadas a conceito (com título de afirmação, não
de fonte) e densamente linkadas.[^evergreen] Crucial: ele observa que a *maioria* das notas que as
pessoas tomam é transitória — e tudo bem; a disciplina está em desenvolver as poucas que merecem se
tornar evergreen.[^evergreen] Os **Mapas de Conteúdo** (MOCs) de Nick Milo acrescentam notas-índice
leves e evolutivas, que ficam acima das notas atômicas sem impor pastas rígidas.[^lyt]

O AXI25 adota a distinção transitório-vs-evergreen como espinha dorsal (veja a escada de
maturidade abaixo) e entrega os MOCs em `20-wiki/maps/`.

### 4. O LLM Wiki — o operador que torna tudo sustentável

Em 2026 Andrej Karpathy descreveu o padrão **LLM Wiki**: em vez de recuperar trechos crus no
momento da pergunta (o RAG padrão), uma LLM *constrói e mantém incrementalmente* um wiki Markdown
persistente e interligado à medida que você o alimenta com fontes. Nas palavras dele: o conhecimento
é *"compilado uma vez e mantido em dia, não re-derivado a cada pergunta,"* e o wiki vira *"um
artefato persistente que compõe juros"* onde *"as referências cruzadas já estão lá."*[^karpathy]

O diagnóstico dele sobre por que humanos abandonam wikis é a razão de existir do AXI25:

> "A parte tediosa de manter uma base de conhecimento não é ler nem pensar — é a manutenção… Os
> humanos abandonam wikis porque o peso da manutenção cresce mais rápido que o valor. LLMs não
> ficam entediadas, não esquecem de atualizar uma referência cruzada e conseguem tocar 15 arquivos
> numa passagem só."[^karpathy]

O AXI25 é uma implementação opinativa desse padrão, ligada às tradições de anotação acima. (Nota
de atribuição: "LLM Wiki" é o termo de Karpathy em 2026; "wiki-llm" é apelido da comunidade. O
AXI25 é *inspirado* nisso — não é afiliado.)

### 5. Zeitgeist — a camada temporal, para quem trabalha com mídia

*Zeitgeist* (alemão: *Zeit* = tempo, *Geist* = espírito) significa o **espírito da época** — as
ideias, humores e pressupostos dominantes de um período, tão presentes que as pessoas os vivenciam
como "simplesmente como as coisas são". O termo entrou na filosofia por Herder (1769) e ficou
central na filosofia da história de Hegel.[^zeitgeist]

O conhecimento permanente (o wiki) é feito para durar anos. Mas se você produz conteúdo, acompanha
mercados ou precisa ficar antenado, você também precisa capturar o **discurso vivo** — o que está
ganhando energia *agora*, antes de virar consenso. Esses sinais se deterioram em meses, então
precisam ficar *separados* do conhecimento permanente. É o `50-zeitgeist/`. Se você não trabalha
com mídia, pode ignorar esse pilar por completo.

## A síntese: a escada de maturidade

Aqui está a ideia que amarra as cinco — e a coisa mais importante para entender.

Tanto o Zettelkasten (notas fugazes → de literatura → permanentes) quanto o BASB (capturar →
destilar) chegam, de forma independente, à mesma verdade estrutural: **nem todo pensamento deve
virar conhecimento permanente de imediato.**[^maturity] Capturas cruas são ruidosas e dependentes
de contexto. Só através do processamento — reescrever com as próprias palavras, testar contra o que
você já sabe, destilar até a afirmação essencial — é que um pensamento *conquista* a permanência.

O AXI25 torna essa escada literal. Cada degrau é uma pasta:

```
00-capture/   entrada bruta, sem interpretação          (fugaz)
40-journal/   vida, reflexão, estado interior           (amadurece como experiência vivida)
25-studies/   estudo em formação — ideias sendo digeridas (notas de literatura/trabalho)
35-worklogs/  trabalho executado denso — matéria-prima para minerar
20-wiki/      conhecimento promovido, atômico, linkado   (evergreen / permanente)
30-projects/  execução e entregáveis
50-zeitgeist/ sinais temporais de discurso              (expira em meses)
```

Uma ideia é **promovida** ao wiki só quando merece: você pede explicitamente, ou ela reaparece ao
longo de dias/projetos/fontes, ou muda uma decisão, ou vira vocabulário recorrente, ou tem 3+
conexões reais.[^basb][^zk] Até lá, ela espera num degrau mais baixo. Essa única regra é o que
separa o AXI25 de todo app de notas que vira um pântano.

A fórmula do sistema:

```
prática → observação → estudo → conceito → decisão → execução → conteúdo/produto → nova prática
```

O objetivo **não é saber mais.** É construir, decidir, ensinar e discernir melhor — porque sua
experiência foi preservada, conectada e amadurecida, em vez de perdida.

---

Próximo: **[Os Cinco Pilares](02-os-cinco-pilares.md)** — como essa filosofia vira uso diário.

## Notas de rodapé

[^zk]: Método Zettelkasten / Luhmann — zettelkasten.de. Veja [Referências](05-referencias.md#zettelkasten).
[^ahrens]: Sönke Ahrens, *How to Take Smart Notes* (2017). Veja [Referências](05-referencias.md#zettelkasten).
[^basb]: Tiago Forte, "Building a Second Brain: The Definitive Introductory Guide" (Forte Labs, 2023). Veja [Referências](05-referencias.md#para--building-a-second-brain).
[^evergreen]: Andy Matuschak, "Evergreen notes." Veja [Referências](05-referencias.md#notas-evergreen--jardins-digitais).
[^lyt]: Nick Milo, Linking Your Thinking / Mapas de Conteúdo. Veja [Referências](05-referencias.md#notas-evergreen--jardins-digitais).
[^karpathy]: Andrej Karpathy, "LLM Wiki" (GitHub gist, 2026). Veja [Referências](05-referencias.md#o-padrão-llm-wiki).
[^zeitgeist]: "Zeitgeist" — Wikipedia; Hegel, *Lectures on the Philosophy of History*. Veja [Referências](05-referencias.md#zeitgeist).
[^maturity]: Convergência do modelo de três níveis do Zettelkasten e da sumarização progressiva do BASB. Veja [Referências](05-referencias.md#maturidade-das-notas).
