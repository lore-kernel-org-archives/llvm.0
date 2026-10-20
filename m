Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514252;
	b=ycaNn+KFg0dB3jaRXvgB5nQWZ4E4sb9jRvV1QZB4kJIVVOSpKN0Pz+4Wh6HtQ6ZFvNvo
	 fay//8SwJom+JpWMpESNeT2dgqDrhV9K9vO2iAvymHxX2DbxFQT7ZiwGFMAiG9hs59u4G
	 H1bWX139+yf+ZMkzBsxEmeHeooS85/4X1SMc8frgE6z8aEw+WKX5Eise0U84ihr3hxw2j
	 RP3wRLEiSdQRoT8NyYGf5EX0nzg91zPnQbJqGHjZYMKsFNKNjnDm+GGckpOhb3fYNnQ2y
	 bttqhk04E2Dsze66v5w5ucDjCmyhumTwLuTVianEZeOpVp1O82imS7rpdcR86u8wctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
	b=xE2SBzv0jZjHMnLjgrvJ4OjgFdEznn+uS91L9FYD7YYZPe0I9fa3Lxo1GokMobevFP+M
	 WEqRon50/6WIusWRaq/q+hk0XrqVm0lMiXyc5jDFT05v0t91m6/504OLsik/mbehbOeKm
	 vu29oopFhcBHrsa6rB/0PoOyzsosnUKke+MVgomXN9O14fyHwaAbLOF8USXqtHpOZnyyy
	 IwotOxsVmDTO7oMHaFodRx74HkRxWygdizcilhP9MnJNVw1JZdMksOM2FikbWoRhcJKAH
	 3q/jT6QxWc4ArjGIzKQNLZQx920QsuDsrzXuCN0xCbsukHIu53h2YUm1wKoeytfFy7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kw1LC0Jo;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161C60A5BE8
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2161C60A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kw1LC0Jo
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89ff475a0deso2781055b3a.2
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514251; x=1793119051; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
        b=kw1LC0Jo1aQfbKvVwuxy3kMkyf4zKP2Ig8J6nX9AAHPiimeXNm7H+L63RnXZwI0czQ
         u7lJ+XsrI59O8QfQIwwYdkQXOGcGNUCWcgrfc2IcmIYx5pZLXL5V2Hjr4MWIyE1Aef9/
         3rHz/LhifSIKAZ9YOg641xBqekRT0X+gXHVCTVgjgha3mWG+HWOlrUdEhO9zQRTrxVla
         8wG3rq/wwyBvIkpBRB81cb79WULyahiuxclp8vkmT42QkdZpMETRKPniTIk13mhW33jU
         +ySlUXzc7DHR94vwEl3E37NkdlwUNwuHx8bNFTzfxzddglAj5++yvJaVZePG6FUjB/fm
         fGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514251; x=1793119051;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
        b=m3+P+Gz9l20QTFkvs2oyUerU5wX4t08fq9yi75AD+ZV1dwU4oiovP9vw2QZSzo+HgY
         sS7wJZvFfjjw32YOYZ9CxW88D1ELNWWlXCl51QJdhDb/E+bMY50DlB/DstcFla77Gcv0
         7zwy3TjaKoiZiZ7dNHA11z3N4ISRwnoAQQEacrEi3qoOvpl1P5OBJ1xWwm/x2b0QxZ8M
         5tONygP6dpI6ZCrQ+IC/c66/oZ3L48fvyd/fznOIo02MWnoTjvXOnXvVxAqCr+QlVT3i
         KDDps2BBbFhktX3Y0a41gLR1Tu7kgbp7LeAblZ0NAcLXBaX5CvMe6Nh2RNereN9pMoa4
         kR7g==
X-Forwarded-Encrypted: i=1; AKwUvBwMLQbC+G49ivKW4xI37a4IBxmM6JrTD14PGFfpj5lddibMWw69wdLjnKirVsO1CRKGtz2T@lists.linux.dev
X-Gm-Message-State: AFq9FYI7KhAuYG1Gn9vorh6uXShFKBRzjZpyY+pR52VcBvhhWruKFFg+
	bGSqyR4xDlOd0OsMuAhLTBChlBE9mvkP5iSZGqigqNUkB0L/YydAZrxnLW61YqafvYSA5NSU0rX
	7VhQc7ePZUw==
X-Received: from pfbij10.prod.google.com ([2002:a05:6a00:8cca:b0:89f:a557:42ae])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8893:0:b0:882:6d80:e5ad
 with SMTP id d2e1a72fcca58-8a04b711535mr8300262b3a.9.1792514251065; Tue, 20
 Oct 2026 09:37:31 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:39 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-17-irogers@google.com>
Subject: [PATCH v5 16/17] perf maps: Fix lock inversion in maps__load_first()
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
2.56.0.212.g129ede20d9-goog

