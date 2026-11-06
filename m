Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948651;
	b=OoFRI2dyZt440czJbKTOaRhbm9a6OFkhoPHje0nsVTle7W0fIOp7CyYAAB2H65P5G3Hs
	 LXijf3pIh3NMMr87NLG5+K3NzsODgr/TYAt3XazwW1nyLA9X9xFzxVuErjhzxIHVYAx2H
	 R/h4Qlf6rzR4gDwRo4+LfFucDblhK75BlQ42qABI6cvuSq7iKxYLv/p6/AInLvqkDlVHo
	 opG9ieC1VB0YEltT2xTgTrEZRVJ54XBxYlaChOA1BTNiZgSoIsRENgvG6RWt/JG6uauTZ
	 cu/D8eGp/ShuWuuaCx+VdqTbnw7RCFt6mBZ0fB26/7s89rfydglHkolM8qaETEZl0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
	b=0LIGJUFAVJ/TAPS3a+PMn1u2h0dBL03jBk2MUzRZ2iKg1E3FFEOmH/7cFEA3dgmc2y/4
	 5JECrTD3W6C6pOJgb4495RLGi+xhVt7kPngTbua0lzIW/GfRmBBOlY1JCbRrXlZr9/Fs0
	 mhjSvsuctbdi6Tl44UjrU1DmDkr/bRkJjaRaXimYbmtBHfmdvkjWiP7BJuJEz0nz/4vyN
	 5TKDwmSBdLzOQLI9RfZD9h8kEZpgKeIj7AP/8fSwGBHmzv9iTb7GIP6u8YU2PZHLmj3yN
	 BlfGxPK1eEpOWoTQz/vTJsObK3d05PaF6XN2ItScGT/gNBGTckXIA8/7sxmED07BBdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G0bYhtiN;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B211D606A339
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B211D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G0bYhtiN
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so179709c88.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948650; x=1794553450; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
        b=G0bYhtiNl/Nh3oS3QmfCHJghsmw2D7WTpd0wJwCtSZW2rgU0W3+ho/Fx29xuNpmopS
         uymIXt7pTazf8bre864de4Yw2cQODvHiSmZKaxU4Jr7oTEwcPeu8Tjb3t7CXQ9dpbqFk
         qyFsIJqt+r5DKtcpKR37Arb0fdOUiiP4I1rvZao82bKqHXM+JVdkNo4p3KfARYwEyXRU
         1x429fSVvAIHQkQi3vOnL782hC0wFLohvcV8tGPNZ+wjFCtxSbgMAJA7r3A1ATMexenQ
         7AhezbVleH3/4v9Rm6e6DFG2LxAXzEjeabFom52mBk9iITwPvw1y0HC1sNWhvOrnCgwS
         b2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948650; x=1794553450;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
        b=s659duypI3opdIV4Ejsiz+zu3LM2Qu2cQgpXXdSFdBsvO/o32fzHYb16yVct7rNEO4
         vuafeUubxm7pa7LfLCxUCnuS1KkKiIufWhlDHOYGsSn/71fya3A058XAzLqN6Ve4Zcw8
         RXOoM9BSaG52AX65L2Z7oCBv+GSdufS/XrEqJcf+/9y8J6pjDNR5IQBBc02xk1hFRmtO
         gS4S5R1NbM9LlQEA/vSzXzmN3RhAO1U0mmLqAXehGRV1UoimbqSOWMV7gKnoThcbq9B5
         HGNFfueIx/n4zYdHtkl7E+5a2shRzu5/fwAWXy/HTuSs++60jLFPEZiBRMA6gPcANtNQ
         WjoA==
X-Forwarded-Encrypted: i=1; AKwUvBxHH0nR+USRUbLqbxXvwu85FSlGgnFMOKXdW629mlNZff9I1Nn2eMS04VmL450gJ1GgBIZ3@lists.linux.dev
X-Gm-Message-State: APuU4Z+MqzpRZBq2mmJF5d3qM3gLSZieRxvkL7l0uKwQLv5FBGE+LIBP
	QFU57rf9mpw1gCyTetejqF9s2woiPY+N1u20s7gin3UiOan7YX0FbH1cI/7E1mZ/4TjtzqNrHfs
	1pghsf/QKnA==
X-Received: from dldz2-n2.prod.google.com ([2002:a05:701b:4182:20b0:1ac:2245:a27b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:260d:b0:1b2:459d:331f
 with SMTP id a92af1059eb24-1b24f4d01b2mr5780989c88.16.1793948649455; Thu, 05
 Nov 2026 23:04:09 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:33 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-10-irogers@google.com>
Subject: [PATCH v10 09/20] perf dsos: Ensure DSOs in auxtrace, machine, and
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
index b958c6935a56..0044ea046aca 100644
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
2.56.0.455.g6c5a503b38-goog

