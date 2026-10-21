Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602739;
	b=ALuODMtjPp//zRHoEgwWYMXww+24FyJbE7cIFIkVqTISESOybWsDDpo3b/vfQz8mB8I3
	 fpkT3fzLZBS7WPq2XwnSpnA1woaS/CD+HXBoQsKK1fdv4ZD/50jEaqEC9yQ7a5zx4CGXg
	 l6kgseByS65MKVRlNVbNy7L9D+meoBOi6KaSsr5pxxkTc4F0MkId3CRbBsEIy0T4Oe0dO
	 cZRNw+yA0HRDjdln5LKN3PWdOYeMBhWig1500LuemwPYVDzF2fxRXiaoIF8Z+vf5Mifr9
	 WSUQq8T+6vdwEq2PU/L8sACepyg14fX7Ze8w4mayE02JQCCQtqVxOp9LJPImcIUdIrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=va0jPRyzS9qJUXCbRxN41MmkIP1NzQbKCEMrTZrHPo0=;
	b=3/9XOg9wq7bhG/CCISlhyM3UsQlh+2c9mHkSk59yNTWxRwGRx9yH0nEmkc04OrLzqVZ9
	 Yu+eBEtRycT6E+yX5uEF1fFCtO03aenSC/Gv9YRDU3V+XHn7EiTBJ5RlG9xdSdiMEiG+f
	 vndXr+BIKPEhgAAc3t//lRHta+4B62OaxnmvPhwovBFH2xaDxHcJgI+i3NByUF3guWyKV
	 myEYMBnAVtHYA12O09j3FCVF9Z4o0cUqa++wYqDmYVuIbT6pIPSkpMKL6DC8cAXr2WUkZ
	 fB4iuMCNulIsTRR78NHgUFZ3mJ4OjcAEZxjt+LWIrSHMGy8kHVt6SCtGBSu9LuBdDMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wF+xwtAR;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31DE60A262A
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31DE60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wF+xwtAR
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1628910eec.0
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602738; x=1793207538; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=va0jPRyzS9qJUXCbRxN41MmkIP1NzQbKCEMrTZrHPo0=;
        b=wF+xwtARe7q9iRXvxJqJi9DPyAs6SFjkQ40b+SNnpoz4tykFGKa5wDObx+CHrHcLr9
         P5n9pJJbDPTgaOUSwxO8xSX68MtXOGV6OfqpxLl4tIN4vYs41jnlwYSHJsujiHEsg+/b
         EthL+NUO9vLzOBo8iAvZs0baq811i96ayQn6kUNGCH2dMETNoe5ryvtpe1z64ZOZO3+U
         jWpa9KoD6V3YbC79hYzoL6/5JQqfPPpdlXMPvMQK2utuX9SkMJtPbNOoXInWM+TSbTz5
         VjG+Ruoq+WyGFyZOs4F+zIYX0ax0s4o6ViaVSAua+S1afZzpJkyxzUBAXqMQ61Uv9rSw
         sIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602738; x=1793207538;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=va0jPRyzS9qJUXCbRxN41MmkIP1NzQbKCEMrTZrHPo0=;
        b=ruXAsScoAzdNfQeP9mA8yle9CDSJpaeNZpw1YAXiG+xH7tr2umGc7k2Vj1nfEbBVPC
         W5k77IcSmKV2nphHZzTaXcqjyeGa0D/l+2muB/3CyyJ0vw9EYOvvJ1aqHihp0w8RrVYB
         lFZ48JQnD52Dz8EVTlvjkp9mtdnQKL43rvbRl7HAEjNtvIDYY8Et5B4MJxAZWu08HR6V
         xl44sTwb3hMe/TCQzyIHjwe0DdKAR3mJllKcMdI7dd8lyArN1ij0PavztuKErMoaJazY
         MJroww3IHmVJwmstvFYRInUiN+frWB/Med60BZORWaCYMCsJl/D8aFt3SkUrg6MrXUiH
         sQfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzRD5ZrQ73ACnv4ATFfnETKbBCCBfYCYT7O4Si7yGlQ7KuAb0e5w91T6HEqX39pvqwEXj9@lists.linux.dev
X-Gm-Message-State: AFq9FYJrrEVkiu5yUITS4UerwtUxT0LfFdatIFmJsdXLFsAT6rZuR/6z
	IcuEeZti2RHH1qKs7o66e/RRBFzlM6kWCRLrfVYMpr39qdex+0RZAdMEHxCGDbdyNLduG6LU9lO
	L+wfFofxuqw==
X-Received: from dldyr16-n2.prod.google.com ([2002:a05:701b:4510:20b0:191:1e8e:83d3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea48:10b0:14d:ef19:246f
 with SMTP id a92af1059eb24-190a7756c63mr3346132c88.45.1792602737568; Wed, 21
 Oct 2026 10:12:17 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:42 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-17-irogers@google.com>
Subject: [PATCH v6 16/17] perf maps: Fix lock inversion in maps__load_first()
 and bounds check in __maps__remove()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In maps__load_first(), take a reference to the first map and drop
maps__lock(maps) before calling map__load() to avoid a read-to-write
self-deadlock when loading kernel maps inserts extra trampoline maps.

In __maps__remove(), check that the index returned by
maps__by_address_index() and maps__by_name_index() is within nr_maps
before indexing and removing the entry, in case a concurrent thread
already removed the map.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..acaf93c7c206 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
 #include <stdlib.h>
+#include <string.h>
 #include <linux/zalloc.h>
 #include "debug.h"
 #include "dso.h"
@@ -548,6 +549,8 @@ static void __maps__remove(struct maps *maps, struct map *map)
 
 	/* Slide later mappings over the one to remove */
 	address_idx = maps__by_address_index(maps, map);
+	if (address_idx >= nr_maps)
+		return;
 	map__put(maps_by_address[address_idx]);
 	memmove(&maps_by_address[address_idx],
 		&maps_by_address[address_idx + 1],
@@ -556,10 +559,14 @@ static void __maps__remove(struct maps *maps, struct map *map)
 	if (maps_by_name) {
 		unsigned int name_idx = maps__by_name_index(maps, map);
 
-		map__put(maps_by_name[name_idx]);
-		memmove(&maps_by_name[name_idx],
-			&maps_by_name[name_idx + 1],
-			(nr_maps - name_idx - 1) *  sizeof(*maps_by_name));
+		if (name_idx < nr_maps) {
+			map__put(maps_by_name[name_idx]);
+			memmove(&maps_by_name[name_idx],
+				&maps_by_name[name_idx + 1],
+				(nr_maps - name_idx - 1) * sizeof(*maps_by_name));
+		} else {
+			__maps__free_maps_by_name(maps);
+		}
 	}
 
 	--RC_CHK_ACCESS(maps)->nr_maps;
@@ -1459,10 +1466,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
 void maps__load_first(struct maps *maps)
 {
-	down_read(maps__lock(maps));
+	struct map *first = NULL;
 
+	down_read(maps__lock(maps));
 	if (maps__nr_maps(maps) > 0)
-		map__load(maps__maps_by_address(maps)[0]);
-
+		first = map__get(maps__maps_by_address(maps)[0]);
 	up_read(maps__lock(maps));
+
+	if (first) {
+		map__load(first);
+		map__put(first);
+	}
 }
-- 
2.56.0.218.g1ec904b173-goog

