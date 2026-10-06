---
type: source
source_kind: meeting
title: "Design review: billing-sync, call or queue"
date: 2026-01-20
participants: [Ana Ribeiro, Bruno Costa, Carla Mendes]
duration_min: 6
verbatim: true
note: "Fictional sample for the No-Drift Wiki smoke test. Copy it to 10-sources/meetings/ and ingest it."
---

# Transcript

[00:00:04] Ana Ribeiro: Okay, let's start. The question today is whether billing-sync keeps calling the invoice service directly or moves to a queue.
[00:00:15] Bruno Costa: Right. So, last month we had the outage on the 14th. The invoice service was slow for twenty minutes and billing-sync kept retrying in a tight loop.
[00:00:29] Carla Mendes: Uh-huh.
[00:00:31] Bruno Costa: Every retry held a database connection. We ran out of connections in about four minutes, and then checkout went down with it.
[00:00:44] Ana Ribeiro: So the slow dependency took down a service that doesn't even need it to be fast.
[00:00:50] Bruno Costa: Exactly. Billing-sync doesn't need an answer in real time. Nobody waits for that invoice on screen.
[00:01:02] Carla Mendes: I'm not fully convinced. A queue moves the problem, it doesn't remove it. If the consumer falls behind, invoices go out hours late and finance notices before we do.
[00:01:18] Ana Ribeiro: That's fair. What would make you comfortable?
[00:01:22] Carla Mendes: An alert on queue age. If the oldest message is older than fifteen minutes, someone gets paged.
[00:01:33] Bruno Costa: I can live with that. And a dead-letter queue, so one bad invoice doesn't block the rest.
[00:01:41] Ana Ribeiro: Is there a case where the direct call is still the right answer?
[00:01:46] Bruno Costa: Refunds. When a customer asks for a refund, support is on the phone with them. That one has to be synchronous.
[00:01:58] Carla Mendes: Agreed. Refunds stay as a direct call, with a timeout of two seconds and no retries.
[00:02:10] Ana Ribeiro: Okay. Decision: invoices move to the queue, refunds stay synchronous.
[00:02:16] Ana Ribeiro: Bruno, can you write the RFC by Friday?
[00:02:19] Bruno Costa: Yes, by Friday.
[00:02:21] Carla Mendes: I'll set up the queue-age alert before the migration, not after. Last time we added monitoring after the incident, and that's how we learned about the connections.
[00:02:35] Ana Ribeiro: Good. Anything we're not deciding today?
[00:02:39] Bruno Costa: The retry policy for the consumer. I'd go with exponential backoff, but I want to look at what the payments team does first.
[00:02:50] Ana Ribeiro: Let's leave that open. Thanks, everyone.
