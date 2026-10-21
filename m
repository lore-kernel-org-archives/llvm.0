Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622355;
	b=Jjbd1U3CJaGP8thgTpwk4xCKqQHftECe6UbvjeNpgDYyLlGYnyN2Ln4lJLqw+Kb8qfLS
	 /LCqocP1pLn8Rjs6iJCg/ZhZLdNfCeLpXbEgUy2yDOt/cALrEQ9zhNj30dru8pZccfooA
	 HcbMAjI7iS4KKFG8/6/bma+xu45FQNv3gj3CEdExOq1g1osI5c/y+DyRshkswc3cbgXJ5
	 lBtwNI4G6UyPNvbfx1ayFeJmCQnXout0wdBgNU6VvhwuYasAhum0XApYqHhhJYpd75oef
	 mqc88JZVSv/F7sjfwM8Jg6h9DJpwDEegtRJJrfk14N+5EgVThwaYk5EYkTQTFw/diyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
	b=WfTS3GU4FqC/IfBQFVnk20pw4LowqSupdEg8ZWXidAEPCTNYvbvkd9czkL59TZnQy7jB
	 o64c4b+ttbSVFIyljNFN6Ytjj9WSE6+FFM3VZ5OX6Kie7EUmPt210PYiC12mkNXZQ55xd
	 9tyXdTAFrm3tIlpOCPJ9Mkst6ZR1VwZmhVbfeQ8gAhWITo12ilyeG2LmScKHppbjRSNzE
	 rXlY6t6E2bADo9l/yAvxzXHZqiljS0RorJ6khPNAIOhxqcgww5+rk38+B2i7+5X0FdvAN
	 Y/bOEQVAAM8RNCdImfbq9r6lTz1uGWFAgTOmMcVDw5sN+3YqaN/BNrD2YcpB8zQRerA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vSiuQstG;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E502F606A326
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E502F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vSiuQstG
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so4850844eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622354; x=1793227154; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
        b=vSiuQstGytPN47lD6Mg96kUaQzZXlN3erA7SmuuxVhgFklnWkEnrcQofV9iszUYXkG
         YKXrWRyNFgJkDdioNq6q87Ukb1p0Z7mdZGXkMXmyqf6qnyufKHZqTWF7FRBrvr8B9Ly4
         YhY2eSgBKjqzIPRjp3NUzWaXwKkxQiDWco9w/C1IXURr2KGpdM/EB5ZpxKebxC2lKeTc
         6UZinbZH8XzunfKkN+XX7HX8Kclt0GclFoII8JoryK1vDiPL78fex8xBjMCyEdt/zyIA
         GPNusPknu79KvCyejYUzBKfI/ZHRtxuW7pWzLGx9FEIHURy92axt021RoE/AgX8UYSHx
         Yq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622354; x=1793227154;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
        b=0ht6YSz0gJxKYytniWVW3pxHNueYse/NKbXrjSG4uC6Dy7Vco7zr/01S3GlJi7klB1
         yuku+4Aum2uyzMsu3EQPo3ClCqEZU3rY31IQV6HogoIb+jlM0/NYRiyqVQFVhAs7Ophf
         rp2XSk+d3v+oJ7DzxdECCdBzoHU/9F+Q38dA8YX4Y/D0knsvRt8paDWIeWEMtEb17H5M
         vp/KaIiRr+rdXoZsS7tY8cg+gTcHDTwzf+/UXCQeoSZTPDWctHG3UQwXkGQhhqgLC/ce
         eNlewNcleYRPh1lq9eaK0m8E4VCRgJQUSPA0dMueWlXV1fo6j+vUMsXyFDrDYEicr81d
         Cwng==
X-Forwarded-Encrypted: i=1; AKwUvBzIgu1fWQaOzbmIH5wGA4RYUcS9iXkVXxHsIUrB/5e1sGarCY/FZOiU6XwF9sKddEPVI5NZ@lists.linux.dev
X-Gm-Message-State: AFq9FYLFAKOFJS7JemUWGEutqUwo+5LwMRdzNEPT/G1V6Jraagji1qxh
	p8iJ25ATvbeDUfToYUOCyUYGGnNP5SUvEPf9OVP88ilLe0avQ3asO71k3gsdOKN4QB2s//ybPbu
	E5lMjF+wBFQ==
X-Received: from dlbur22-n2.prod.google.com ([2002:a05:7022:ea56:20b0:191:1417:6caa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:d0d:b0:168:3243:c911
 with SMTP id a92af1059eb24-190a6dbcf54mr4906912c88.37.1792622353590; Wed, 21
 Oct 2026 15:39:13 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:49 -0700
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
Message-ID: <20261021223905.715051-2-irogers@google.com>
Subject: [PATCH v7 01/17] compiler-context-analysis: Avoid unused parameter
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

