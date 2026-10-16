Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF057F733
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171877; cv=none; b=pxcNPHhTRI5aDi6C0eBq54h64Jhqf5tS/FokOOJf8h5Ks6zZMx9R/4UrQTS00lkFKKnt+TrpzgmdmXrkVgkdwTDpjMuOkU+FwA7iBIxTMoByj02cCk815pm20fn+zRaNrV4BtyVyHgDlmZeRf5HoDpNxeI7f7Ys3n9jRGgYtAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171877; c=relaxed/simple;
	bh=wrvIrrRxxCxbjC5y19PcJbeqSjug7uXwZUzwZWAtOzg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NJLHEcnI87phuf22oicHe1jm5uRrcirFHN4g6sY47CEoEUwEjNzT+il60S/NFTotspYNm6orZ1Yy2/3jsOYR60+vHx1nANW5/ZTXQSfCqLIZxRL/+IhCuj8iXeZxqM7Ym/RRzdYadwSlE3ytOdRGH7SsnwNYtw4H6L4ntKZoM0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kTrld3bl; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kTrld3bl"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-152d1363a29so320451c88.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171875; x=1792776675; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=kTrld3blfrFsfGc3T3/2YtvTMFMchtBw0QQCOkRv1FWG0/AzEO9SO3xIBVBbDvKU55
         5t0JSAURcCXJZgMOpZPyIc0f+NaCad6VXONDhv8JO7B4GiB0sUi5XZkho9EpEDawb1XW
         fnS4MabiP3gfUvorVmrNCPuLkFBhAvR49dJTbJTzV5/lMLuRkswIRS7kFaaKCQOgKFL3
         gWE7GAzU8j8h7wM2ARvlc8no+L1v0DQWzuFZYjKU0n1ZWmz5+EQncrlMmysVe8jThg85
         NgPPeLQuNXMmXv84QsgkQMWD0iwgP+3GcbfvvWQKjagVHp773Y//sZIJdsN6jsCZJ5mT
         UvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171875; x=1792776675;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=2dZaPwYqnX6dB26qdwDQ9QUit9ZnIMqOKtL6UY00zKs9K4JBie1+HrIsdaTsUqqDKl
         u5k0nId7fqzYGQ95652i2ANpS3KW7osVdpUABYznEXpidCUUm2b6F83BEieqHLhWciZB
         fjeVnzlgjt+ZAYjfu1XJDmIJJAdLq0RcH6VcXe0gdxlTf5c23NIR4IJgliXZ33R6no/d
         VjiLw7p5cei8O5goauEOUESNG78WM+aZshzzcJrGdIys6O9ptu+z0F0zIn/khb5oHjGH
         Awuk0E6ZCCTF/xZQKQHu08pQTdXP9BHRaxuIKx15/u7pRdJr/9wjToYHnVOISgSKVW6M
         1AUA==
X-Forwarded-Encrypted: i=1; AKwUvBzqfnx864DzVwNlNfVuUyLpE7XpTjmFjvgZ+M1q4Xac/W0CUf1IMLekVLx8QXcy6HNFEDY5@lists.linux.dev
X-Gm-Message-State: AFq9FYKWo4TGrN2kRaKs9R3Y8fxb2SON7sYD+Dqrwpj9Plj+Cuj8hGtv
	1nM46DahY15XyCQ62C7qeTiwFYbDCbgouChVSM8KWZhVNsK3Zb/fTkM+LRyQtaHB99kzKXaHtqc
	CTkIDoRTGcw==
X-Received: from dlbtp9.prod.google.com ([2002:a05:7022:3b89:b0:16c:8019:50cb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2097:b0:14d:c9e:a356
 with SMTP id a92af1059eb24-18511ad8b0emr658014c88.12.1792171874071; Fri, 16
 Oct 2026 10:31:14 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:30:50 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-2-irogers@google.com>
Subject: [PATCH v3 01/17] compiler-context-analysis: Avoid unused parameter
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

