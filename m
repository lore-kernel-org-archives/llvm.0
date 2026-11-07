Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026470;
	b=hADYH0mDkLlOVm+6L88jWJm3RrGiyjCeT0oZb3gZPoISiaoAlvPfHTCM4Aum4GgG2Hy3
	 TxnFuZXGKR6L6iTfT1h8fzJkW48SzAI+ktMNWlXmqQPyej1w0JAEbF1RvCD2rrCT3gMQA
	 LcfvAU0VCAbuh/i0iLHnD7hzZcDfew7AnPC6d/dXfDcxO28uiHh0L9bxfaYFj0VMQ/EV4
	 ZzXrAUcaYxZKxqmsrYyKGjWfNLEuOweJK0IZ6lTkUsSeJrfPJ6RumsJaIeWUIs2kyWgr8
	 KU0j2rzKBtiWdV/RVDVfR0snwATc6X/3RKNuE+IGUwLjwXN6bF/lNycok5ODtB8Ipag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
	b=AIGJKnRu3G+mh0dZLwvg2eKjaeAbdUQvzOO+w3DmDjnu5DA6jJ0fytrYvIXp9VQDxaKy
	 3Z+T2usfFiO5mcmoyECaOrHehfsfFSnHQ8qk9cO/+snpEeIpNiTyhiMCK9XSHPS4w9z3Z
	 2zOIFYVpXv7IUGEboc/fLyk0bFdyTIuN0bUKU5ze9IE5MllObeT5pUBn4RCrgjjTeiOih
	 uJt9wvcta8ObU02ZNmLyo3kx8h848C9XM5T141woxy2TCgdKHhiarpXa4VNJNCu6u4zno
	 Y0ItImshGo+SclKeGj5XcdfvqkW5+BxTMXsOT32zfR2+XABdQiibnfGAHhr1BpGSsUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UieSQCRl;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92312606A338
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92312606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UieSQCRl
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ad9bc6aa91so1596099fac.3
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026469; x=1794631269; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=UieSQCRlWyMR5r8R9Demipl0wJHSODR3wrF/m31S/SQGphJO6Pp25Yfu8KPTM08abs
         57vNLlO8qbX2pb8d90ksf0wEysuqQLPPXxVRSGC+Wr2DxPwElc+zqDUkETq4STad1LxG
         J5w6XToXLJKmCygnRLJgxOA7neYG1oKj67AbWclQwW6m2A5U4l6F86XWnHvUwT9u9Nkq
         G2GRGENYVf2T1lEV51ILNQP+AeUfVIf6Ej/uUO/fEeIZaNOZAcNVfg7/TC7hLOtw1LG+
         MGs3eLKGNIb/RMyNkLVefl8pM3EsgFCeVyHdKQG9MmjSnfQ+Pf/N+t9um82qsFzTQBBK
         U0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026469; x=1794631269;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=n0Ugf6fcbhkLcZjkc/JXeq+p25rUcErwS55J0IU6qlnxTk4ZaQBGhtsrTETHORDz/6
         h56xeT+XUrwvD8dWkzK7Ntd2qJWlxXUM4ChJe6ptp1HSm/03xbObH4I+INMDTyAn7idJ
         ui6o2Y/KnpA8zg0Pu4OV+ytrcya4Jyw9paseQHny+0ZLjgAsjY+tkHV4eUM4IDpHjtWd
         TsxfSO/TqKvzyYAYpTrYYqAu5+rk/QDDaxzGmK54x1CdGL4CVRmRsjdTZ9cndMStF0Qc
         giRho+ifzyb0v8RFB2YSfxvykDCToDeMfh0L1mGBRXKRFUykx9d/pe++2IBlyUjPoVkJ
         IQTg==
X-Forwarded-Encrypted: i=1; AL+hErHds2WE8kBZMG3wBiOfQhvfwf/vGOVh1hMpA6eFgf5YMNPZFkVqrY7df5cYMRLezZHGAn0T@lists.linux.dev
X-Gm-Message-State: APuU4Z/8nqm6e3TsDn+zzL3pqva4w+VBHXNnHBbOejyzp/EE6wGwElh9
	7637wEzff+apGM/SheTA22AeiWeEGR4hyESmAKAVPQg5IiL1YT+/qFh4xrAcZEzbazY9qRMzi4N
	Ce+Zs9Y/kEg==
X-Received: from oaccr15.prod.google.com ([2002:a05:687c:260f:b0:49e:5a8:3cb6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:e710:b0:49d:cc3f:a9e1
 with SMTP id 586e51a60fabf-4ad98c52c81mr2878448fac.45.1794026468092; Fri, 06
 Nov 2026 20:41:08 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:42 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-2-irogers@google.com>
Subject: [PATCH v11 01/20] compiler-context-analysis: Avoid unused parameter
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
2.56.0.455.g6c5a503b38-goog

