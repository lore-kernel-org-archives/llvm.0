Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700111;
	b=3oUc2qtuwlM9aGAfpaPRCIMYOZd68aRtLhCQAJCwpL2AF3r4X1EhmlDCxgVh9DpqxmLS
	 xa9uFQeKres5aKRzMO8xJbSFZzfgmTljGMxCKHL2zlY9W7ryPy9FlX+p5MTJdjZ7wzqXk
	 HLFI9gwS2QQpQKLOLqvuItHxBZBWGYjtOxz2wtJmPHTljbFnggLhSnwrMiJio1p8+L21H
	 rEQUXFxjCKMKVijadVuk3DSSpVPqE42UAjfjbstWEx7ov7CapuI9dYFciO95GlKaSuWnF
	 vTSUPNmLX8+osMvhejOJXLZDTr2Kegcs2/pocar4CERRS2S+IkZ6uUGeVASO3EzT+zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5OI66hZlzn/cFny6HHofnoLn7Sz3L3IImkQeNPuJ/dA=;
	b=osQWhzYsC7J1Mr9EkFykCLr2p5yQ7aPXe3P6shx1R1as20gtHLd7U8x21kufvH+mkSnU
	 Rg9FV+YyVxQ3x4HQGNJq3onPb+tnLBqMnPs4WlcEFa8NKPBym0J2GO8NqLOv5aHtiSlqo
	 s5uHWS3XVwFrcKngRdenDxGakXKEbiSvY6IGQKET5v1UeOj5YwetI+wj1+Ry99EzF8I4x
	 Y05RBXCiPAeLtq8fspKoMF+KXwcbP5kljD4PglvgeMlvLI+La4QVoZnlYBketz35B3mgW
	 yYIuJ0GeiHornot6ZaVIW9zm1ZJP6fRGb4G5yEyxcKYko4Z+ToG3V4TnVxqNIdN/Nrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=APAWd09X;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9A6606A32D
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 20:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9A6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=APAWd09X
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-17dc865c94cso119545c88.1
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700110; x=1793304910; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OI66hZlzn/cFny6HHofnoLn7Sz3L3IImkQeNPuJ/dA=;
        b=APAWd09X69He+ZZ0Yhfm7dN/G0X6Mn+oI+49iCspbmazuYSmLUirvFzJtkYp1IsZ6N
         NR4lJ5dYw40T5YcpGyhz/0v+Gj21S21+CKJN4FCU+li+vuxM2T+WI+Zb69O0tnO437h1
         r+cxo34YGbGfitbbpo98n87+cdIqku0cU9FAc4zLLabElWlDP3HHm+YV52bs20/CcVxg
         t/fN6X2yOUf4PTKcwBieKcNGItzATHWTkH/uDXmDKA4b9xke1fm+m2scu1Jl++RMNyP/
         Yz0GIS4MSQ4k1kBvJ+taW7DkqBPS25viyFJajzeaXaQRIToGOzzliIMhsEWJ0D9U6x9V
         KIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700110; x=1793304910;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OI66hZlzn/cFny6HHofnoLn7Sz3L3IImkQeNPuJ/dA=;
        b=HHO5iXBjWqCgYOem3iBRV0KMZfFITlax0WGcSIhz1bbh5v4L5mTvvzGCaOCSRlqZEI
         IduDrwr4KDajCXRojWL0aJ5AqRD8cmFfK6bLHFjZ6TRzozD9+kITl5k4AZ744UQLKML+
         azQy6Lz+wLDglMoGY/Lo5s5IMj/NE6u5sO8OIXIJi5WrsMMuoPJsxvw6eeBlTdgHkRPz
         INjBlwQDqbewoCjIecjZqyv0eDIiK3ssqkwowrkGuXwWtFIuaLGecYvEBFmmymwLpA9e
         qK3mDLgcr2tg9nCknpTaxNFUbfMbQaDZrAtDS+hzbTNC/EQKfeGDA1xr8IZAG4lr8xPz
         cP+g==
X-Forwarded-Encrypted: i=1; AKwUvBxz287jzujCipvX/H4pu6EZVfxJrcqXEakjzYl4LvClpcTWDj6T3U4XLmLDoz7LXEb6B+rQ@lists.linux.dev
X-Gm-Message-State: AFq9FYIPtd/RTgkXi7wJTL1Zx5tg3SzkYO3AVYIFItiBueQNrdfO6USt
	z03n1ca7yXhIL1P7/hdA72b6CtCajVnPTCHg/NrMu7r+YHabao5zX2shORHxeg+f/jaQsIvDrnf
	mzm+tia7jjg==
X-Received: from dly18-n1.prod.google.com ([2002:a05:701b:2052:10b0:195:13ae:9fe4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:404:b0:147:8a40:cdf3
 with SMTP id a92af1059eb24-195c5ad11d9mr576470c88.24.1792700109901; Thu, 22
 Oct 2026 13:15:09 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:34 -0700
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
Message-ID: <20261022201453.1717523-2-irogers@google.com>
Subject: [PATCH v8 01/19] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
2.56.0.307.g5fe7bd680c-goog

