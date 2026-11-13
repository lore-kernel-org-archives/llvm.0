Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588139;
	b=J+zdZ6NsSDHLWRveUbY03VzZfLgNfZn428DM0rxVOluu1MxxPbJhao5Dw5N+YDqaB3Lf
	 7vNOX8Ll0bAxEP3NTkYqdcOOT/hqjlU2Aue6X5eGiVrkL1OZsFxBMW+IzDyZAg3DAk1s7
	 E8Ghv+JQfDV4o6IJfyrnpH4cDMUGIt7LstD2t8MQsqfP3qgDGCnQ4dguVJBpjSsR5McNT
	 Zh0vwDwmRJ6QJott7E9DuYCZhYM/R1eR4Ao0NNpm9eNjYdyglY+Shstq2/yUQIx1Di1gJ
	 Z/79foqahJxGf3XMcQZJZdDBo2nn+F2N1co8UxLFN7rIVjrFxNxCknRB+dQFGCdvEUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RfLu9tkRN1kJwRk3/VYq7SNcEmQDBBjwxB6gBcjpGs4=;
	b=IpqLAybb/U4aDo4WmEvswO/HJgZ6WW+MbV6Z4txYPZEo6IqzxQKQMUWVUigwcvKOTn6g
	 7lZ58M60fVh7cygdIcQeh0bZxp92SmQvTpqQNjoYb5edq/9tzmQXiKIzYOBN+5JYr/FsI
	 Z4f5zbD72UrslbztdWoDBgJn3kY3EbI9+am+vocEmJH8MBAZoLtaVo+EjDNEatuBpYit8
	 b3mPDvinzqAwxtbYtw1mrGxeSx5EPOQbdDXwqZIU+ryBoDwAYFT0vzPzLw95/qUUJv12p
	 kqKMa+TURH2/f8kEjz2mjL8HTRaJa8oLvba9t7QBIoOIFYyHvJ4RjjaFS55x2J93H3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lbZnfjt9;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4B60A2609
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD4B60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lbZnfjt9
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so674128eec.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588139; x=1795192939; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RfLu9tkRN1kJwRk3/VYq7SNcEmQDBBjwxB6gBcjpGs4=;
        b=lbZnfjt9nQdvVS6230KnIrWcJgX5HbuVRYwZqRaSyshruTWGlXCPEx/KsTwOg5TN4+
         E8mwV0y8tC256ZR7+AzFYLuji8Rg6MSRpj3ul+9zTwX1YnogfiSIL2vzNZx53+mKzLhL
         Kam9JWKSod73uGHK/LqXZHml0jTAKaokoOKw3pP5bNWcZwASFny1FFmRC1D/D4gjXS1t
         pxWtmepEEo9gpirRUpPdcWaQiCeOckfmb6liKo9Z36a98ZTfYER/kiImBM3CA8iaGyH/
         BDBuvNj3YQtcsFfaNk/CgaPBwI2usO2a7QDmgLg+2/anfO2DNworuc8+HNzmjX7xD98/
         h8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588139; x=1795192939;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfLu9tkRN1kJwRk3/VYq7SNcEmQDBBjwxB6gBcjpGs4=;
        b=JXHyYKK01NcxaXN2DghwZVH0OeEY8Z2t4n445loxHZxfOjwSByRzhMUKmfIcPV3xjd
         kCcX2f623f5CWAVKU+3KlLcXj4+xukN2r/rg/bInyfunz4lLHT7kQDmIvafy3gEGVieJ
         4d+NVlTzzc4AzdxcrqmcRb8NwrYH7f/AED+GMDz4X2a3+KtefbCHSvOgmeCnmnpWOfzW
         ksS88M7AF3UoFO+ciwa+LBTYt3i4NrSD7z9CM6JgpZtOAah0Vy9Zt8ObbBrS3G+dwLZ+
         lh5gQzS7R+EFGMHAZznKh0iD1RS4ldV4sALfWGYEVql5HXEfax29nw5feKcD2PBKZMf1
         CPcw==
X-Forwarded-Encrypted: i=1; AL+hErH6LiVQ0AwS9lxmE9+DBSBHH63R8kti5Q6VeFKU8J9ooFtYD4TJUcb3Nni7c2c3Gq5heatu@lists.linux.dev
X-Gm-Message-State: APuU4Z+sPbgCHNva9zP0cIKbxT6NfoCXaw7+YG9XBnVpEeU8h2WOVvAy
	IzVC1IafIHM2l+lkx5zYyw3ZbyAAGZk3fmD1912qCrQApysjOgsPA7qtG7Lagd9ysNVF28A3uEj
	t7i7ZtgZAKQ==
X-Received: from dlbrc1-n2.prod.google.com ([2002:a05:7022:ea81:20b0:1b2:490b:6fe9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:170a:b0:1b3:b3de:9232
 with SMTP id a92af1059eb24-1b503115668mr2454073c88.9.1794588138437; Fri, 13
 Nov 2026 08:42:18 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:40 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-10-irogers@google.com>
Subject: [PATCH v13 09/21] perf dsos: Ensure DSOs in auxtrace, machine, and
 symbol are in dsos
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Place the DSOs created in addr_filter__resolve_syms(),
machine__process_ksymbol_register(), and maps__split_kallsyms() into a
dsos collection so that all DSOs that may have data fds opened or be
referenced by maps belong to a dsos collection.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/auxtrace.c | 16 +++++++++++++---
 tools/perf/util/machine.c  |  4 ++++
 tools/perf/util/symbol.c   |  4 ++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 8bb491d389a2..1451de019df0 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -29,6 +29,7 @@
 #include "config.h"
 #include "evlist.h"
 #include "dso.h"
+#include "dsos.h"
 #include "map.h"
 #include "pmu.h"
 #include "evsel.h"
@@ -2684,7 +2685,7 @@ static int addr_filter__resolve_kernel_syms(struct addr_filter *filt)
 	return 0;
 }
 
-static struct dso *load_dso(const char *name)
+static struct dso *load_dso(const char *name, struct dsos *dsos)
 {
 	struct map *map;
 	struct dso *dso;
@@ -2693,6 +2694,11 @@ static struct dso *load_dso(const char *name)
 	if (!map)
 		return NULL;
 
+	if (dsos__add(dsos, map__dso(map))) {
+		map__put(map);
+		return NULL;
+	}
+
 	if (map__load(map) < 0)
 		pr_err("File '%s' not found or has no symbols.\n", name);
 
@@ -2794,6 +2800,7 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 {
 	u64 start, size;
 	struct dso *dso;
+	struct dsos dsos;
 	int err = 0;
 
 	if (!filt->sym_from && !filt->sym_to)
@@ -2802,9 +2809,11 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 	if (!filt->filename)
 		return addr_filter__resolve_kernel_syms(filt);
 
-	dso = load_dso(filt->filename);
+	dsos__init(&dsos);
+	dso = load_dso(filt->filename, &dsos);
 	if (!dso) {
 		pr_err("Failed to load symbols from: %s\n", filt->filename);
+		dsos__exit(&dsos);
 		return -EINVAL;
 	}
 
@@ -2831,13 +2840,14 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 
 		err = check_end_after_start(filt, start, size);
 		if (err)
-			return err;
+			goto put_dso;
 
 		filt->size = start + size - filt->addr;
 	}
 
 put_dso:
 	dso__put(dso);
+	dsos__exit(&dsos);
 
 	return err;
 }
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index afb95b64bec4..12bb095aa9a9 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -775,6 +775,10 @@ static int machine__process_ksymbol_register(struct machine *machine,
 			dso__set_long_name(dso, "", false);
 		}
 
+		err = dsos__add(&machine->dsos, dso);
+		if (err)
+			goto out;
+
 		map__set_start(map, event->ksymbol.addr);
 		map__set_end(map, map__start(map) + event->ksymbol.len);
 		err = maps__fixup_overlap_and_insert(machine__kernel_maps(machine), map);
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index b61a574ce9a3..686fc48841c6 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1090,6 +1090,10 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 				dso__set_symtab_type(ndso, DSO_BINARY_TYPE__KALLSYMS);
 			}
 			dso__set_loaded(ndso);
+			if (dsos__add(&machine->dsos, ndso)) {
+				dso__put(ndso);
+				return -1;
+			}
 
 			curr_map = map__new2(pos->start, ndso);
 			if (curr_map == NULL) {
-- 
2.56.1.703.gf848ed807c-goog

