Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514212;
	b=Wwa3E1jdeeTuz9FMqIRT98LyzammLvhKEIoPc7gCynfA6rzokPZrmIBTs8HqJZTBQI3p
	 bsDWYudKlN6+ll/uEz57bP4h/U9tawnZqSthqBKzwaunU1Y6x2ZSb+sgd9n6jzIqIZRc5
	 +tUAbDJsrEeZi029ckqsH+nF8fo/Q7zNYi1kuQOs1dzPWhBoe+NnpNGbyBf92erKX9JbZ
	 5AYO3N2hfz/kt2Er6HeYZh0l1CheWozFioJbASddCNmo8MHm/BtUecWFsqniAWkQLCIr1
	 fZKV7L7s7P0imz2d/VG6pKoxPSbHKrS7U7U1ewZ+AKl7F/RgCO9ZQIYilnfWS5bcLlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
	b=MV9YXklSx9fDVERBp4GLQpm8UeDkddj6bPBJGJ362wFcWf0lwjGEvcDpro1rt2JdHZJQ
	 iwNnDm7C/mxxHUTUumV0ngCAqS0noHaFk4CKSOUcdVzyDi1HahG/n1sAUCijrNaIgThHN
	 lVGJUPxQVtF7SKYSCsvv+Da+rgUpkTSaFMZlWBVE+xZ5hyc4U+KnbMOJg3RVQKInkQ5UM
	 hQ8/KWPVj8Qtyv4SzTyfpf5oGgMCCwLPl+W6ZEcz7UjWiICBg7eHSpP675Hfp6ODJJWjQ
	 NJV9YqVqueKmvUNHFG77qHp3dkMUKD4Pr8LgQZ9RROIyd6texXr/rTcmQHmOQHwgWEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=so+LCR1N;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F15606A321
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F15606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=so+LCR1N
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-366c279b454so931354eec.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514211; x=1793119011; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=so+LCR1NIs6i4djY1Fe3iyYeDVqQnsYgOasX0Dt4rzfBxrJK17X/FxyUiqFvXpJUuC
         lw8scfA1bhkd811TVZqRG/SeG/iBTd1ydYKWhDUxc7GDAO/9rKHunecY26MA26JSFd4X
         HjQlD/z/5jKxWb23S+HpIla9kAkMnTO1gqOwJyi9pzzmCGkSgzfeNbpuTFkhbw2clLJ0
         EUpaTMN4thLwwkKF7mYyjsTV6ANKB8+NdR34fyh3zkwOiVBeXZLsM2t7mhCd0W4yAQKm
         pZNfZSkNQ2yq4/yhP7xRbuls201mlwPQo4Ed9/qEev7kolY2TLzdNlcSwJQGLxO+gP9Q
         Jkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514211; x=1793119011;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=TCmv+/yrt1EdWp+fZqtrUC9BZs0eAPq/6ydz+VRd0ONI5JCDwPMxPlVgHymxLTnt9W
         IIAOHmlO5lgzw137jL3Mk/XvmNbbkom6iGt32nJGi4i75PrL5tQe3UGss9uiVq7teVWb
         78PSC3yhOIic8fHrfCOFIuwp4jS1Px6fWG0dKapy4zRcipkx50Lm3hL0qXJl9OHQblvr
         9TvO34CinEr0bNvtwmiOGwOnokRp2l9V7LEIkgtO6TPgILtHGYhM8BVC1d5PuNQVpNwg
         PMxwp+g3PnZ+L/khW2xDj1KkqM9jbiysFSQ+7/FuP8g1sNVfkF1+ElgrmccsFZEBpeXL
         hBKA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ6FknFKVf2/jjGXE8lImerr2KzYHQl4ynYNCAFoNBp7y0iz4+J1KksanLaTeAn8vsR/Zn@lists.linux.dev
X-Gm-Message-State: AFq9FYK4MhitZfbRnOxK6a6qELHbUSC3p0y98y++aI5NXvE232pHhTgo
	ig0qZzzrb8SpiA3NSviuHUIK6GL6onUHvBmWyL4yEeo+4ZmkxcpbXuKIjKZMkGbnzsw0FVIcfy2
	9hN1jRrNp+A==
X-Received: from dleg9.prod.google.com ([2002:a05:701b:4309:b0:144:c124:514e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4585:20b0:17d:7b45:f91f
 with SMTP id a92af1059eb24-18513b9801amr14365120c88.32.1792514210319; Tue, 20
 Oct 2026 09:36:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:24 -0700
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
Message-ID: <20261020163640.746159-2-irogers@google.com>
Subject: [PATCH v5 01/17] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

_context_unsafe_alias() does not use its parameter 'p', which triggers
-Wunused-parameter when building code that enables -Wextra (such as
tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
Explicitly cast 'p' to void to silence the warning, matching
__assume_ctx_lock() and __assume_shared_ctx_lock().

Reviewed-by: Marco Elver <elver@google.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/compiler-context-analysis.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index 8302ebc2ea8c..024e303188ad 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -243,7 +243,7 @@
  * alias as a function argument).
  */
 #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
-static inline void _context_unsafe_alias(void **p) { }
+static inline void _context_unsafe_alias(void **p) { (void)p; }
 
 /**
  * token_context_lock() - declare an abstract global context lock instance
-- 
2.56.0.212.g129ede20d9-goog

