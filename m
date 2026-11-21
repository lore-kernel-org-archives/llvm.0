Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244388;
	b=fJYyP3GXMrXAQOo5SMgItAw2RzeXvGmpEXhFnPlXKHwP4cN6QiwFUszG6qPDp9xdqI8P
	 ag5aa0NU57rOdU1CUQFG6rYWM75F5TyMYqOTbckZ5IDS/j1lbublz0uJgdD4u8h3s051a
	 RPxXuBTcUFTG/Dh/inlaH0gR0h3P6bXghn73becL6w4tUbLDBL3LPULJUM6Uijz7SgtQ7
	 oIzZKRsD875EsQoWtbAKRd+YJBTw3SYzZcvJ1Nd6WxQz8h2J3VIZvP7R6rEMn3swgAI4C
	 DHuW7oL8w2695JeXsZaOPmftEu5oxgGBiWnkRUgftEuPGUMkilJmlolgeMQqtAYRULw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cLjyqIXGGO5RGSsrQlBRevLtl/DbtsbRFRS5XPatqE8=;
	b=g8JCYKHqWVlCin4lIvqIfR47cSfznxqy2Ikz7cCqy8Yhmj/hQVirVO0BoKtBqeiBPgAr
	 zAUn+obJb2zqYls1VFP3kwFPwL8S0K/+ciwAECPbbTysUyENaTb5SZv1amlojlCGcCEh0
	 2lBJ1E6X4Ruot9tAooObTTKmaxdmGW+VYxnBH4Pk8pRUSljtXrgoBsMpkB7lLi1g8Rzyd
	 DSMW741PvKGDKZsymUzmFAE+2NJ2aSjU5KJzDEdi4rGNJrsM/6FqcB1WwE1gyKaeOY1br
	 ya+Gwj/lMOun1XGq1tfM5bPncf+V4/21M7VLKDZNkLRPiq97J6FtAMk9zmPfsWhzbHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EorFRFgf;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD11606A691
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD11606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EorFRFgf
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b5b49cabso1543341c88.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244387; x=1795849187; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLjyqIXGGO5RGSsrQlBRevLtl/DbtsbRFRS5XPatqE8=;
        b=EorFRFgfR9abG/aBcdhmlYgtmtrAEdY5KDVgivh6rCnBv+ALXJGHXO8gQg0qLqk2Ta
         TXjeJ/TKJZjFmmSoC7vLtRREUgPth7AM3N2esQWJNL9Di3vGttTJoGgrvB6sZxfqVJyG
         ylvHRpdK2qoFAKCaZ9gpIZrAtknIBGUDp3UtRfxV1PfUc8dIeluiHDsF1QfhbmjXcjVv
         o6WG3O0Wmw3vtTjQQUOhzx912+SCJ6mkdIX3SeumJejHyQHyWigb3n9JTztEyRv3N2ir
         fo9K7pZv0xmJvIh3ERdpxev/OQ8YPJQROgB/IKeWxcMKdYWUi1fkqib6HIj7qr4Mq5sU
         u/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244387; x=1795849187;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLjyqIXGGO5RGSsrQlBRevLtl/DbtsbRFRS5XPatqE8=;
        b=duB6jdH+FGbDy30vmigXF/oNXjeWtrWvVCPLocLueJSEx0u8gC3b6XZ5yxk0MhWN69
         Mko7BDhxQfF21RrzNZAyN0EDQSl+zBxQtt3otnxjk8JvKXnYEU+A4j6ruSmAKOrq2kAW
         mciKI7mY4TfCc0D3Cp4KBPOf/kqDXwWR9FkNPfWW6VjFyTGZG6+bHFpYn5A8hB5cEqjA
         VASMPLb6EaF+dC/zBoIiGht9fTaZ2lu8O85EjDCOwkshxIZMV5aIbO4bjbgcBZh1gxdg
         eUBsJRwiTtEOvnTEI6iXLOj9CwOyxXF9a9D8HveENnfBVOaQfwnbmWiiJJV4ahXbfV4+
         tHWw==
X-Forwarded-Encrypted: i=1; AL+hErH1S0JXDfYxLJXRDlCBRjlSEbJPO0WcyKzB+mmLpdV+tEsutH/DmHMum8jk1LMpWvWnCiIr@lists.linux.dev
X-Gm-Message-State: APuU4Z98qfYEYe5QbJ3INiJzM+5T+EYmf9bJjrL+FA7WY3x/ownCOKdv
	elUl8GsEQEUmg8FmsQF7gZxG+AAPzgNsl0lt/zvf1yEL9YoWfBbMAFAWrjCxEwZT8SS+77sYEk3
	tzF3OGGPWYg==
X-Received: from dlgw20-n1.prod.google.com ([2002:a05:701a:cc94:10b0:1a0:100d:fd6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a83:b0:184:992:c9ec
 with SMTP id a92af1059eb24-1b55693aaabmr5705849c88.38.1795244386190; Fri, 20
 Nov 2026 22:59:46 -0800 (PST)
Date: Fri, 20 Nov 2026 22:58:11 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-23-irogers@google.com>
Subject: [PATCH v15 22/23] perf machine: Hold machines->lock for remaining
 guests rbtree accesses
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
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
2.56.1.750.gf70dc682cf-goog

