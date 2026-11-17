Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941389;
	b=j7FT/kqLOEpLEDQ0PTZ/jbTjFuOx6mysSnBoNvQpt4xTMTFeujp3lDfe4B81/ZcJcPu1
	 z4eJP3/pu7agpVoaePTf3xlsiek0znP3dfNnITkHPbC8nvprata9LCu5y8dMnRfnjQP3q
	 aFPuqmrSS3ZkGzmbbMW6a/S9DC+DDr6n4UlnAwPVYlQJCAiXPk0brl7+0oaFLxOtYRHAi
	 CHM7FJ5cBzc971yKW2OHB+mboKsbeMGO6rS9F9WifLqwPkP2FgoRrqe3pCxx1srAjeGz/
	 3ie2m9Yyd1bnNcJVdaI0BB11mwCRGbMDCuriwsW2AIvTIUr97WYXQf3qiQlmR4jj0ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iqWw7gAI+Px1NGEUCbsYm+jBcmDfGV1RFufBqYlyomM=;
	b=FoXiKwsx9VXZZ3ID/097h+TVURPvDZXnqcg6BlJOmnGqeENHOfmsRvsFkWwL5gilJBGh
	 B59j6yO/jdiUEFpCoaPQKvMYUUiRXvW+094H56BBchCCMUgqJrV4EbjurIVUjSqfRr9g2
	 8tsH4/U1S9czNsSSuDMNABkQRP29P75xqNS+U7W22Zf8kcUZlgGJA0P6qpJlasPFz/O/u
	 qp2lXIQxG36/ma6/tMegS4u+YjC4F9m1RYA46dnJ+vGem5qkivgUJwDMYwevIJde+3PXT
	 qLyybI16vnLlHWgzK5BfntnytJSrvlLg/tfSQ2LgDT3vGHdxIi4Y0S+kyQ2MIO/G69w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mj2GzbqN;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1F606A8BB
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE1F606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mj2GzbqN
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso600202eec.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941388; x=1795546188; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqWw7gAI+Px1NGEUCbsYm+jBcmDfGV1RFufBqYlyomM=;
        b=Mj2GzbqNWNRGoflPpGSp6T7EXkoD3aibu4wniIEVYZHebVewnCNe3jZ9hRh0sauXLk
         FoOiEtjm21LQaUo2QOiH5r+LNCZcP7kwwsWqyjmB+6M3vTdk+llIWSoW107D7zknWWtW
         pq3kfTIBH8w+7I3r3p9p/lQAUTUD+r5YsqYWMwVq+QuaPNgD4g3/9mCfSkEY7ke9CSV1
         Vfq0mQTnxRN7yl/GemQhcO8j6aVYy/E4uVowPkArdngTS0X3LDC6/8fU7SLnxTO8dBtI
         QLbsQfZqP78qzOe7ndec2Il/rR6PJOLjyy9TXZ3e51kiNI69/EAX5lyqOy4KFwY0Ii22
         xJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941388; x=1795546188;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqWw7gAI+Px1NGEUCbsYm+jBcmDfGV1RFufBqYlyomM=;
        b=SwMmCNL2wsk+1deZ6iHEdTWMTgdGZqvlQT4Xr16dqfxVG5z9+RuTuH3UpjR9we7gPq
         elOs4le037JP10j7V3mXmX8Em5xcOCtKZgwWFkJ9UoW5KZyWKC9qwVW83tV3IwVGRqWi
         mKnj3u3BsKCafvSg+n/VEbl+05W2Z6mWaoTpQ/mYBUkq3lhZ+GAC5Qco/hBLUkMmFQL/
         AmNPexhtQdgpggFBy/1BVIgegSTSTB/pjWqwxiL71ADltCXIxQYa7dbSWowbqgZjrFO8
         0aMc1o/18bHbLBg8YqXyqVbxR1T30De1u4H2s+VM6+1M7Ehjee8o9F3W8HgNfyo+pWKT
         AW7g==
X-Forwarded-Encrypted: i=1; AL+hErFXzUFktsCcuBI1vHVeQjkeDqN6pFm3QvvHJhNClbjrFYLJh1Sg4Li8rxgpzfPEl182xmQB@lists.linux.dev
X-Gm-Message-State: APuU4Z987ReC+Kpe7t7SvLnhmfK8ogHU0TBJGKhE24KfN7eECcsI/D0C
	+l51FrrYzBxfsibeJ3H/sI6l1oooUvhHLQcUMBklw4R7HgTiWy2fvn4A5uH8RGdAPF+mET6le4z
	feihU3Ti87Q==
X-Received: from dybry9.prod.google.com ([2002:a05:7301:4d09:b0:373:6c70:7c9c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:b196:b0:377:678:2309
 with SMTP id 5a478bee46e88-3827fe76e1bmr299325eec.15.1794941388113; Tue, 17
 Nov 2026 10:49:48 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:43 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-23-irogers@google.com>
Subject: [PATCH v14 22/23] perf machine: Hold machines->lock for remaining
 guests rbtree accesses
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 1324aa051bed ("perf machine: Protect machines->guests rbtree with
a rw_semaphore") added machines->lock to protect machines->guests across
util/machine.c, but direct traversals and teardown of machines.guests in
util/aslr.c, util/build-id.c, and util/session.c were left unlocked.

Acquire down_read(&machines->lock) around the guest rbtree traversals in
aslr_tool__destroy_machines_priv(), perf_session__write_buildid_table(),
machines__for_each_dso(), perf_session__read_build_ids(),
perf_session__fprintf(), and perf_session__dsos_hit_all(), and hold
down_write(&aslr->machines.lock) when erasing remaining guests in
aslr_tool__delete().

Fixes: 1324aa051bed ("perf machine: Protect machines->guests rbtree with a rw_semaphore")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/aslr.c     | 4 ++++
 tools/perf/util/build-id.c | 8 ++++++++
 tools/perf/util/session.c  | 8 ++++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/aslr.c b/tools/perf/util/aslr.c
index e365f807b021..f9ecb6d3f5fb 100644
--- a/tools/perf/util/aslr.c
+++ b/tools/perf/util/aslr.c
@@ -243,11 +243,13 @@ static void aslr_tool__destroy_machines_priv(struct machines *machines)
 	struct rb_node *nd;
 
 	aslr_tool__free_machine_priv(&machines->host);
+	down_read(&machines->lock);
 	for (nd = rb_first_cached(&machines->guests); nd; nd = rb_next(nd)) {
 		struct machine *machine = rb_entry(nd, struct machine, rb_node);
 
 		aslr_tool__free_machine_priv(machine);
 	}
+	up_read(&machines->lock);
 }
 
 static u64 aslr_tool__findnew_mapping(struct aslr_tool *aslr,
@@ -1363,12 +1365,14 @@ void aslr_tool__delete(struct perf_tool *tool)
 	aslr_tool__destroy_machines_priv(&aslr->machines);
 	machines__destroy_kernel_maps(&aslr->machines);
 
+	down_write(&aslr->machines.lock);
 	while ((nd = rb_first_cached(&aslr->machines.guests)) != NULL) {
 		struct machine *machine = rb_entry(nd, struct machine, rb_node);
 
 		rb_erase_cached(nd, &aslr->machines.guests);
 		machine__delete(machine);
 	}
+	up_write(&aslr->machines.lock);
 
 	machines__exit(&aslr->machines);
 	free(aslr);
diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index 02233ef0eaff..c792448cc344 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -374,13 +374,16 @@ int perf_session__write_buildid_table(struct perf_session *session,
 	if (err)
 		return err;
 
+	down_read(&session->machines.lock);
 	for (nd = rb_first_cached(&session->machines.guests); nd;
 	     nd = rb_next(nd)) {
 		struct machine *pos = rb_entry(nd, struct machine, rb_node);
+
 		err = machine__write_buildid_table(pos, fd);
 		if (err)
 			break;
 	}
+	up_read(&session->machines.lock);
 	return err;
 }
 
@@ -926,12 +929,14 @@ machines__for_each_dso(struct machines *machines, machine__dso_t fn, void *priv)
 	int ret = machine__for_each_dso(&machines->host, fn, priv);
 	struct rb_node *nd;
 
+	down_read(&machines->lock);
 	for (nd = rb_first_cached(&machines->guests); nd;
 	     nd = rb_next(nd)) {
 		struct machine *pos = rb_entry(nd, struct machine, rb_node);
 
 		ret |= machine__for_each_dso(pos, fn, priv);
 	}
+	up_read(&machines->lock);
 	return ret ? -1 : 0;
 }
 
@@ -962,11 +967,14 @@ bool perf_session__read_build_ids(struct perf_session *session, bool with_hits)
 	struct rb_node *nd;
 	bool ret = machine__read_build_ids(&session->machines.host, with_hits);
 
+	down_read(&session->machines.lock);
 	for (nd = rb_first_cached(&session->machines.guests); nd;
 	     nd = rb_next(nd)) {
 		struct machine *pos = rb_entry(nd, struct machine, rb_node);
+
 		ret |= machine__read_build_ids(pos, with_hits);
 	}
+	up_read(&session->machines.lock);
 
 	return ret;
 }
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index a58b4fe44b62..4e11eabbbe6f 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -3965,11 +3965,13 @@ size_t perf_session__fprintf(struct perf_session *session, FILE *fp)
 {
 	size_t ret = machine__fprintf(&session->machines.host, fp);
 
+	down_read(&session->machines.lock);
 	for (struct rb_node *nd = rb_first_cached(&session->machines.guests); nd; nd = rb_next(nd)) {
 		struct machine *pos = rb_entry(nd, struct machine, rb_node);
 
 		ret += machine__fprintf(pos, fp);
 	}
+	up_read(&session->machines.lock);
 	return ret;
 }
 
@@ -4181,16 +4183,18 @@ int perf_session__dsos_hit_all(struct perf_session *session)
 	if (err)
 		return err;
 
+	down_read(&session->machines.lock);
 	for (nd = rb_first_cached(&session->machines.guests); nd;
 	     nd = rb_next(nd)) {
 		struct machine *pos = rb_entry(nd, struct machine, rb_node);
 
 		err = machine__hit_all_dsos(pos);
 		if (err)
-			return err;
+			break;
 	}
+	up_read(&session->machines.lock);
 
-	return 0;
+	return err;
 }
 
 struct perf_env *perf_session__env(struct perf_session *session)
-- 
2.56.1.703.gf848ed807c-goog

