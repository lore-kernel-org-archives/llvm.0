Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418941;
	b=WB/OvHDJf8FLCCe//HlQUMtTvlqpoOrqgjQGcocEa4Xrs/41g/r+/iRbArg6Iaioda6s
	 F4n3rDgaT4nw2C+2qDcczd9TS+ZKcjt8se0OgQzc1W0IRIzm2l6FPyh/mIgBmmylH/mlO
	 RgddusZIB0yDhXvsf2AqFEPU8hbKZvO2/938vLQHJCcMvxJfJQgYV6D9TMg1cYCNdfLR+
	 q1vz7bbD5frA2A7VoaakAf8JmMVYWsy2X4pDc9Rjn6TgeiyrrcZW8GIsuN5j2k2b0Esy3
	 at3aWUo7bkRfxPOkN8c8zUmyb0axXWB/ZC30JEQvth2wHlC5cAn/KtZ54cGB/DsM1sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zDRXRDkvAvadJBp5vb4+ZdZF5QkdvjyK1sAy//1KamI=;
	b=GMfWvHnHclBTdwm71aFroKlaINUIJKA6qegjjWg5ANcw2/jzbXQ7xiHEnvfX7ZrAZ1os
	 B2ltNCEiBDsoYFWyi4gax8ngURH67n9jsg5LbHOBXKSg+oS9/9YeqYmPsqTIbwB+EquX3
	 0jP5F8Yol2eOo9r1RlvrAKPWduxcWFlXpuEtpf6j9fHOH8J5LwsDIqzb3uijHshL9GB+W
	 /c6HX9ucvPt0ltUQfs4ywSp+lP7ky7B6x73dk2rdO5EvEjiptfPSzl65/cT1Rnn52A3Xw
	 l9hTZDCehZrS1iywBwa4wxzDBPHR5kiVlH4tIPPnS9oZuBd5oEMuVBLJs7wMLe85d3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LFrOz8in;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C759606A335
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C759606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LFrOz8in
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so41508eec.1
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418941; x=1795023741; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDRXRDkvAvadJBp5vb4+ZdZF5QkdvjyK1sAy//1KamI=;
        b=LFrOz8in99xtVL2k5I5oX8Pgox0kXxxReaqc5KO04N3aj0o08TbaRjmI6en6rloYo7
         9L/zIUZ1xFquxOCHE4JUhZbxdTMILVU3g1xq7HV+wYXsyua1kzlOTsSOvgw37B+2WOW3
         ShAeSHA+rBgkaE3+oR+X1ynM+NRTOk+Yv0l7io+4x82rGHBNGn18wFluJQrhgFmoR160
         ZAsqOA3GUEus6qfD+JDo4H+JDMd/WufNyvI7pVJ1Ad8XK+xssl0cY4bvaazrWzqrTKDu
         YhKzJGVmbN70HQ/SxL3QYiZ1JadYTyopnKKsydl+09c/ncRubRXbikpgMdx16AS5yTq9
         eQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418941; x=1795023741;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDRXRDkvAvadJBp5vb4+ZdZF5QkdvjyK1sAy//1KamI=;
        b=BeUP3qtApCB6UNEyMXLsnaDIeyzrhzY2mAhp3lBLVt2fhWbOXejhm514p1xBaJP22Y
         Xl13XaUzcN0t8O+FWIOf3C6ouYvljg/O27H1JKg4CbNio6k3CBG9D6mXXF3N9q9sqrQ9
         0H0Tx0nbKu1ru323NlkhDWOnD7PEx+qRUz3Az05gkOSUIM+UVdW0PrlP9EHX+M/aptsf
         VWzgnOG+49MtDQkPsYX2bvPdqFHg3MKpbTvSvU1jT67L0g5bvc49QqS7Ww2pDL8jbY/b
         5Hr/PXK2/6gkGKt++iCN0ZTpnT5i3z8uh3dNdsWBvSt9+zIkgqRbDRt1Yi73fGkJiwyZ
         FqIg==
X-Forwarded-Encrypted: i=1; AL+hErFJ8DE24cW5ycSDXEyJhnO/RZgwV8hBmdc0Kie8MRhudS93IxADLuOOZ6qyQ1u6eevFBjeT@lists.linux.dev
X-Gm-Message-State: APuU4Z83ig9PdhHRFBD2hugoOfHa/ct46fEKPVAK417ozng/ek4XFuQ1
	l2ucHQ2JMvGU9+qlH6fgpwveL/6pSoOcEtxDndami2eYfBoHyPQw/VAV2SiW+bLK0VomFgjLUeU
	PuCOz42hKGg==
X-Received: from dyboe15.prod.google.com ([2002:a05:7301:3d0f:b0:36a:184b:374c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7fa6:b0:36d:38e0:79f3
 with SMTP id 5a478bee46e88-377e1af812emr141935eec.25.1794418940056; Wed, 11
 Nov 2026 09:42:20 -0800 (PST)
Date: Wed, 11 Nov 2026 09:41:53 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-2-irogers@google.com>
Subject: [PATCH v12 01/20] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.542.g3ef89b7020-goog

