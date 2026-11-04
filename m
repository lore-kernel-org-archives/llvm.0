Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825978;
	b=BZWwM1hx1lpo9QMlEStDDW7WbJbVjKw9m22T8Zm9sS/yb2JHaXl4o3bYs69BbW1dl9KT
	 WKYzBp22sPcyabo4FksdzfYrK/29fGMfO12PJbvrjxafebqXWYDWM9HUJC6tTvXKhvlvp
	 nL6Kgawx2fdrwchoChqNzKqWkAdlwDEFIW1uBYwfHp5orvwCHauERu4sYPsJPL07s0PW7
	 rg0ovlQVlkgrJxCM+tghfhMxZwKkTy+eMX629wtbkZgw9FvnTvj0TC+3l2lc6/0R3Duy1
	 6QgfKo3927IIuWdUMHixkp6VVUtw36KJ8YVu2Nny36vgNZGuh2Ii/xeoa7RUhEHpuwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
	b=hgeusIiRUqAmLVvqndBQWFKQoS/n0M3WylzrXcIm3RV7glip1LIjksN+AwEy5JSPxHc1
	 lNsDsb7cjfXN/P8l7jwRYPH7DiUSIwhJ6GvyG3/bz+r3B4gcgGs6zXABYvf/2BfTn4neG
	 UMc5zUMvxxkxC6au2iwK09ODNuFaI+OyVcXyupMgxq+SXjG4nbUu/fxkMJvVefnkpmAbZ
	 K4sfeV/m9MnosW3Ynh3K1E+7zbSqvlbJIROTiNvA2YF090DKPGpQ/9e40i5glRoh/4tD8
	 3LQrdvM/r2bN/dmNoLXX/z97cJTg3TCHo4c1Wg8u0J3X6NsXEkMhsYqscyOqJuhpEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aUHxJI9A;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9A609ED64
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D9A609ED64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aUHxJI9A
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08904845so15660105ad.3
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825977; x=1794430777; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
        b=aUHxJI9AzmnpHhuOPIHvHLNe015o27zQncKleRsj50/maoVttkwZ5FP55MZo5Sg9Mq
         xBVLm3G4Rujs101pWQaZEd8rYRQTdokuUNNI39ZrmWa2AyktlZTlXv+lo7Kd5wbul/l0
         I1YGQ6n8IJ/GHGx9ElH99+SuLu4j+Twkl1cmq0PPmgTiw7Wdpu8sj/XD2VLu6CXeqjZs
         TDaHgXcK90QqYL/XnKDvFEAI1MNYZqRuAcXkbTuXIt0QcC8aT7z/4k0VAt3Pul4lHAM1
         lW7CnXH+6bGRWfcNRlTXqzsV/YGcHi01wDDGBduKk7IFkf6pyP4dvaOeMB6N1QCdGqwD
         qyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825977; x=1794430777;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
        b=2rJ7uW+c+iXjTD4pi+2YkcQnRmbTzRmV51u9Xf4gYJNTfsBR9QFlhK21tdw5QUFTWU
         /JPta9a2k5XuImECrUzEyak5Li8+nLAtI3loG5A/2gArkJWxLKjVUsb9z3pRGx5LGia/
         JWgaIGX7/ZJQNCbX0UdbscaHHjjTL02O9DhuOFX/2PlVt+58a0cdIYChaGZRE9vHHpNr
         uRQjBfyHSG1pi2TWTnNwoWvouA0U5JyCgFbvXJpuN8V7ASOLX40Zcnfz9uElNa74X0jn
         dK9FE+snAuMbm2etdtDNOudNm04eM6xqDAD6Zv+a7La77U67h6bB21U6IjXQV02gjH4c
         140w==
X-Forwarded-Encrypted: i=1; AKwUvBxhEnFJTFqVY5IB1zESiwalkUpYOOb++373XEQUVOWmp3XSnl49RHatwhyAsR3CeZ4V2muo@lists.linux.dev
X-Gm-Message-State: APuU4Z/QuAPgdB4a7Eoo/QsQlPeUv7HMz3fQlx4yp874U9oxus4H0Ikg
	zWIZsS1z0H7EFy6mstcJz+yUNYOacVEIDhv79DfAlsxeTIOIdtuCr9pbzmQfS3xLefSI1k3VT5o
	+/x+8U5tVxQ==
X-Received: from plbbi9.prod.google.com ([2002:a17:902:bf09:b0:2e8:31af:11b0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c6c:b0:2e9:73db:3c78
 with SMTP id d9443c01a7336-2eb3649bef0mr161018445ad.17.1793825977087; Wed, 04
 Nov 2026 12:59:37 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:59 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-10-irogers@google.com>
Subject: [PATCH v9 09/19] perf dsos: Ensure DSOs in auxtrace, machine, and
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

