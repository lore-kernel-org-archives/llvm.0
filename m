Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825968;
	b=XnfCC9PNnZqPLvuL3ijCClPX5WEyI0f4fJ64xNxznq3KxPVhsp/yiECDS8+fqHbkmjGD
	 IhSXOd1vLRjMXhCRQwFaAKv7GxhU12S4tWdz5LpxwVGadfGp/GDVYdrXvcJ2koPsJMEmj
	 WBO1ztKi+yUzmrFbFtbYbMWiQG9oVFYf5L/YPVQ1v2Cc2PzmM5+O6Vhu0auqi1F/eiAnJ
	 +OdKgD+D2Zsrewu9AhT/d26rRNLzOyhNUXoJZ4MeM/FyzOqtbym2WZqW3+3x4IJ4sg2p2
	 9qIYJHR5bPD1OqLwJsDRS31t0qk8xxQHu1RRh/B5an855bjVy3glxM9maDxi/RicDdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
	b=SC/+Nw9O1nCrkBeoAwOY3UVuwN6andxHCyhn4Fyy9wNYyYD2N0wdSnF414qdtaAR53x7
	 9psw2V94f0hyqE/1UWWaZG1OomuUHcxMW3N33BTDFoQz1FmAesvGO8NK2SRfWxxAfTGvV
	 qKHB1A8fEnZFXv9j5rjPeD+t52Jw8BijeCq1wTDlTlI2KxUtObc2/hQHapBtV6EJJrsSV
	 hMiiU4Ss1F8nhpKq2QzvYnvSTe+doOQPbT6ydcPeZsZpPQUSqiaKyictjlDHPBDuUjw3C
	 FsFGFp+8rE8PuYHQfcZP59kE3ggGKWi1HrIDZyCbDRgF0XNiPaqGyXLjM8sGsMXzbQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g1d9x6EN;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7D609DCA3
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD7D609DCA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g1d9x6EN
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so3893660eec.1
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825967; x=1794430767; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=g1d9x6ENlLS1iCLoXDUJMCQznF+KgDQb8jXTfpl6OTlM+FVJ/yai7a8Z6AstQu7woG
         1+qAe6k0myEog67E/YI3z6H9J4StKDgTlG54SCLhO/vQL4+2uIhXIgBcBxiDQxWNYsGG
         fU/kUJpHRpeBWhBUt3bTKzjazlmkcg+rnXGMlPcGPArhpvvQi0fNRArKcPjp261u6dUV
         EN7oc+53DVH/b7Cvpr17PI97dUvaH+jv3grV5UWBmwCT5QbDQRT2TRSGF8QsqCWDORG1
         REvi2sD026FizhxC4uLB6W2Q2S+J8FnarwE1c/qbpfUASbXoV71Jm4hSIPMg1LRCP7vS
         OhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825967; x=1794430767;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=z/qPWooItvyhf0qbJeuXGiDqn0S1pKutRy09n8FV5ZYhyfWr3XSt8a6x1TEVk+6kYM
         lPe35MpetRMR9rhG/f5XyZ4+KVVtiyX0WiWE/GUCV08CFwPNgNcH8m5D9EBL3kHSxq2H
         9Iy6NpPIvrz4vePnPB2V4Wq91DcWfr1xuG0NCqmUCMcq7x67huifbtn6kDZoJx6t2YO9
         LWYubrLg0wu6TIjKoCYyWkUtYzEAKWK+1IspEWVqMUnkPdQXG3d2HDfPFb+j7UqcXMMD
         E2i4WfrEZQhKFGcJzf0aOBeBACxzVIPIiNAQhisAtDIMTPbK4iXOHbAyFZil7BnfgoLz
         23ug==
X-Forwarded-Encrypted: i=1; AKwUvBx5wgemjdPXxmQkROAcDeBgc2ONQDrOEvlxqbgfIn/Y2/xN99FJFIbSmOfZRmVKcoon9tPp@lists.linux.dev
X-Gm-Message-State: APuU4Z+ppXmcHf5K3r4XSpvfCa5LFCfw9O8K36QZo8OnawCP1MCKwbLo
	1wfxGC5UCeMKAPpqLmDSJDqOzN4af3DwMsa5ruvb8l2vhH+bq6wef5P/y805W5h/wgsjR7HlTX0
	l+RVzyoYlJQ==
X-Received: from dyad10.prod.google.com ([2002:a05:693c:834a:b0:369:a832:e377])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6312:b0:36a:1709:458
 with SMTP id 5a478bee46e88-36a423cce1fmr29129144eec.27.1793825966833; Wed, 04
 Nov 2026 12:59:26 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:55 -0800
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
Message-ID: <20261104205909.2078411-6-irogers@google.com>
Subject: [PATCH v9 05/19] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3eb8d095cda0..b50702bac53c 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.455.g6c5a503b38-goog

