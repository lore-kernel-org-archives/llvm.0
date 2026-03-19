Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216C2C1780
	for <llvm@lists.linux.dev>; Thu, 19 Mar 2026 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928380; cv=none; b=J2aK25+VTnQ+61Mi+hn3mt1imNdLtGKG0ICOL+CcuEuSo5oOYwj51eBuWyafBrt/gm/2wPbV1MlmKqXzWZ9Fq+LTLFSzVEqZ/gmNpJD4/iMVOlo7nof4CM/Wya1pI2nJo4p9M56JedlFbryd4SWE2SGuLsQNXWG5Hcjq7X+Xj1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928380; c=relaxed/simple;
	bh=N3JUv4FAKrJiGsjb/JjZ5eEIy7p5lTbcpeg4XLkvWbI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IgBLOIksRUWje//lwnYWQncFCy8SAFauogqAbQ/+Ry00uW4c5HsRKlOlvFHAdhfr9bFMZrfOuETKI0ba7IX4hTPdwKwl2IjNtzc3kE1LXV+IBiKh51Jm7/x4s4Sq/+SuzuZVZdl1n+2DUEzMBAz6gWzKWoSIVdz+81v3bn/Rn9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jfPSdzQU; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jfPSdzQU"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-486fc42c83aso4767165e9.0
        for <llvm@lists.linux.dev>; Thu, 19 Mar 2026 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773928377; x=1774533177; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eZ48RxtqhFC+Ft2ryzXO0wxvBOUpn0Fzs00xvrlNRUI=;
        b=jfPSdzQUDarPft+qBkAmdBwX9raeP9w0rf6J/avN9FIgy3+9lEwSgOmNKNBVcYZalt
         1WBmNzW3BppOGIl7wyhtjMI7YeqTtxcCdOFTlq29O8xgsK302t14/GttIdpexczBb2T/
         afjQTogOfzGCv0hBxc7tpxLS0qNBaFQquFMnfjE5/R/qS9ry2/OR0lMTckeAr05ebCUq
         d0GyqfS/yncIqxWzsN9sXZQ/V5UP8IpxloNDdUGqSeY3RaTKEgflRSlXpV38PLwUEjcj
         uG53qN8NEoO3PhiEVuVDW6kT2X9PvF/28u5to4LbeIPGIyNs5C3nLj0GmIBOuea7FAsU
         L6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773928377; x=1774533177;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZ48RxtqhFC+Ft2ryzXO0wxvBOUpn0Fzs00xvrlNRUI=;
        b=jP3Way/9xJErXJZvKc9W7PNan7gByWbPaLDY9rE9dVxjWRFtl7lUA4NkH2En/RsLbN
         qRLt0XIf0rtIXkHAkn8hp9GyN+DNqR94O2ZF6sor9uTna1B/07UuclFoN1AqLThsiW6p
         8coXQubkHFAgtYEvGbEhxij22lhcElyCc7IVF5hNyVaBDrYvPb7AGHnwhl5XTRjA9IhS
         JzGmb507v5uE5lNKngn0QZ7ykomQlqQMdJNJ2URZFbzxFJbAJ9tturj1NbJBhEvUeUZd
         odflzXfXHp8103yG8CikHU9mhQ1i/0pR76g6/jrlnY/xx8MsFHdOTBTIT6BIQ9zEIl4M
         hFIg==
X-Forwarded-Encrypted: i=1; AJvYcCUF2Q0EjSKd8qglMq+GdmYUjUJ5pe/I5c7D+kFyfvfzm36ujE9qz7eA5PWfYF1LYsOfG6Z+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0R2S7qmgC7lgmu4YdFxGcXX0st58TxXplvFZVOSc4p2LVIylD
	rpmAsA4jWPAN4LnzJAgoCroGgpbjaId+mJLBBdvH7m6UEIwJV/TDZ8ymudI5cVhrFWVoXik1Y7m
	pfQ==
X-Received: from wmol21.prod.google.com ([2002:a05:600c:47d5:b0:485:33e8:9296])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b8a:b0:486:f308:94ec
 with SMTP id 5b1f17b1804b1-486f456fdeemr126886675e9.24.1773928377192; Thu, 19
 Mar 2026 06:52:57 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:52:38 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260319135245.1420780-1-elver@google.com>
Subject: [PATCH] compiler: Simplify generic RELOC_HIDE()
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	Bart Van Assche <bvanassche@acm.org>, David Laight <david.laight.linux@gmail.com>, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

When enabling Context Analysis (CONTEXT_ANALYSIS := y) in arch/x86/kvm
code, Clang's Thread Safety Analysis failed to recognize that identical
per_cpu() accesses refer to the same lock:

|   CC [M]  arch/x86/kvm/vmx/posted_intr.o
| arch/x86/kvm/vmx/posted_intr.c:186:2: error: releasing raw_spinlock '__ptr + __per_cpu_offset[vcpu->cpu]' that was not held [-Werror,-Wthread-safety-analysis]
|   186 |         raw_spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
|       |         ^
| ./include/linux/spinlock.h:276:32: note: expanded from macro 'raw_spin_unlock'
|   276 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
|       |                                         ^
| arch/x86/kvm/vmx/posted_intr.c:207:1: error: raw_spinlock '__ptr + __per_cpu_offset[vcpu->cpu]' is still held at the end of function [-Werror,-Wthread-safety-analysis]
|   207 | }
|       | ^
| arch/x86/kvm/vmx/posted_intr.c:182:2: note: raw_spinlock acquired here
|   182 |         raw_spin_lock_nested(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu),
|       |         ^
| ./include/linux/spinlock.h:235:2: note: expanded from macro 'raw_spin_lock_nested'
|   235 |         _raw_spin_lock(((void)(subclass), (lock)))
|       |         ^
| 2 errors generated.

This occurred because the default RELOC_HIDE() implementation (used by
the per-CPU macros) is a statement expression containing an intermediate
'unsigned long' variable (this version appears to predate Git history).

While the analysis strips away inner casts when resolving pointer
aliases, it stops when encountering intermediate non-pointer variables
(this is Thread Safety Analysis specific and irrelevant for codegen).
This prevents the analysis from concluding that the pointers passed to
e.g. raw_spin_lock() and raw_spin_unlock() were identical when per-CPU
accessors are used.

Simplify RELOC_HIDE() to a single expression. This preserves the intent
of obfuscating UB-introducing out-of-bounds pointer calculations from
the compiler via the 'unsigned long' cast, but allows the alias analysis
to successfully resolve the pointers.

Using a recent Clang version, I observe that generated code remains the
same for vmlinux; the intermediate variable was already being optimized
away (for any respectable modern compiler, not doing so would be an
optimizer bug). Note that GCC provides its own version of RELOC_HIDE(),
so this change only affects Clang builds.

Add a test case to lib/test_context-analysis.c to catch any regressions.

Link: https://lore.kernel.org/all/e3946223-4543-4a76-a328-9c6865e95192@acm.org/
Reported-by: Bart Van Assche <bvanassche@acm.org>
Reported-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/compiler.h    |  5 +----
 lib/test_context-analysis.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index af16624b29fd..cb2f6050bdf7 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -149,10 +149,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 #endif
 
 #ifndef RELOC_HIDE
-# define RELOC_HIDE(ptr, off)					\
-  ({ unsigned long __ptr;					\
-     __ptr = (unsigned long) (ptr);				\
-    (typeof(ptr)) (__ptr + (off)); })
+# define RELOC_HIDE(ptr, off) ((typeof(ptr))((unsigned long)(ptr) + (off)))
 #endif
 
 #define absolute_pointer(val)	RELOC_HIDE((void *)(val), 0)
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 140efa8a9763..06b4a6a028e0 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -596,3 +596,14 @@ static void __used test_ww_mutex_lock_ctx(struct test_ww_mutex_data *d)
 
 	ww_mutex_destroy(&d->mtx);
 }
+
+static DEFINE_PER_CPU(raw_spinlock_t, test_per_cpu_lock);
+
+static void __used test_per_cpu(int cpu)
+{
+	raw_spin_lock(&per_cpu(test_per_cpu_lock, cpu));
+	raw_spin_unlock(&per_cpu(test_per_cpu_lock, cpu));
+
+	raw_spin_lock(per_cpu_ptr(&test_per_cpu_lock, cpu));
+	raw_spin_unlock(per_cpu_ptr(&test_per_cpu_lock, cpu));
+}
-- 
2.53.0.851.ga537e3e6e9-goog

