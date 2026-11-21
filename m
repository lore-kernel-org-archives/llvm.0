Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244348;
	b=LUJY8pWNQuSCyIS5/khBP6jQlJNSCs1VzXagyf+2XW1xFJoVlYK33H3Eeyg43SOBVISq
	 oSXZ1hWtaXocRLS7TLA8hm4hw1IIKIe4qddSC55rzbe4xpa2mXWLNXdp4nOh3d77WLL9p
	 tr46qx8hmB9m9ej4wu2j7yfxMnXYxVAVKetSoHHCOzfIma5YCtkfsraxsJxDC/IjwpmN5
	 hmn0O5wHDLnnKWR4h/NXqylJ5rQ/UFJxIdMECf5ljQ+DOzIjVYs8twgnZIUSZs/XAONGp
	 Qfkd7d8RXF3ZYjZYCTbzGXqlXWBF/UukwDMS370OE9bJOJMamfXfeAmTjMhe1JVRYhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BRO7iFim5TO3kyhnlqJsKmtRLu5OZtTESX0CvoKHMNc=;
	b=lVFEELj3YW21KA3tbpI2q4l7Kdxba3dq2DvL1t7Z7MIjMm01WuQvXV/NV66SgGcrz+J6
	 gghUjnlhhwuT3f4MYv5o03ZblIuw7cxsPARHMRAZJ0CDCdbGTrIyi2ObwtjgGOHVcsW/Z
	 zB769Bi5HtSxNaZJr+uSRmdWfa+xI/0oFl14HuftaasLKZDAbMa/iOeZKmRGSMPwGQsuG
	 ObJu9wMTNXEzs3lbTMZSF6szxoQO0lRpYqm8R9vMPg/9IAhHBF5jqzVQyVL+XGK/yTDCL
	 UZIteSMaEOwjErBtvWqfsVSs3xdTK7hBohdcmBexWbX9ythUMxtyTpn08MLqJH07/tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="bQ6lX1//";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75132606A33B
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75132606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bQ6lX1//
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so4489885c88.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244348; x=1795849148; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRO7iFim5TO3kyhnlqJsKmtRLu5OZtTESX0CvoKHMNc=;
        b=bQ6lX1//GgcLqaon/t5NJ/axS99K0vrBm1qZOAjlBYou1yvVRhp6LLe8RS3qfUb+HD
         xDEcSf98se6vVQsW762wE5Sl1NcWOhEzk8rWbCSHD+8wWkDZP6YFsCHLLBK0nMjVBo4p
         EvvvdoNbz8UbqnrNyZDNqNnG4Fw8B0MDvDcLBy46N2a9JLux2E+PLK2Z+hHBtCfH6DOI
         R5m3kJdTwBGAbj6XH73wpyuEfV5cvl3oxPY4lKsYa0plqa4la7WUuaXD914UZzhu76dD
         d4dtCt9A4G08wdl/rihwwCUe/sNb8Bf/UjbHKes6+Nuu2bhQvAkLjkAE0O3QWIsJ+Kms
         8kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244348; x=1795849148;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRO7iFim5TO3kyhnlqJsKmtRLu5OZtTESX0CvoKHMNc=;
        b=uNKv349xZUJiGa/VdCxFsVU8h/eBxsO5I8GFY5grhDStk2dEvwa8Tla81K0qA948Hb
         vqSguXvBV6d/+8e2NarIU91qnie92hLbnDpS4qZ4v6X0VDl/CxzgDUqP3hODuBEv/clG
         4PyvkD6i0dVqWGVoytwCEnCiAJpq2D3FshjKXS1AlArLDMjktZosxlNbbPt2aLuhX/x/
         if7Aggt+ahjZ7F27ptvCLjeFkeCwgXkWgeJajyiTvtiQVLBItJgrAUHMzrQrP2Gcmp21
         wyA7e6WFTShBEoFZfKd7PE29pOYnvphxbTDxHFo3XCgRDSjg/x5o+n9t2R5qIxe22PaK
         Aimg==
X-Forwarded-Encrypted: i=1; AL+hErF7vg3a95KZF4uLiv+LoFZi61uLm+ZSHFARBH0PVeogfvoAIO86Pvuls7ZI84E9+o9qhnaU@lists.linux.dev
X-Gm-Message-State: APuU4Z8UuCwBnB5wNaKy3Cecep+beoL+Mkh7byEkIrWawOxHNqzA5kqR
	2LUY2VycW2P3VLerah5mbVWSNGWIrSXBgb0yCuxZzFgLmm1ijxSHmdt+7bmpCN25Sf+fYFLusZt
	WMC8W9dRQHw==
X-Received: from dlam22-n1.prod.google.com ([2002:a05:701b:2096:10b0:1b5:345d:ed30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:b82:b0:163:a197:722d
 with SMTP id a92af1059eb24-1b5567f6a63mr6449552c88.4.1795244347246; Fri, 20
 Nov 2026 22:59:07 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:58 -0800
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
Message-ID: <20261121065813.4143649-10-irogers@google.com>
Subject: [PATCH v15 09/23] perf dsos: Ensure DSOs in auxtrace, machine, and
 symbol are in dsos
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
index 4a3461d79593..02711995f0b6 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -797,6 +797,10 @@ static int machine__process_ksymbol_register(struct machine *machine,
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
index a1ac1cd1d2e7..8dded88c9763 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1078,6 +1078,10 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
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
2.56.1.750.gf70dc682cf-goog

