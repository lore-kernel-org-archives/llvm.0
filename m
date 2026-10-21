Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602659;
	b=mOrPELRliljDpzBDUGZOrlaindU0D1RgkkQPabyTZb7JzdfYq6+pZPK0xgWjzQxR7wl2
	 ska1cwnRbz7rqHuX0OZ2pusDXnBJL/mvkopukSkOhAell7rvMHOy7UtFdCufnYYtgvO3Q
	 9gNs+IeRK5T24/pMGNW3nBZEfd7EC7L7tG4xT/YF0YHgHuFPnmq61s1uv1yzW0M6mb11E
	 5QhVlK3gFom4JbTTzvvIKfaQM4Rs+FOLl32bepu3X688ng9OjFR0QbDmGe4kgX+OTr/2c
	 nNtefIXW35vhVBwDc652VQBXk7IbQKmcirQlrEPdq23hll2MnR+7ytIdvZj/4q4Cywg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
	b=cnLB1A1D9BB3kSL3vmKxvTohLZWX0amhXAEkO/kyJcm/eaBsl8dcky6mFuOQNrrnoogI
	 QmRIt/MiPf1DWN2O56EeS5p6jWfH3+GstuxePG+JCnP/0uRYGpscXm79+sSmWBOUU+Ujs
	 9281e3zR90Bw9YfpllybQR1mdfJXzURN0whAqvrOq42mvZKXgAtkOYYzFQFNiPHAWLZ0l
	 XzB9O4tRnuE46a1GxYJ7oQ29sbgDsZPIYw/inRvP756PBoj0DvIZ4L8kYS4zmCyhG+oQa
	 s4LXlDqc1BJWT/RrxLzbsnUr5zJ7Z76bwOGVZxRveJK+3dkxCfMSuMO8YZsXvan8Tng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZOsR+Dfh;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D12606A323
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D12606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZOsR+Dfh
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so388481a12.3
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602659; x=1793207459; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
        b=ZOsR+DfhXIViQ3QG9FhvD6kwstn9vxwOgOy5syuQzkUvM6Mc+pHmNN+empT/tCGt0P
         rExJ4hC4bf+KsSo1InFuEso9K/hkHQiinqHqUhQkBBtZbiq4K7oMdhpGqwz3sE3BA0oT
         h3LkA6Z5VWygcGC5bhzQq48Akr5gjI6E9u/YXks8hgq9YpOkUmkbQRDAS8jjnHF3M/H3
         KszJ0EhbuoMC/dTYgyrMSVspzWbd3LxFM0YfU22gqF8mp9CexnfyE9PFFV7cZMeq3KUq
         luzwgP0Oy1OBwjhsZYfdIcUg5IFG9PbslJPAPsxjv6XbyeF6kLWmGr1eW1vijClz4zAb
         n3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602659; x=1793207459;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
        b=uUBW3NpXUB8OS/qL75MOIv1VrOo9++X61sCPQ6CJHtnNAvSbhrf4ZeU5FBIeHnreer
         3Ki66jZPi9pINvfM6yrHkpb5S9GFZvcZH0mDVxDAUDsrd/eKtdxqm0lwEr/HcRs3kXd7
         RrbpOAqIK0xsYiOs0Eh4u6cmazQCkPR57R82/ZyFpJa/Xd6PTnerl0VJjnSDr0SN5Pp+
         +/lS8prXyCT0O9KvDRuOS1nMfdxK5obLKJCrOt++YiAGZO9frpfgOGcFCRggnUyh5W+q
         n9szLaSUOUB+7DMMbWQRYTrDeJKIaC/QU1AcOFEMpS3OpYG3u5T5ToWB3fbwCfpZ/EK+
         1oQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx71LBsF57Nu9hlvC0nS4Cs8oYWPNAr21ORpsnATNM/7mnSRkdWtqZwD492oxXepPOpi42L@lists.linux.dev
X-Gm-Message-State: AFq9FYI32ToptiQiOg+t/+NoP7BpqNUDU/ZZ10W68ERGma/mJLH4CmQ1
	uE1lLBm8EVtFWvanULwf95PCScpwwNmqifa3QA9qOWaqqQcGfzZlICBDbOd/Pwav41xf1VVKsOi
	uy6rBd1omjQ==
X-Received: from pjboj12.prod.google.com ([2002:a17:90b:4d8c:b0:3a8:645b:da8e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b90:b0:3ac:c03a:38ad
 with SMTP id 98e67ed59e1d1-3ad86c00fa4mr2544214a91.5.1792602658534; Wed, 21
 Oct 2026 10:10:58 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:27 -0700
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
Message-ID: <20261021171044.155240-2-irogers@google.com>
Subject: [PATCH v6 01/17] compiler-context-analysis: Avoid unused parameter
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
2.56.0.218.g1ec904b173-goog

