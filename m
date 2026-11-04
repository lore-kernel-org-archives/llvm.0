Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825958;
	b=BBmLb+VTpBgi6zfuMyuFqlohbDGfSZhiJ3vSvTTOqzNCoVQjuyljVAkd5OE8OTZ7h9Qk
	 +Nawhi5Pdw6LpOPPK8Q/Bje1wBToli1vDxM/jKvvVwAAQB4VL6IgwwT8S/nPCs5cOj9IT
	 Vn/ZH3LTJ+Cq87raoF9SgErkLJ/KpWURNdkN+6Xe9buAt6BrtGanBMxQNWuA0qdTwsTB2
	 /1/UvEEOV7KBRIlZMPnpJAECR5Rc708g4TvZM38n+bG107rmoNCsS4JPQwTaF0tbPBhEj
	 Qwb8nqHwY7nJHH+YgxasdZ5WxyFc2Y+8eepeacGculMpVGKI4WZSuxTmi+VISalWobQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
	b=MMNHioufsKGjrmkCC0+DlpdTxSpGUHo9JbMGFj4Ald6C+2qoOoJphS9xhEuRFJz2XcDN
	 qP2NnM+GgrYq478mrVQ8A+UQBG2MZD/MmKMZ4y+QP4hwjpfAVKDCVEJnmD3btATSHryqw
	 o4CdBYrsFXA1/tYljjlELqzjUV6C/iBrYX5+zM0jW+NUd8PJTaAsRmVxktkPV4y8snwO/
	 7F0cPoXivs3WE66ZKxkGUw8+oCQyj8U1iylpDcCMGoMaEZKmI3iYu66UN9faHuQufZIsi
	 sctJ+0SwjsgONvrzKX7K3VxfEIkcPaCLD6hjfx8XPGLV+SoFII6hSUT35HaSOLls1xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bu+VC74x;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E9609CAEA
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942E9609CAEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bu+VC74x
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso2015116c88.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825957; x=1794430757; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=Bu+VC74xVP+NRImajIaKdNTjh7k0Tb1bcc/O4Eu8Pco9LTNPGRcX/waWzymWnQV0NI
         JzOlUGVzOi/21qSoT2qFQmj4MaDxR9eDiz4wBvvzcwh5EgVOU0Rv60gV3wEYPhPqXfFU
         0Vy+0E8FXWvD4FoYXftLDQj1OTg72TLanBj9S4dbW10OLb5PI8Keo5HXgg2v2STiHY4m
         lpWF72soehdV3C6NldUVU0aS1NHKJdVn+/9In+6XkB/F3XqGw2dHgViY3B/t1qH2GaTn
         C5FHXm0c808AGFmpHPOaswz4s2yNo3fCOK4G+71IyYkCs4MCgCYDqi6FJjqQq09K0HT3
         CMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825957; x=1794430757;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=v0t4cMs/j0garSfEWRAbOQrLgQ1/h+4KtMoOY3+0S9p6b6e4XWqr1p/tyC1Bh0G8zc
         ay17CkAKFv7qbKzrdLfHA+4RqEo9X0qbSxzYFSY9XXTgxJU1x0RIGC44qpmG9tAO7URy
         P7a6ck2hUhmVky5stw2O9ogZLA9k8HhiWqN1EpXpsTgxGxk8ZAOBcMV2JPH66Bca21/T
         UwkAoCK+ZGHj6KpI9pLPtVXr3FR730x5Mk0w8IjS2HtpqKG5ng8FeHalh/8VWAkAksz5
         hOnkWWc7kUHIbmUs0QZFHq8Ki0mQXluTjoPUNczjsUfolA0GKaQ3UfikvhI398pTps6y
         6a3Q==
X-Forwarded-Encrypted: i=1; AKwUvByT8y50AlWAzD9VMldtLXtUwZigwwNmW4A+9GbtFa34NmhKm8w1dpAUczeen8rkM7Vq5RJy@lists.linux.dev
X-Gm-Message-State: APuU4Z+NvWmZg5WzkF9u8f+zfnQeLm1jiVd57CJssGm8VwsuASN0Hg1J
	GHHb9eV8ZW7nlrtB00Q7htf0dJQ0FdIrN8Vw0JKyJZu7EG8HB1EdZSne0Cf1OPXC2k+owscM4QG
	viRFOC+s/6Q==
X-Received: from dlbsj3.prod.google.com ([2002:a05:7022:f903:b0:1b0:4179:ee7b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:5f15:b0:16a:f5cd:365
 with SMTP id a92af1059eb24-1b009604eb1mr18474520c88.5.1793825956090; Wed, 04
 Nov 2026 12:59:16 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:51 -0800
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
Message-ID: <20261104205909.2078411-2-irogers@google.com>
Subject: [PATCH v9 01/19] compiler-context-analysis: Avoid unused parameter
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

