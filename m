Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418959;
	b=waBD/kGDUiGADXfccsQ+TKB9H+KI+Ds1zkZBxC2/SX0yx/k97ZtO//lToLNyffwI7Y5n
	 IJhiEX58ir/mrYzSiSqdota6kwh/BUp8BI4+2XYKm3/9pKtDXEICSutn8kE4LKlKUi9Ux
	 9j6MRS/nhfZTa1MowGI4aAHfX0KQdutrBnJw3xgtfa40MHMdKoTurtXqf0atKF9K3jfq9
	 hehiM4gidpfvE69GOULIlLQDK6XL4HBvmbsDeBA7iWwIw28okxF43KsjFrUj+dK5WXjef
	 5d1kus3nc99p988wD/8oWKxhy7U9EdtPaJI39kf8B2m+thrIu1M9y4fEhBoAFDYQNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BThgLAwCYM62IaD7/J4pVQR81NefCf95rx1vHpSiBuw=;
	b=QBDYPlrkI/oCLkfIg+RGs9kYa6+WrBq9JBlKLUrRsnFhCOSPfjibQxlLXO1zgsUPHfdE
	 BemUfRqNigh2LS6A060r6MKpVGJaz31QZt9bEfpfm2jHPZNRwIjOZm4Wg+wt8G0HzAUQ4
	 xQEz5DH8qec4a+xWQ/pnFmJjiWY7ewB1BZryKyZpGktmmXPqMoWuUNKFMwZFMNPyptwv9
	 aQJPQ7UTjHR+Q9tbnZsFpQ/j2l8HG1p9BPTzRybWBOghh3qDUaMHqfYuW/nPqKN4kfwuy
	 dt5ALW6heSjbSf1+Q5vnpYlukEOE8rVuXJ8BfpOHt36331JRoInR6BJsDi9ovxdRe/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JeyjnBr2;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1699660A263D
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1699660A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JeyjnBr2
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so7406721c88.0
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418958; x=1795023758; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BThgLAwCYM62IaD7/J4pVQR81NefCf95rx1vHpSiBuw=;
        b=JeyjnBr21kP5ikfDmSkfR3rwqSWMH8RDNlnKRIAhbQFopiEUEO72W7sNM9D/xqEivh
         wguahJVXf33sGin/d4DTpk6jYkVamOVJg9qlg25HTay8GLp/PCrN+PvTzshzcYmlH9d5
         DLbEcd+dRs/FYpO5DjuxNWkW8uRLPDdxXPtKqeZBenxLWJB20FDxHyBJnOoXK2HIDM+P
         LdvSFgq+FAfJWEcRvNJ2RHN3qKExZy/pi3Ib8F7bIergNgc9UCVyHdpODJx2CKlW3Xje
         tHpSFN4ZrNMDwiuUHXOLeURAvBLsyICkUJvxzHvMXyoKgTt3ssX/gK8HaI4/sy+oJgrl
         zVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418958; x=1795023758;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BThgLAwCYM62IaD7/J4pVQR81NefCf95rx1vHpSiBuw=;
        b=bxV3CmpghzU3D3h6F3cDe+rB7436Ve0mfNeKjStC3iaRx/d7/AW/kLiBmgPMavmgbO
         WAXwHweYXpnCEWaHcQycdEAFmnI9h8DY0oPoB9qY0obqr8PTRGXUOxSC7Qw5SHqOL3/c
         NrgWNN/pwZJp6DhzjQj+Wd8vSTXq266r3hDP66enlaCx8tcHa3I7AU2/OQAxmePCNb9f
         e7tFrA1AWE6f5RhB0C9OeawMZL5LniDF6uJTRLxIUT5gSmkPore6pZtkLHYZbJWr1vLB
         jwiJtlbIlmOnGzxrFK9FffgnYdu87a/DY0WmK0ocVCFGEiYZ3HSu/EcN18iEtzneJk0W
         hJWQ==
X-Forwarded-Encrypted: i=1; AL+hErEVSiOly0haAWBMr4yq1VQldn76vayHRcLKAJ4OJ0GghcoRTq+CUe1LyvkPWa9Uh4FmTcKl@lists.linux.dev
X-Gm-Message-State: APuU4Z+5LclBnGCjmRPhzlLFfLYYQ9joxRz0+EobL4wn6M/sDwWk3yC6
	cBsGkjlhGQjVbk0rM52enwKGra6Z5cBiARC+YDaXEaLRieaHMh4HKlT6w8KqCMzvcyrHw+626B5
	n9aejjbb52w==
X-Received: from dlbvv12.prod.google.com ([2002:a05:7022:5f0c:b0:1b3:b6c4:6fd4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f0b:b0:192:e5a8:6bae
 with SMTP id a92af1059eb24-1b3c034e292mr2541364c88.40.1794418957839; Wed, 11
 Nov 2026 09:42:37 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:01 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-10-irogers@google.com>
Subject: [PATCH v12 09/20] perf dsos: Ensure DSOs in auxtrace, machine, and
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
index 0334cb01349a..3dbce812c234 100644
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
2.56.0.542.g3ef89b7020-goog

