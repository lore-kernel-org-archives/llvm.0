Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941382;
	b=WDuEO7g89sTnwpNFaWyyrBly9ginLlAGuBO2A74ugplmWOYtgCzo32izOwI6Nwe8ai//
	 9D9HxeaM2HYnMUM2+3yu6xduvEr/YYjYjF+rc7AQ+NHNIumRmGR/683uhXs4AIz6KeSgK
	 I32RRzSJCTMRLDtvdtFFeUrXvpalH2gCfGEC3csflDGkxPTjPzRFgbCWkk5ZWfmj8nRjh
	 h2KqUis4UiaUBBoTgZRFiENkD+IgVmrBpgsLI6NKMs5ayLjLZQ1quAfPnp1LToZcIfhDR
	 GLMAm8KIpjQSyh+o0jcsO//CauQnamQAubx8KjHGTfiy+VKm2c9oxqdKgWA13BnLhtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cIns1XYte8UDzFFuNR3YrTGqD06ckSGcPH9S6KlBvtI=;
	b=C8YFfreuzf/4TIxE7dE9QrV3SjQrYR31LqcPKYBygcYS4wQePVguIkpPy8iJGzhPsjRy
	 /dfFnyfxwsZTgv8Xg10Dfir2umqXvC2ul1jeXwHjhlwo8mvQqwrLQ/imshexGrXLgzRKo
	 Qtz/2W6EgZVJ2XumJMAyrd2/+QUgH6rXzjHWJXAFPiB1a3xc2FE0uSQ7AXxtBWtC6u1tW
	 OYFqZtkfq10qlHAoLGAopHsZ+SdmXuIEEElV1pFHYhlb+T8c9YJBvEQpoCcClCemByX9f
	 pCJ4uli25vKOgauMWoNWn4NEhmjN0P+8KG9o5nI38hJlG2EYWeLmwLitvhaJvw23WBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="O4cYz/UD";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6760A2603
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E6760A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O4cYz/UD
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so125483c88.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941382; x=1795546182; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIns1XYte8UDzFFuNR3YrTGqD06ckSGcPH9S6KlBvtI=;
        b=O4cYz/UDNO0ldpUPgPI++s3+DzDyoxoLx2HPUrG3I+8EIqd0aEqkPkogi6s1jOss8j
         K703pnhyJTGuJ5HNLbZjab74iDJtosutfDwY4FnA/W9BpXSnvgXahHBqoZ3mFKtMtrS7
         RMI/fjX5pIAXkvYxXSp2np542Cklqhei0CkCyavJFZBKz+eajAX5Mo1KxGt9r4/ilsm9
         B56wLivBqeE8dqFQ+Jve/aa4X4q580fzsrWoz3n8SwCyCV8P8/BxsoDPCcFii0lJIkaM
         ghqn0jAq+KbPZEt1a1eXXhMAl1l/pqiB5jyMoCJ5LxVlf9FkpPSlw30bfl5n3pl8cGMC
         NgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941382; x=1795546182;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIns1XYte8UDzFFuNR3YrTGqD06ckSGcPH9S6KlBvtI=;
        b=FpyDh0fqswNTG7/iv1DQbgOV8jogdPWv55uLb6tie9tFOnvvY8oAEnWWbgpaR0oBYh
         BkUS7sYluWln1xWL76mxQZnbxl2biFHc3tCW5pKlVTS4Qp4VIUYhDoe/wvmVFimZtMsT
         L9r3YNtoobJlZJZR8cxNEa+jiekZFCau/fasuqu67NY4cfT8sN1a5gAA6FgFlH8f3k8w
         EnHCF2uxLAgqoeMRGwqIDDvw+CCzvyLraY/ihCsJP48k9g3xG0c11IENiHyLM8LwJDmP
         4J5NkFEMw7sAAQPvFxjp8xMTWZ6/dPekWPlTggQoUxOw1hBCmbGuxIfJv3+EOiIL9vU9
         Jn0A==
X-Forwarded-Encrypted: i=1; AL+hErHVI+miIg9vcwzilk6reLI4V8BnIdiDw1F6uU59RgeR9anT+KyMu07uvUxwpIPUacrcvoiv@lists.linux.dev
X-Gm-Message-State: APuU4Z9vNa4hGoSVNqMKR9b+uSZAKImrtWHN35JEeSCor7a0U2UA4Rmh
	3h9UtliGFjYFcDadUqUnS4eYNU+YvAjp9AQ7Y7VGrxnW+3MVj662fc04W7PqfbY4P61RboU16I8
	LoX3A2Tu0Mw==
X-Received: from dleh20.prod.google.com ([2002:a05:701b:4354:b0:1b3:befc:72bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:20ce:20b0:1b3:af3a:e78f
 with SMTP id a92af1059eb24-1b543be37damr377223c88.27.1794941381255; Tue, 17
 Nov 2026 10:49:41 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:40 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-20-irogers@google.com>
Subject: [PATCH v14 19/23] perf maps: Fix lock inversion in maps__load_first()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In maps__load_first(), take a reference to the first map and drop
maps__lock(maps) before calling map__load() to avoid a read-to-write
self-deadlock when loading kernel maps inserts extra trampoline maps.

Fixes: e77b0236cd0c ("perf maps: Add maps__load_first()")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 675fe0223faa..7e863f0f4a4f 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -1460,10 +1460,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
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
2.56.1.703.gf848ed807c-goog

