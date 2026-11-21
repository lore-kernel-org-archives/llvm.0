Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244316;
	b=3bX+D6bj4SA8XmHtK3kQhL0uLlNuzzp4TCevkr0j1VYDIu1z95xX8xWPtyyPTvuBbXAN
	 dnkBM1vNeXKMUWYIFL/22wyaZ5O4kxD5mOrFCAhlefwrQkYnHKC6dXx5G0SyBRL9c7429
	 eKLvNmrx504EUanj+12Xz4B5Cdyq1cPi3cYdaTGdRrMO0/Z2RAU4pOWVTpUBDjRqWQpcR
	 QRVcykPWq1abh8F+QVnFr1BPzwqet2OKfvhGozVq/FfVCGkoNnd2aiRPSrBLkEBLBRBtk
	 qbD259+y9XGNoH4+qimf91dMLetK8qnlj15zyyOIBnoDiyBkZ0yejJYjNj6qLfW0kww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WFQYbBMhFIDNWh8RpPfdlWzTylnEhajA5E05wFXNi1k=;
	b=Mk97MMbjT5nhhKZ8dz2UCoz2Gf3Hbb2IVJE8pqFps4f4qWX3Rbz9VTiu8pXVoyR0gLrM
	 IqdURgKCWQq7ebSEcSDjwaalQJPUjgw5sKBJn15J+mkss9JfRSAHLCHn6ZEAquwkjMI77
	 gQkh0xduy3K2AJ73x6Q9iJjLjxEqq3D6gVJB5tgYF0mttCEVzHBZcnrXgqI5VARrYk7oj
	 SmdJ1r9yZrb9w0ZKvehFn1zcK7wX0ZBNwZ0DgbyOtFnLX7XmpotYsOg7lRgP3Y6sU2aVG
	 wGshfTo1+u3CehhkLaK4yZ6B24vDGFDv7anvPia3UtkKZLQGxw0BfX6AMapaMh6fvmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JLq5rD3h;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33035606A339
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33035606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JLq5rD3h
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b597558c4cso2143092b6e.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244315; x=1795849115; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFQYbBMhFIDNWh8RpPfdlWzTylnEhajA5E05wFXNi1k=;
        b=JLq5rD3hZ1ElimdVMxCIsX3AKwzr3XbpcD+Gi+as2lB8U8GFxIDCLp4/BCYN05VJpD
         dshBoh1qOG+Jbm0c13IsdJbjAnw2SW/BE3EldB9s1n2YsEGE25RHZqA1wzpryKX9+lSl
         kyV/2hWuoF1HgV8IZkzHma/Rb4K0HB5hm5Yb9TmIaOX+NwS52gszWi1HyPTy7qCrnqIk
         Tpa4EX2yOefbzct/yXYb+ntEO3tmTIaLOdLA3Sm08yoQwiLM0V5Nyqz3uYC4cLDPAkT5
         fT3YSEh3xNnIiqS9onhAcIxZkIb3oaB8cKO77/6kZBZPcRRndTlIVz+NBbrvbfCUrR4R
         oTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244315; x=1795849115;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFQYbBMhFIDNWh8RpPfdlWzTylnEhajA5E05wFXNi1k=;
        b=tdT+6OVADC6g/Yi6hq+sG1C9Vavs0f6Fk0bMkiLXLCW5mNGBo7GFdnFN5MG/lF1OA4
         Qgsk5eUWUtHTWlkWnrEtEqTz3Fdsw8HmVw+lAQczLU6oCt7te9x4etnciEeXfvWmdbdA
         6Plz4zmVrqVx2LUcl/qDxniUrhpUR3nQNoDvgteJk6VqgnEI9LCOm/7zrlDOZkVSjVPt
         02HExcmNjzc5ssTSjaHNpZAOU1CH6ZYPIp9H4B3ppsJsdRKS+x/F+ORxKTzmuBLct+QH
         redx7qz9n9jfWQPHrAPyiAyDsDUoBYMaCeb89q8/nDU2CnZuJU6FXEpfSL895upIyHy0
         6QyA==
X-Forwarded-Encrypted: i=1; AL+hErHbKFrV9qsD52NIYHD/dNMQZ3qrXwfdksVoccKXHXksVLih8SBYQHOQ5Cvlqo9cw+T/1BFj@lists.linux.dev
X-Gm-Message-State: APuU4Z8bWX1ygCRT7UAn9Sn3DSEjBp7Y+PzADwTyNbFDCrWCgqilc3da
	oB7GcWWrjdFppImSczncx6SVETqw9xmNPXC0bREoQ3rY0reELzl1GHmwEVRIt0TRxe3A99Jm+6Q
	abEqX1QjuOA==
X-Received: from oibmo2-n1.prod.google.com ([2002:a05:6809:702:10b0:579:7e19:d2e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1314:b0:572:75e6:1cf3
 with SMTP id 5614622812f47-57a0b3464fcmr6263252b6e.35.1795244314813; Fri, 20
 Nov 2026 22:58:34 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:50 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-2-irogers@google.com>
Subject: [PATCH v15 01/23] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
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
2.56.1.750.gf70dc682cf-goog

