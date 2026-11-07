Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026486;
	b=mDjDtiJEbnI2DmJDPd10U/9zjcZzkCCgWOUtChccTd6OMWpI9tT4YN/m4MxPpTgyK/NS
	 L4Fc8MrJ+mmprccP/lBJZ+6EtX6Sb07j4DIJC/U7BVcZqcOGJdf6eWB9hwozxBWITIomY
	 ZoFT77Ud2I9x/5nWuJ58BbVZb1hrUdnxaeHx/HqrN2s7yUoVJmufRJH/0cAp3vnuxJomp
	 +BGLktJirJjHmDZ5XXqIqu5hdLIOmqO8vYfAKeQIXzgX+LYyzK5mZHuEDu2SNc+YEDMQk
	 /5/KRxv9uonnKwZx6hCv/iWb3H1wLmpsT0NMBIUrP5hY8jWSiHnOEgFcgvXJaSkIj5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
	b=hvVEuu7rr4XVpZdTQzkcaTCJJGQzCJpdYL27Fj1E4b4oVA2LLybUz1SdAZc6oZFrUbGh
	 AMSEbLGcrcYgtkBS01F1G3+ClqOM17wmDVwmxipahZKNTNjckIhRiTGEnPFtplBY8JHuZ
	 6jWN/GtNOjesaQeK44NXzZM/qKPFBwihtPOP1NCjRWVyqXgcEY3cEiVtWY9nL7QplQZSr
	 ONU5wYoRKAVj1WdhLz0l7+53OMy+V7uQp+7BJcDAKbKoAUPJHh3h1J9W06YI7hz5QkLFF
	 o3SucAKlpneaE3JoZ4vRWUlNl/CNeuLcxF4BEX6VlQtWGkXRY4aJs22dOKsgKbvWO1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PGKU9AeT;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40085606D805
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40085606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PGKU9AeT
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2447676eec.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026485; x=1794631285; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
        b=PGKU9AeTR/ITgDU3HyqU5VaGTlStgFFObeSd4q/r6t7PHpLmBnm72+yzXbfiCiiKEV
         Stl1wNDZgs/00PKO5dSUc4igadAaiAmx5sMGsG3sL526mrOg1l2C4/NRUs+uFl9zrurI
         tI5+t5O5ZzcUPNzvCXQwMbBpGAY2cwVKxxqini8pDVanTsROWgr0WWF7lIFV0LleSAZz
         dszyoC2Q3LfG8JFSH2ofvdi4P5PvLi7xXzJBw5FO/EBhCpJ4wfORL4UN9URhM4veUDb0
         9BjRS17/OIE4iRQKkpb+l+C0L5q5uMU+w8fSvQv5kC1633KEKXgCuzZ6vpysjog4Q048
         5ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026485; x=1794631285;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
        b=ckwpKhaWaD4VyyhxsRiYnieVyIMWnf0UgHnAFt3KpJY7vyzgFDK0XzgLvcN3Td0K2Y
         HPVHWbO3gRwKuyAtjsMzsi7lvOC04i//MV4rL7nC1SPlUDSbwSUYNt0VMTi7xmHqH2zz
         KZq2NW3qDV/m4mU68wKKYl1EzxaEliTgRjCzqZtF5oaS50BTYG4AKvlYI++Vw5uJ/7vz
         wdOnDaKbNEGdCmzUxc49mZp8VWFbqC0VoBB3lUt0E3ciyptejHbuivhD9gvxzw/6PVqo
         5vn6yPGhABQUmakGLaIg24FbVMtEX1B+SpDcMTNUCZ3Rbdg6VjuCpknP5n3Lt9HNyDRE
         T6JQ==
X-Forwarded-Encrypted: i=1; AL+hErECnQRhwqxqvuvdUt+V+fCSO/N9LUD4iQVxvJtKGOSwGBLwxEQ3IkNz+FsHxLE819c0yD1V@lists.linux.dev
X-Gm-Message-State: APuU4Z/f1yZSj14jbMkiEum/pML8o2Z3FJjE/16uQQTOBK4OsGcEA37K
	OImATjw0rodFi4TjeQd/cY2Ii3nSlQI66ptt0bO8YR9jTCE2HW81PB9kireRHiZ45PGk1QCDsJ5
	U40OGC/yDJA==
X-Received: from dycnm20.prod.google.com ([2002:a05:7300:d194:b0:369:7ef0:57b0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2585:b0:36e:fa91:b6e3
 with SMTP id 5a478bee46e88-36f75838d8amr5926963eec.17.1794026485167; Fri, 06
 Nov 2026 20:41:25 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:50 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-10-irogers@google.com>
Subject: [PATCH v11 09/20] perf dsos: Ensure DSOs in auxtrace, machine, and
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

