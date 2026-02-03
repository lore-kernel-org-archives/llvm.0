Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78D0353EE5
	for <llvm@lists.linux.dev>; Tue,  3 Feb 2026 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159085; cv=none; b=oUauu8ElY7CGknvTz1PsHS+dQVQiEh1Kj5XkbHzUL7wpDfd27Q8gzsYjzOI4ub11tARvrCk+JSm3xcWvRl2T/CTnH+mnanl7c/vTjFAuyUeQ99bkP7702V4WnjJgibg0JsO+8cLv/m9e+WqkzKKWtdvPJMCi/0uIx36m+TMYhRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159085; c=relaxed/simple;
	bh=Tn3E1o0KMAET7YN999fmQLSh3BVk3QZG/lROPQ88UFQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bWx6VGedL9YbBxKE0d30XR6TMr2CC9x8QmHs4J+ancu9RQ8ncgaeBeWvAvSLbWEZHqkFJyHBn4lC/Uo/M21V2IbEmKkrmodrYc1+rR0k0kugwaexBGicoAK3ZAGktEkb3Wc2c1iuDa6HqCT8BrNqGLz7edsV4Tjxj6tqJVqFZeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n4vQ8YpZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n4vQ8YpZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso747445e9.3
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 14:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770159082; x=1770763882; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7V20sWlc5RVsh/o7j3H1tJ30NR6XAOQhuKL3Fnt3PF0=;
        b=n4vQ8YpZYUX67YcjYNDDI1hsBIUuMS8H8BdPEUkigJPyTt2iMA41AdQaU1oggPuGCe
         OXv8P5P/KPFdIc8d/7+Kc82eMqtW8vQAi4O0SvSCaxkHqfKh8HxGuMNpJx1lIskbM+ME
         nM3D0b6WkGXQW+iaJSNdVTHEvGXbSVIWX3XBgnks8jP2jVzpOspy3hkiATUNz1Z7OzDT
         EgYa9r5ZA4niAyLCmcFg0mE+hhQB0jf+QFpwnJ7tl2axrgN+o1KXCFWc02MiLZrKgrkW
         cLU1dTLubmlF08yrZ3HNgkbb01JbEhywtWgN4Hbnql8yxpmEg/HKOzOcddfR8gFJrkJW
         XHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770159082; x=1770763882;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7V20sWlc5RVsh/o7j3H1tJ30NR6XAOQhuKL3Fnt3PF0=;
        b=juvltajjzQoN9+z6OCgVTYK3qD/aE5KMqVwUDHdBH3Fo6AFOaKPYOAqybOzuR0l/Gk
         /BOcUHl+0/kkDZczDC471Isz3XGccmmHGUw+EGVQQZkIpongw5GB1n3dWUMoYHon527b
         U5trgbv64o6Q+B89KseBv8STq6LSN+bTEcHVGq/pWSbh3V9Mzd48sWyA6GRI+OX1LUaw
         ScxO+F+waPTww7Qx5UNtpe+B1DOdqwqniT9TjdXGXSjQt1bWD+wSzYVYP0BXlnnr2IYZ
         wkZw25xUHIGdbeHFFrzzAipLetRYAf7BzxbErKoOYTbHauOTLp3ix1nbNrH89SvH4gbK
         kB+A==
X-Forwarded-Encrypted: i=1; AJvYcCVowoulcbGfjIf5nD9YxOdawim3JpHUeAReweKZC1Z1r9bEd6YF2ohN2XiJV7vzZbTpFhIy@lists.linux.dev
X-Gm-Message-State: AOJu0YzXMTDKIKyeXiIvA2Sth5sf3bR+iiLcUSI4P8oAUYTD4jM1RitD
	tAUN7qUYLxO++jnmA3MRVl+Ry5wGD8kFHcMIBr9t7nLJnYTMhd5eLg6hdS7fsLGMEo/jARNKawv
	W/Q==
X-Received: from wmoo6.prod.google.com ([2002:a05:600d:106:b0:480:6ceb:eb1b])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46d3:b0:480:52fe:58f5
 with SMTP id 5b1f17b1804b1-4830e98030dmr17591325e9.31.1770159082401; Tue, 03
 Feb 2026 14:51:22 -0800 (PST)
Date: Tue,  3 Feb 2026 23:50:10 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260203225114.3493538-1-elver@google.com>
Subject: [PATCH tip/locking/core] locking/rwlock: Fix write_trylock_irqsave()
 with CONFIG_INLINE_WRITE_TRYLOCK
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move _raw_write_trylock_irqsave() after the _raw_write_trylock macro to
ensure it uses the inlined version, fixing a linker error when inlining
is enabled. This is the case on s390:

>> ld.lld: error: undefined symbol: _raw_write_trylock
   >>> referenced by rwlock_api_smp.h:48 (include/linux/rwlock_api_smp.h:48)
   >>>               lib/test_context-analysis.o:(test_write_trylock_extra) in archive vmlinux.a
   >>> referenced by rwlock_api_smp.h:48 (include/linux/rwlock_api_smp.h:48)
   >>>               lib/test_context-analysis.o:(test_write_trylock_extra) in archive vmlinux.a

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602032101.dbxRfsWO-lkp@intel.com/
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/rwlock_api_smp.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/rwlock_api_smp.h b/include/linux/rwlock_api_smp.h
index d903b17c46ca..61a852609eab 100644
--- a/include/linux/rwlock_api_smp.h
+++ b/include/linux/rwlock_api_smp.h
@@ -41,16 +41,6 @@ void __lockfunc
 _raw_write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
 							__releases(lock);
 
-static inline bool _raw_write_trylock_irqsave(rwlock_t *lock, unsigned long *flags)
-	__cond_acquires(true, lock)
-{
-	local_irq_save(*flags);
-	if (_raw_write_trylock(lock))
-		return true;
-	local_irq_restore(*flags);
-	return false;
-}
-
 #ifdef CONFIG_INLINE_READ_LOCK
 #define _raw_read_lock(lock) __raw_read_lock(lock)
 #endif
@@ -147,6 +137,16 @@ static inline int __raw_write_trylock(rwlock_t *lock)
 	return 0;
 }
 
+static inline bool _raw_write_trylock_irqsave(rwlock_t *lock, unsigned long *flags)
+	__cond_acquires(true, lock) __no_context_analysis
+{
+	local_irq_save(*flags);
+	if (_raw_write_trylock(lock))
+		return true;
+	local_irq_restore(*flags);
+	return false;
+}
+
 /*
  * If lockdep is enabled then we use the non-preemption spin-ops
  * even on CONFIG_PREEMPT, because lockdep assumes that interrupts are
-- 
2.53.0.rc2.204.g2597b5adb4-goog

