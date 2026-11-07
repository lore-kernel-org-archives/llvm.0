Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026479;
	b=K4lI1gYHw2mi7Acn1CQRNPTu0va9GtdjCwddmv8chmZZtXx56uMp0j6I/Kaee9BbKm1f
	 SmwGi6lcUjupuAJQjWQw2rXxEEwnVr/2QLEgEdAw0ZqHEMqhXBE/j20xnNL8HXMHiO/63
	 5sccbyFLNGo7YqGIFBvF365x0eslHpDymTLFkcS9PvdB1VP0C5pN7/hxFtbJlZWAzgunM
	 lhFsZbPZtljVHSAEMrGtXVAn9+abwCYQxwr7gIQHRy2bb7RHxFAfYlXhS9TkDdZInEXzW
	 NQBMVjEEgYqNOpixbO3OWuySmXiaGJpQlegf2/6o8qpdMatQ2DssCGFgZ1wqFcXvzhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
	b=Yg7wRKkWLoSzlT7xrIscFwuSnjfsvokhygx+B5jw4RmmOHQzYPCDNECQmO/HZU6005NE
	 N1RE5wBMTCrgtJTrK0eHwOS9M7LQIGMWT9pq+V201BrHVUalNztlm/OV/JpHte+Rk5hxF
	 7jwjRt+0oe+BzKMqaHOTnWJR8Vlv75xH+eNPmz/ndP+LSHyyBx6cQDRymX+KVIxm10EDQ
	 3PzBzj+rY84gie0EPLqQ3jPONaJrCJj4gVdx7u7NpMKxyWfRhqFRMEAF2dpEKMWwtIjTs
	 LYfcTRvKlHy3eO7iYxMS+bLI+j6hd3tCQ/+/s6fPTeePyMdk85Y+fzn/jWQjbJyI+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="dh3xyA/Y";
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED31606A339
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED31606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dh3xyA/Y
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-851f720d7afso993354a34.3
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026477; x=1794631277; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=dh3xyA/YJ7aZBy4W4nsmbExKGF1NTQ6j8aqn67DE4pYfPErNWc3SiOOug6hDEEczOj
         /IH58QYj5czK8m9aryBG+iIczdNdh74Osh7wxdIklTQHOIoL4bISb8IlSvibED3X+FDC
         snIysCEtthdb2nb5WhiEu6npIRMEinZxGKdCfoNKzeDlL0ItHLTjgKVx29uKMZLO0jKt
         ocPs/wHk/BZVmYqmOZXN+xn4tOjefIz9+StWmpO2Cvxpcd9OztWOuasImIXX7ykfcFpo
         Mj1Z2tNXmK9Ox57U9EI4ZCJ1zPMXVQuXglapfy4PQLpGpIrJrud8hw9FalOJwWKN8NtR
         wVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026477; x=1794631277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=moYWuZvZOPD85KLIQzA4ro57588naUbFlzDym5MEc7PZHKqlbDPQYlss6mQ3ke2/gl
         gwqDSu3/+OZeM8je6MUfiIEZZjWySry8qZelqn5hWNyj6Qq3WxQhMmG9lLUXB95DWjAs
         eUoSosy33Vmqp2gvTgZQbrtSwfwxZDVfS7AUvb1yzbRO7kz2KIft1ek0B5oTwSLdzpdm
         OhnsA20ybAM9vBEQbNx9k7pFkrdmiJu4w/Z8Xdio8KFW+8c2bAEX6mxQgZw/MmWPBkSu
         9OlLCz/RpNAlBb8iVzYDnqa72nKTOHzCnpLmomvh+vhgnWS0MgfCIFuG0yFMQ1ofhnj+
         42Ow==
X-Forwarded-Encrypted: i=1; AKwUvBw97kVBwG5F8Cxt8WCbEDV914GuxbQazLL4+PJ/jgzgu/alJ9toTqYx+sb72fFLUJFvMsLV@lists.linux.dev
X-Gm-Message-State: APuU4Z+UOuO4OjmsBLf/0UtSGvmg6GIPSIilVhzjKfIKRFII9uPffoTi
	xEQ20nlul4B7akU/MlXwVwyVla9R0ZwQw77kSVYhqxkrhBtVEh23L30OCHaHHE/GU7dW+ZX3+3T
	XfwdSNewE4Q==
X-Received: from oatp23-n1.prod.google.com ([2002:a05:687c:4597:10b0:4a2:ac48:4d59])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:b20:b0:4ad:8c55:4087
 with SMTP id 586e51a60fabf-4ad986619e5mr3163066fac.4.1794026477335; Fri, 06
 Nov 2026 20:41:17 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:46 -0800
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
Message-ID: <20261107044102.1506626-6-irogers@google.com>
Subject: [PATCH v11 05/20] perf build: Enable additional Clang thread-safety flags
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

