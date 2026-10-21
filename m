Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622405;
	b=B43HPzV5ugKkE6c48Fd/P+SGzfenumq/dpfFYMyasa35PAO1cEwl/Xr9Gl2MIo5AEOwV
	 ackXBXNmLRTSpuWNOgGmuVxbGZNEqptpW0H0K15UqNYhwEekUIAZkkRfSkfwq9ee2EmtM
	 AEzuy5mKUlbLrcK9of9Y5w2OX3/XtplYAMQy4kyvYRv0df/62CSOj11xuLQ7oRBhuU97Y
	 tkUxM+XPF3qtl6v4G3rl+NXAZpTm1A4g+e85s8fldOsJqLBBk+k7swhMXoGEUFUX2gqJA
	 1E3WHTFBTmY2MKdFJWxl0u+fla6reTery8rgizdpFEo0oPS67DpI4sE5GIKs40gkvGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4N6lG/9faT9ECF/bBopwnnQUqKUgvyQE1Rye5tZt4hw=;
	b=RSYF4cqY7veLBYwB+V5udLQlIGmXXDiXrHhfyA/QpCFl4ADxv2718vpUn0wz4aFOW5zO
	 L2/7NtKWG3kIoM2EpF0MCZQjjv+/GkKrBt9MC/Ik6C6lWvoecUI8OgzU960PXmUx6k0ED
	 WznSzkQQI50VYjGYiO+TJ1sFeV8gUG3QaMT5mbirimYzHvaf1fEaWrEjuKqY9QB8aXUcE
	 dP9cTVXrrLbX/O9Na4mRI19e8tqNOQOCG0ylP1c1lmEVq7EzoOLRejo6ZYRuLfYMy2ULj
	 0a+X7m7JqmV9CJhs31E6kQn/6JgA9+mi918T5IIyNQNUhLahJuAiZIRajGj9EL86n0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=in5fndNa;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042BD606A330
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 042BD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=in5fndNa
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18b5ee75447so4599006c88.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622404; x=1793227204; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N6lG/9faT9ECF/bBopwnnQUqKUgvyQE1Rye5tZt4hw=;
        b=in5fndNaaZFCZAArAcdCeFE5RU8Ds79BUAfIPQq9tLIbzcTEJLrNsws5WzpPFgj/oI
         NQ73YjU/ejXixslwrTJ53M1H11oYIXCulrwq6sEEOorX6DlqZtgN6m5XjhWSvZ67tVzT
         4/+WxUzW1+ZV6uAFsYJeNfu22xLI4Zz6IpFk6QvtGSFouUcNo0+YyDKn/hKZXFbx3CJu
         1WcAmCmkIL+JXZ3Q/niUA2MEZt/eGbDmL0cqr7KyU4nWcPyZW2yG1HpH912ZD6ahTZJz
         tH8cacQ6x9471Z7hTYLQIUecDIuPG39BCUhxzQE6Ug1bXxNAq30+V13tcwNAG283ZoQu
         njWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622404; x=1793227204;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4N6lG/9faT9ECF/bBopwnnQUqKUgvyQE1Rye5tZt4hw=;
        b=UEpAO5UY1kjpjCRvDGpvgbO338X3ggR24C2oL+wTC85yDO/P1TnGBLXmmqXhibeXUE
         6dysc6WOglU2zPNOOY7KBz2UNbpZpTiuF9Je4rOFW1sQnnlHtgNpJW37GB/tpJ67OBdO
         sq+N04hQdbTPz5s+v57hjt2xAGxOmIULXHDlFrV6NakDXHzr5aar/PHGgRBxCi+m4BEU
         biPAoWj8Ok1ewPMQoRJ/ne0EVyR8CaatCGqQDa9JUtdWfalp1ioHXEknZjcuGbUVnDEf
         J0a4VQ2eyRg3RUAis7Q0P7SOgJKtVopwcGezBRu1dBcGgyQxQUVyXC+AFodf0BXJ8Bgt
         co6w==
X-Forwarded-Encrypted: i=1; AKwUvBxU72MiizGB3/gD9kCKN2l8cX3JNbHloYwygnuNQNlJT1EolDyX4Y6dJkt98alxWWb1mR5m@lists.linux.dev
X-Gm-Message-State: AFq9FYLN73Fr+5e4dZ5lqlBU381uSLBNviPfkkUdqL1k8uL5ZodbZrAP
	gpUnyY06Oo3ls1OrsBpc1W4OogjVY9IE41KwoHuyiEt4YNP8afNBZsBSU86+gNPmx0SK+nGDJ5V
	spFjQivMvZQ==
X-Received: from dlbsn13.prod.google.com ([2002:a05:7022:b90d:b0:14f:4204:735e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:5f08:b0:177:9a5b:a89
 with SMTP id a92af1059eb24-190a67fe0d1mr3720865c88.29.1792622403745; Wed, 21
 Oct 2026 15:40:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:39:04 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-17-irogers@google.com>
Subject: [PATCH v7 16/17] perf maps: Fix lock inversion in maps__load_first()
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
before indexing and removing the entry, and remove from maps_by_name
before calling map__put(maps_by_address[address_idx]) so that callers
such as maps__remove_maps() that pass maps_by_address[i] as map do not
use a freed handle in maps__by_name_index() under REFCNT_CHECKING.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..e947506c60a5 100644
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
@@ -548,20 +549,27 @@ static void __maps__remove(struct maps *maps, struct map *map)
 
 	/* Slide later mappings over the one to remove */
 	address_idx = maps__by_address_index(maps, map);
-	map__put(maps_by_address[address_idx]);
-	memmove(&maps_by_address[address_idx],
-		&maps_by_address[address_idx + 1],
-		(nr_maps - address_idx - 1) * sizeof(*maps_by_address));
+	if (address_idx >= nr_maps)
+		return;
 
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
 
+	map__put(maps_by_address[address_idx]);
+	memmove(&maps_by_address[address_idx],
+		&maps_by_address[address_idx + 1],
+		(nr_maps - address_idx - 1) * sizeof(*maps_by_address));
+
 	--RC_CHK_ACCESS(maps)->nr_maps;
 }
 
@@ -1459,10 +1467,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
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

