Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826002;
	b=tNeNBIQOLCzqnVTt5PFU3PovUO//g/aQYZq3/yPaRGzKRkiVg3LpEHjXLjVii4bw+Uy5
	 omvlpAsnePcj6GeXmSnIsdqzJq43VYpFU/9fXpc3xGImVMDDLvacZTLqUr0KJtGX+/dVd
	 gMbmQIP42EfSmMIhAkgeLbAv4SzgbdTmEmia7CmN72qfKjBOd4KmlFkSryGibPZ9IRJCe
	 g5EwgAgyqKY87rjzyxu5F7O/ymKvHMTRFsjnxSCggdhn/Wf1sDqMsMZNPTTmz9tLy5nHP
	 HI6ydBg40XRpq88gP3bZh6gyUtO8SvTCagoG5Mut/rSIzlb0DxzwwnAvgalz2+grprg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rt/D2V0pPqFKKFuRewSMDlrES2za5EAC5J3ia35lEA4=;
	b=4awi8qv9tmPKkS3u+88MsaqaAsBp8Pg18M1FpnLTAIPgpwVzpQOgFKPeGKH2sLE25bGB
	 HP/BnhYIISNMiaO4ffX4PYbVZUtGoOdrfNnunncMhr4+mlLqoQBRdygd81HijCRA7v0an
	 YqMeUSVaq8nZa4+zbcsE1Qi8EozAEgFBd7AA3X7ScTq46DF4DxebDQp80cbkwXFBkWRtr
	 a1qpJNiINxck2/M/hehx08OKvm/AtSgXVTuduVTJICg1INot3xLTatpd0D5PFW+k/C4R9
	 Fr1ZnrAcFFioP+jR3SzeYmc7nWte/Ks3ftv5lLd6aSiViLaIBd2SoCHbTwGdhWNuwVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hQGqX4We;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4D06095059
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 21:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D4D06095059
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hQGqX4We
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso25756eec.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 13:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793826001; x=1794430801; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rt/D2V0pPqFKKFuRewSMDlrES2za5EAC5J3ia35lEA4=;
        b=hQGqX4WevkuJ4q/o16onhXWNU2n1cra1ifqw5CB1ph/cfokQDs9Uoy9MkIQdDuUMiW
         xFj6qU2z+AtgKn1GNrFM5Zq0b4l8b0b3WgGPdV+84Befc6ac6JvayGBYRb479Ca1oVWR
         vh0UgBekCN8/3LWK94p/ypKGpans7o4vWz5oEJ8OzsCk0MGX1CagasM4/QJoGy23qewi
         /XQWeX/AbiEsLl7zrgh203NOULjeuS5guv2qpahGbx2cQ3q/q5anCERB2CYVX9fGfH4A
         fACo7wJZPjub3gEDvNQfxtJMIji9vc94nJEPpQUaMkqcaNkpG0fhwljK/toNOsuXjsDC
         9YRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826001; x=1794430801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rt/D2V0pPqFKKFuRewSMDlrES2za5EAC5J3ia35lEA4=;
        b=rQddWAzM/c70CcQg38FBo/1UvdPR3OaH9yuFO/V08wxIRQ+Oc2FnJccsnyV5s3z5bP
         DfktNg2HFdODePU7jQtwglG94Jrb0mbVeq03Y4yHIXK1j5f3xmnvqKVeVVTBgakfiHvo
         H4E6NHYCYclOEaRAl/wbTH5v37yuLD6Ihc3JAzofKn1rpfnTbrZN2fvjr07e3F6KiMtx
         +JPFP6v1FLdA6zN8eZyl3vMEErmXC7CX+/wOjhueXM8YcYe/kHN19SgyU6/PGYWvkV1M
         A6P6oum3a/qGwaosKAKjN7y+cEMswtROilEyUWrbnGgEoJsJYFstpSirKUtYi1S6dukQ
         tn4g==
X-Forwarded-Encrypted: i=1; AKwUvBzWVBMhBGAa0bzpCpDjyVh/5syoRPR76dou+ywBoVXDs3o53vlQyDtkEg2nVdP2ikUynl+r@lists.linux.dev
X-Gm-Message-State: APuU4Z/WJJcjCneBhKkG9Ks+boKp5ZLs/Y6G1uiqe141qpYVX5AwAm3k
	zibb37s7B3V+ewtT3syKelUU+ljxYnU1nTmmS/PBpxdLINfub0UElmlwrGAtd//Fyh96H9HYxqR
	A+mLxwiUWCQ==
X-Received: from dyay26.prod.google.com ([2002:a05:693c:62da:b0:34d:46b2:7513])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:51c3:b0:36a:37:1404
 with SMTP id 5a478bee46e88-36de576a94fmr767686eec.13.1793826000418; Wed, 04
 Nov 2026 13:00:00 -0800 (PST)
Date: Wed,  4 Nov 2026 12:59:08 -0800
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
Message-ID: <20261104205909.2078411-19-irogers@google.com>
Subject: [PATCH v9 18/19] perf maps: Fix lock inversion in maps__load_first()
 and bounds check in __maps__remove()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.455.g6c5a503b38-goog

