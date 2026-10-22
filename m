Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700157;
	b=z1bSbnzCX+1hto0VBfTq5dSDJQ0hTCgDbR/3cjiDN/2SbRmC6gkl4V8uf//OgzWfoGy2
	 6H4YD5YC2J9VU5QJTZR9Og5sBsjaRG/Y83inM92KA1e9ftaRpJD/2n7EznQtnHZZMSO0w
	 TwXINNww+HZ21rz++y6df1551xQjWtcCQCUnswVOJbC641SS8/CnSXnWO9vhq4cXlJiDK
	 EqXCTom/FtjZ3vSzJRP7zwo37HzXiNTsfnz3QcfJvDB3459UI7Iauss2XHev3Mcfj0b91
	 caAeAQzHgHtp/l9A841AAoLwc4w25EF5n/3XuWE4tz6cxc7zAqLyWeoGVlKxrj0vWjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=m93d6ML738qvEiSSbh/02KAktLjyqMoz7nlZaRp5/fY=;
	b=SHzCygKIrSmBEs8vH8Bo9orFvKcTAXkCmT6+uIBPspChrNDm/mlji9fR1mI5bREXMhhz
	 8kMj/+ljmaXZdyYuIloWqKHWdiN2tigN3YIimmqUDqEbqoglCbrR0ErfdOU2kiivdaMWz
	 0qxsqvfgOWd4AtGJNPpa6S0K2NC1cdtS5bcC2DOoBa0xGoStHmxNYxEbHe1pO1yKZDcQo
	 p/7mQyL+C0jrqft0ycRfF283T24Ri7SepYQUw2NZfFNDGzQxax39Zv6DKfgRfH2g4UU+9
	 jtyUu18roCY9RzU1A+SAJUHpAmKs6cwC+fpfV+ZMsrIViq6DP89CSRX4J8LJ9Hgw7nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XUhQpbD7;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2852C60A5BE3
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 20:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2852C60A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XUhQpbD7
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso312971c88.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700155; x=1793304955; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m93d6ML738qvEiSSbh/02KAktLjyqMoz7nlZaRp5/fY=;
        b=XUhQpbD7Z4hHj0k5YNtkA6BWRKY/9jkpFCFgVQbUriNlDlJ7nbGrKmBkLX2+Setcc8
         rG22gv+lUhL9pyKXc/cgTr2D1H1qRJDmmc5vLOu/RwClx3hvcH9Mv+HfTXW3xqpXOfpI
         csw49cVtmDgEjQxs7EhupgzBjdnEYPmn2zy8qSFJFJhoG1ecpaVGGluoyybz9o5KdCye
         zFuZMtAS0YcMv2irrbxKU8AXdxoYg+NDq1Sedl6EPq4B3xjFHnyPUNckoEARo64Z+SEj
         JlEOSEH2XapEXlAZcdOhiLStRlxlkg7CQlQgk7GOuWen+abMmeI7Y1joffmmvBNFS4kD
         JQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700155; x=1793304955;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m93d6ML738qvEiSSbh/02KAktLjyqMoz7nlZaRp5/fY=;
        b=1RVWpHmxCjju8WGfV+DebpAXzkIjrXdyBExkfB4owssYXU8A+ZivYbSxkDDMBZsvma
         01IKkHf/xZFl39bY055rqqR6QjRMZbW1Z3YW0OPVoTfUrXOMiLF4FYQ+gxnFbv4tZhsi
         Kp/JrQpmZP1ujDpoWqH1H3vLAP7S0dO3WBOPIYme67QyqxIY4F52xPpm2gt2vs26iTjw
         Qr4RuyFlP/lcNNcFf+0SkVC535tceTl1vwPr19qGzRDFkKBFC6zJMj+ormuukxlsCNRD
         ukr5QfjXDEGOzRGlwuiMdOK6+o6FFo786IfAEbsVoI3SvNwAuozOxsg/iZXtCC8dRPMW
         jOEA==
X-Forwarded-Encrypted: i=1; AKwUvBzGeHTwlI0B6VydZ/r7DhOlrFgNj21G1m9kYbZMkRPhdqdPWEHeqUUqIkaRWoWvuIPehwjc@lists.linux.dev
X-Gm-Message-State: AFq9FYLljcoKkSetdOpERsYq7YO0gA1zcpW1w9aVMN+p5iNNoa5mN2tH
	mNh9VL2iHScPEUvrY19HMpagyfnBU+2UAGwRfPMkTxGjE8lY64dP35w75G/zgnBktFJWoPGMQwU
	Ju4vil/9hKg==
X-Received: from dleb10-n2.prod.google.com ([2002:a05:701b:424a:20b0:18a:a95d:606c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4186:10b0:194:23e7:b526
 with SMTP id a92af1059eb24-195c77a8247mr373925c88.27.1792700155131; Thu, 22
 Oct 2026 13:15:55 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:51 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-19-irogers@google.com>
Subject: [PATCH v8 18/19] perf maps: Fix lock inversion in maps__load_first()
 and bounds check in __maps__remove()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
2.56.0.307.g5fe7bd680c-goog

