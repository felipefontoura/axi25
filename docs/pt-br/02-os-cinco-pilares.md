# 2. Os Cinco Pilares

> O AXI25 é construído em torno de cinco camadas de trabalho distintas: capturar entrada bruta,
> organizar fontes externas, construir conhecimento permanente, acompanhar a execução e acompanhar
> o discurso vivo. Cada camada tem um dono claro (uma skill), uma pasta clara e uma relação clara
> com as outras. A filosofia por trás do desenho: [Filosofia](01-filosofia.md). O ofício de
> trabalhar dentro de cada camada: [Técnicas](03-tecnicas.md).

## 1. Captura

**O que é.** A caixa de entrada sem fricção. Toda ideia, nota, URL, pensamento ou rascunho que
entra no sistema aterrissa aqui primeiro, sem classificação. Nada é processado na hora da captura —
o roteamento acontece depois via `axi25-process`. A regra: joga pra dentro, organiza depois.

**Pasta**: `00-capture/`, com quatro subcaixas:

| Caixa | O que vai aqui | Comportamento |
|---|---|---|
| `quick/` | Ideia, URL, pensamento sem triagem — "ainda não sei o que é" | Novo arquivo com timestamp a cada vez |
| `diary/` | Vida, humor, família, oração, reflexão pessoal | Novo arquivo com timestamp a cada vez |
| `studies/` | Uma nota de estudo ou rascunho teórico em andamento (WIP) | Acrescenta ao rascunho ativo; cria se não existir |
| `worklogs/` | Um rascunho de sessão de trabalho em andamento (WIP) | Acrescenta ao rascunho ativo; cria se não existir |

`studies/` e `worklogs/` são **rascunhos incrementais** — você vai acrescentando ao mesmo arquivo
ao longo de uma sessão. Quando prontos, eles graduam para sua casa permanente. `quick/` e `diary/`
geram um novo arquivo com timestamp a cada vez.

**Skills**: `axi25-capture` salva na caixa de entrada. `axi25-process` classifica e roteia.

**Passo a passo.** Você está depurando uma integração de API e percebe algo que vale lembrar: "O
SDK tenta de novo em silêncio — você tem que setar um retry handler custom ou nunca vai saber por
que as chamadas estão lentas." Você diz "captura isso." O `axi25-capture` joga em `quick/` com
`status: unprocessed`. Depois, ao rodar o `axi25-process`, isso é classificado: é uma descoberta
técnica ligada a uma sessão ativa, então roteia para o rascunho de sessão em `00-capture/worklogs/`
e, por fim, para `35-worklogs/`.

**Quando usar.** Sempre. Toda entrada começa aqui.

**Quando NÃO usar.** Não capture quando você já sabe o destino. Se quer integrar um artigo
específico ao wiki, rode `axi25-ingest` direto — a captura é para quando você só quer tirar algo
da cabeça.

---

## 2. Organização de Fontes

**O que é.** A biblioteca de material externo bruto e não modificado: artigos, livros, cursos,
papers e assets que você trouxe para o vault como referência. O `10-sources/` é **somente leitura**
— você nunca edita um arquivo aqui. Seu propósito é ser uma base estável e citável que o
`axi25-ingest` lê e transforma em conhecimento de wiki.

**Pasta**: `10-sources/`, com subpastas:

```
10-sources/
  articles/
  books/
  courses/
  papers/
  assets/
```

**Skill**: `axi25-ingest` lê daqui e escreve em `20-wiki/`. Ele nunca escreve de volta em
`10-sources/`.

**Uma nota sobre formato.** As fontes precisam estar em texto quando você as coloca aqui. Cole o
texto do artigo, do capítulo do livro ou transcrições diretamente. A conversão automática de
PDF-para-Markdown e EPUB-para-Markdown é um add-on planejado, não disponível nesta edição. Por ora,
você copia, cola ou solta fontes que já são texto.

**Passo a passo.** Você cola o texto completo de um artigo sobre dívida de sono em
`10-sources/articles/walker-sleep-debt.md` com o frontmatter correto (`source_kind`, `source_url`,
`date_published`). Então roda `axi25-ingest` nele. A skill lê a fonte, aplica o Deep Extraction
Standard e escreve em `20-wiki/`: uma página de síntese `source-*` resumindo o artigo, páginas de
conceito para as ideias atômicas, uma página de entidade para o pesquisador e uma atualização em
`20-wiki/areas/health.md`. O arquivo-fonte em `10-sources/` fica intocado.

**Quando usar.** Sempre que você tiver uma fonte externa substancial — artigo, capítulo de livro,
paper, transcrição — que queira representar permanentemente no seu wiki.

**Quando NÃO usar.** Não coloque suas próprias notas de estudo ou reflexões internas aqui. Isso não
é fonte externa — pertence a `00-capture/studies/` (depois `25-studies/`). Não modifique arquivos
em `10-sources/` nem para corrigir um typo; eles são o registro de arquivo.

---

## 3. Wiki

**O que é.** O núcleo que compõe juros. O `20-wiki/` é onde a entrada bruta vira conhecimento
permanente, atômico e linkado. Diferente de um app de notas ou de uma pasta de documentos, o wiki
cresce: cada ingestão e promoção de estudo adiciona conexões ao que já existe, tornando o
conhecimento antigo mais útil com o tempo. Este é o Zettelkasten no centro do sistema.

**Pasta**: `20-wiki/`, com subpastas:

```
20-wiki/
  concepts/     ideias atômicas — uma ideia por arquivo
  entities/     pessoas, empresas, ferramentas, tecnologias
  areas/        domínios da vida (trabalho, saúde, família, aprendizado, finanças, …)
  decisions/    decisões importantes com contexto e desfechos
  patterns/     padrões recorrentes detectados no diário/wiki
  syntheses/    análises salvas, comparações, resumos de fontes
  maps/         Mapas de Conteúdo (índices temáticos)
```

**Skills**:

- `axi25-ingest` — escreve no wiki (cria e atualiza páginas de conceito, entidade, área e síntese
  via Deep Extraction Standard)
- `axi25-query` — lê o wiki para responder suas perguntas
- `axi25-lint` — checa órfãos, páginas fracas, links fantasmas e contradições

**Passo a passo.** Depois de ingerir o artigo sobre dívida de sono, o `axi25-ingest` cria
`20-wiki/concepts/sleep-debt.md` (ideia, mecanismo, exemplos, anti-padrões), atualiza
`20-wiki/entities/matthew-walker.md` e adiciona um sinal em `20-wiki/areas/health.md`. Três semanas
depois, você ingere um livro sobre performance com um capítulo sobre recuperação. O `axi25-ingest`
encontra o `sleep-debt.md` existente e o **atualiza** com a nova perspectiva, em vez de criar
duplicata. O conceito agora cita duas fontes e tem seis conexões. Esse é o efeito de juros compostos.

**Quando usar.** Consulte (query) sempre que quiser saber o que você sabe ("o que eu sei sobre
atenção?"). Ingira sempre que tiver uma fonte externa madura. Rode o lint periodicamente —
especialmente depois de uma ingestão grande — para manter o grafo saudável.

**Quando NÃO usar.** Não promova todo pensamento fugaz para `20-wiki/`. Ideias imaturas pertencem a
`00-capture/`, `25-studies/` ou `40-journal/`. Veja a escada de maturidade em
[Técnicas](03-tecnicas.md#a-escada-de-maturidade--regras-de-promoção). A regra anti-pântano:
páginas de wiki são conquistadas, não concedidas.

---

## 4. Projetos & Worklogs

**O que é.** A camada de execução. O `30-projects/` acompanha o trabalho ativo (metas, tarefas,
status). O `35-worklogs/` é a biblioteca permanente de sessões densas de trabalho — matéria-prima
estratégica que você minera em busca de aprendizado, conteúdo e sementes de projeto.

**Pastas**:

```
30-projects/
  active/       trabalho atual
  someday/      ideias estacionadas
  archive/      concluído ou abandonado
35-worklogs/
  YYYY-MM-DD-slug.md    sessão bruta congelada
  harvest/              oportunidades mineradas da sessão
```

**Skills**: `axi25-worklog` cria e colhe worklogs. `axi25-plan` (planejamento semanal) e
`axi25-review` (retrospectiva semanal) leem as duas pastas.

**A colheita (harvest).** Uma sessão de trabalho não acaba quando você fecha o editor. Quando um
rascunho em `00-capture/worklogs/` fica pronto, o `axi25-worklog` oferece um teaser ("esta sessão
tem ~6 oportunidades") e — se você confirmar — roda a colheita. A colheita lê a sessão por cinco
lentes, mais uma sexta visão de arco:

| Lente | O que revela |
|---|---|
| Aprendizado | Lições caras e duráveis — candidatas a conceito |
| Projetos | Sementes de trabalho novo, ou o que alimenta um projeto existente |
| Conteúdo | Ângulos com gancho para vídeo, post, thread ou artigo |
| Ferramentas | Padrões reutilizáveis que valem virar template ou script |
| Relações | Como a sessão conecta com outros conceitos e projetos |
| Jornada | Fios recorrentes de logs anteriores; competências emergentes |

A saída é `35-worklogs/harvest/YYYY-MM-DD-slug.md`: uma lista de oportunidades abertas. Cada item é
um checkbox (`- [ ]`) — um rastreador de conversão. Quando você age em um, ele sai para a casa real
dele (um projeto, uma nota de estudo, um rascunho de conteúdo) e é marcado como feito (`- [x]`). O
arquivo da colheita fica como registro permanente.

**Passo a passo.** Você passa três horas depurando uma condição de corrida no seu processador de
fila. Você registra a sessão em `00-capture/worklogs/2026-07-07-queue-debug.md`. Ao terminar, o
`axi25-worklog` oferece: "3 itens de aprendizado, 1 semente de conteúdo, 1 candidato a ferramenta."
Você confirma. A colheita revela: "a semântica de retry da fila é indocumentada — oportunidade de
vídeo-thread" e "o padrão de isolamento usado aqui é reutilizável — vale empacotar como script." O
log bruto congela em `35-worklogs/`. Dois dias depois você começa o vídeo, marca o item da colheita
e o linka ao projeto.

**Quando usar.** Use `30-projects/active/` para qualquer trabalho com meta e prazo. Use
`axi25-worklog` sempre que terminar uma sessão técnica densa que valha minerar.

**Quando NÃO usar.** Não roteie notas de estudo para `35-worklogs/` — essas vão para `25-studies/`.
Não roteie reflexões de vida para worklogs — essas vão para `40-journal/`. O eixo vida/estudo/
trabalho é rígido; veja [Técnicas](03-tecnicas.md#a-escada-de-maturidade--regras-de-promoção).

---

## 5. Zeitgeist

**O que é.** A camada do discurso vivo — fotografias temporais da conversa pública sobre temas que
você acompanha. Nomeada a partir do conceito filosófico alemão (veja
[Referências](05-referencias.md#zeitgeist)): o "espírito da época". Este pilar é para quem cria
conteúdo, acompanha mercados ou precisa ficar antenado no que está ganhando energia agora. Se não
for o seu caso, pule por completo.

**Pastas**:

```
50-zeitgeist/
  discourse/
    articles/     artigos, newsletters, blog posts
    papers/       preprints e papers (foco em discurso, não DES profundo)
    threads/      discussões de Twitter/X, Hacker News, LinkedIn
    talks/        transcrições de palestras
  syntheses/      síntese multi-formato sobre um tema e período
  observations/   tendências sem fonte única
```

**Skill**: `axi25-ingest` § Zeitgeist Scouting — acionada quando uma fonte tem
`scan_for_zeitgeist: true` no frontmatter, ou quando você diz "escoteia os sinais".

**Os cinco tipos de sinal.** O scouting de zeitgeist identifica cinco tipos de sinal de discurso:

| Tipo | O que é |
|---|---|
| `hot-take` | Declarativo, direto, citável — fraseado polêmico |
| `contrário` | Posição contra o consenso atual |
| `frame-novo` | Um novo enquadramento de um tema conhecido |
| `dado-novo` | Um número, fato ou estudo de caso específico que muda o argumento |
| `tensão` | Discordância entre vozes relevantes |

Cada sinal recebe um `pauta_rating` (1-5) pontuando sua utilidade para o seu conteúdo ou
posicionamento. Os sinais vivem em `50-zeitgeist/discourse/<tipo>/<fonte>/signals/`, nunca em
`20-wiki/`. Eles se deterioram em 3-6 meses e são deliberadamente mantidos separados do
conhecimento permanente.

**Passo a passo.** Você cola um ensaio do Substack sobre regulação de IA em
`50-zeitgeist/discourse/articles/thompson-ai-regulation.md`. Durante a ingestão, a passagem de
Zeitgeist Scouting encontra dois sinais: uma afirmação `contrário` de que os frameworks de segurança
já são obsoletos, e um `dado-novo` citando uma decisão judicial específica. Ela escreve dois
arquivos de sinal, avalia em 4 e 3, e mostra uma tabela ordenada. Você decide que o ângulo contrário
merece uma resposta curta. Abre um rascunho de projeto e linka o sinal como semente.

**Quando usar.** Quando você trabalha com discurso público — criação de conteúdo, pesquisa de
mercado, jornalismo, advocacy. Para rastrear o que está vivo na conversa agora, antes de virar
consenso.

**Quando NÃO usar.** Não coloque sinais de zeitgeist em `20-wiki/`. Discurso temporal não é
conhecimento permanente. Não aplique DES completo a fontes de zeitgeist — a passagem de scouting é
propositalmente rasa. O valor é o pulso do discurso, não uma masterclass.

---

## As camadas de apoio: 40-journal/ e 25-studies/

Mais duas pastas não são chamadas de "pilares", mas são degraus essenciais da escada de maturidade,
e alimentam o wiki:

**`40-journal/`** guarda entradas diárias de vida (escritas por você, não pela IA), reviews
semanais, planos semanais e extrações de sinais. É a camada interior. Ideias e padrões que aparecem
repetidamente no seu diário são candidatos a `25-studies/` ou à eventual promoção ao wiki.

**`25-studies/`** é estudo em formação. Quando você está digerindo um livro, curso ou conceito
teórico, as notas vivem aqui até estarem maduras o bastante para promover. Isso não é um worklog
(isso é `35-worklogs/`) nem vida (isso é `40-journal/`): notas de estudo são entrada intelectual em
digestão.

As duas camadas ficam entre `00-capture/` e `20-wiki/` na escada de maturidade. Veja
[Técnicas](03-tecnicas.md#a-escada-de-maturidade--regras-de-promoção) para as regras completas de
promoção e o eixo de gênero vida/estudo/trabalho.

---

## Como os pilares se conectam

A captura alimenta tudo. A entrada bruta aterrissa em `00-capture/`, e o `axi25-process` classifica:
vida vai para o diário, estudo vai para `25-studies/`, sessões de trabalho vão para `35-worklogs/`,
fontes externas vão para `10-sources/` e depois, via `axi25-ingest`, para o wiki. Os projetos bebem
do wiki (conceitos, decisões, padrões) e o realimentam via colheitas de worklog. O Zeitgeist roda em
paralelo — sinais temporais nunca entram no wiki, mas podem semear projetos ou conteúdo.

O wiki é o volante de inércia: cada ingestão e promoção o deixa mais conectado, tornando futuras
consultas, reviews e planejamentos mais úteis. O sistema compõe juros porque a manutenção —
referências cruzadas, atualizações, links — acontece automaticamente.

Próximo: **[Técnicas](03-tecnicas.md)** — o ofício que faz cada pilar funcionar.
