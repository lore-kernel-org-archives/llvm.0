Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616C3587A9
	for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815660; cv=none; b=PNLWgMhDVAuK+tBtMyhIjxU6gmNCcpNVbi+MHx9uRujtT4p5hfEqPrvpiOdez4Dfhc42jylUsSGCpBpsFgMmSVY3VtzPx8yH0Q2jmZWxlngrrdzmyZC3zx+tII/0GYLZOqNs6ACHkiO7E7h5J7drnJP/CwHvQuKV41xeZtQBs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815660; c=relaxed/simple;
	bh=y9/1uLJMC7+X7yi1h38x4esMDvrYwSDX9pt6Sh+Dy/I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bXzDEGiYLlt1ph02C0OLb9Pwo1frs55Ojige1E3ooe+TFcqW9GG8fVHfzaBSSkm8mMpVi0R2jQUWrEgVfvIXNiMCWcw5UO5VhuT72CyUkUG5G5mhAcWjVpa33/pRgNYSw4iPrp11/s+M1z9Dx7pYr1npeR3LN4yC6ISICK1vrqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OcnA23Vi; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OcnA23Vi"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4801d21c280so23376455e9.1
        for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 01:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768815657; x=1769420457; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CA3Nu437Rj+eAevya/i4iek0cQKs4Ymlx+qux+GVc44=;
        b=OcnA23Vi1O2S5FY67tR5RcolFbLVb4wjKu9yBFEcTOrmW3Nshfg/AMgKB4Qs3DsXK5
         kxcqncjR7FTPEyDZlWAp2zKYH3kBf4i+A7IDYp80Xjg+PzhhB4cjg5JwriHdhiyQvJ+R
         SgUaUXtxvDrIkfrWDOIKppKmWGAn0Zv0/1oBYqDmiQIAHXw8HFyADKmaAP9YgBxUNARs
         MUN6GxJePv++n4tzNZDMKMi+3ZD/h9102DCBz8LNoyeferD4DrS9dOi54c09VhRjUieq
         8hdVKyKchEWm3GMTrdFdKmBz4LHtngGbhP+8V0BT3EoxjLkcSPAviscP7sxfbwCG3FeK
         oeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815657; x=1769420457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CA3Nu437Rj+eAevya/i4iek0cQKs4Ymlx+qux+GVc44=;
        b=nyAXMGowg5D1/gfCXH9NR+4dm394kklGSVGjHsCD/KroX6IC/wFUAklULYJLluQ/9G
         VJ5ShJFDh4KplVODatDYYpv66pY5xeEz6GDtfzb5T3wrnem8nVVfnN96PZhhLbbz3Z1O
         aV+872lA5yd/2KZVv6ecAj2gV7Pe3oiuWfkp2ruSaiHNXuaxVqIHN0IO1hbeFhodC9W1
         /ZgCG17P+3XL5+QxK+fQBRznYq8x/9vc1/JQD4vn3HJ+v7bs370IoeNizOYwYcpcmYro
         KCCI7DIsDbsd6K8Wbu8bHbSuaTjEx+v6e+vPOPIoPJrQIFIj6lsxwkgUCl6NUXg2+4Z+
         5sfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB/74fooT4VQMPsp8ys1HD/6FnCl+yOe8ZQGX5lJdi/njW0zciU3U3Ku8hzRT7OrZBibdl@lists.linux.dev
X-Gm-Message-State: AOJu0YwG5LBVVephaxW1eySQv4baIEBhnJsyBZ/bglAHkyaxDZyyF8vh
	fWpXSRMELMQXdxoOCpJt5hyaLTqQGteU5N5EKpDJzYu7uD4tvDil3KjmYPgLqCxUx8mDePIYwi9
	EqQ==
X-Received: from wmbka9.prod.google.com ([2002:a05:600c:5849:b0:480:2880:4d51])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:6413:10b0:480:1e40:3d2
 with SMTP id 5b1f17b1804b1-4801e400518mr100658775e9.29.1768815656749; Mon, 19
 Jan 2026 01:40:56 -0800 (PST)
Date: Mon, 19 Jan 2026 10:05:54 +0100
In-Reply-To: <20260119094029.1344361-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260119094029.1344361-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119094029.1344361-5-elver@google.com>
Subject: [PATCH tip/locking/core 4/6] crypto: Use scoped init guard
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Christoph Hellwig <hch@lst.de>, Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche <bvanassche@acm.org>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert lock initialization to scoped guarded initialization where
lock-guarded members are initialized in the same scope.

This ensures the context analysis treats the context as active during member
initialization. This is required to avoid errors once implicit context
assertion is removed.

Signed-off-by: Marco Elver <elver@google.com>
---
 crypto/crypto_engine.c | 2 +-
 crypto/drbg.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/crypto_engine.c b/crypto/crypto_engine.c
index 1653a4bf5b31..afb6848f7df4 100644
--- a/crypto/crypto_engine.c
+++ b/crypto/crypto_engine.c
@@ -453,7 +453,7 @@ struct crypto_engine *crypto_engine_alloc_init_and_set(struct device *dev,
 	snprintf(engine->name, sizeof(engine->name),
 		 "%s-engine", dev_name(dev));
 
-	spin_lock_init(&engine->queue_lock);
+	guard(spinlock_init)(&engine->queue_lock);
 	crypto_init_queue(&engine->queue, qlen);
 
 	engine->kworker = kthread_run_worker(0, "%s", engine->name);
diff --git a/crypto/drbg.c b/crypto/drbg.c
index 0a6f6c05a78f..21b339c76cca 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1780,7 +1780,7 @@ static inline int __init drbg_healthcheck_sanity(void)
 	if (!drbg)
 		return -ENOMEM;
 
-	mutex_init(&drbg->drbg_mutex);
+	guard(mutex_init)(&drbg->drbg_mutex);
 	drbg->core = &drbg_cores[coreref];
 	drbg->reseed_threshold = drbg_max_requests(drbg);
 
-- 
2.52.0.457.g6b5491de43-goog

