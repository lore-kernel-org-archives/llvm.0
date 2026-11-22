Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345013;
	b=5iA6OGwdkCzDvkd+jIzCWBmNnJ9VA8+XlKgXoKSe11QheTlbZe2ZSiWEeLoJ+i9ph7+b
	 a3SCMRGUI/mc7mPjo4ClZeqQ3/ZOa+pyyLfd/Y9xuxciCbb3/TeY9Lfn73+hNOIkdWiq4
	 m1P9gj1P0Y8XPpsVdWxMNRX3OWpG/1EeJpU4waq3xIKJJ0x1FEXoxnfy5ND3Qbz/7b0Lw
	 H/mZn5OoBiFCu5CCYBh7noRG5W9OMjI0i1QOuhEmSXFMQq1mua+zesV5Tpt1+RnzYTft6
	 SsXm7QW2rTgPN9ks0ihdhEHH6LtY/o254KP9Rx6ZopvguVwV241oQe25YIMXprAtoag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:Subject:
	 From:To:Cc:Content-Type;
	bh=TBdQn4iaXs4K3IS08zgLB1njZ8472GlpmHn+HZOS+/M=;
	b=Brh/MnnyhqUA+DaOYSZu0OM4XXP+y3iJAuWgyIl02gMuoBOACJWCBs1OuX6IZddfy5bg
	 rvY+hQSPIzKvbotztZo3Bj7t+F9YseXi9B4PlxjOoW7QZKsA4xSgnyZ2D0PdAX2Qbd6ou
	 3XW1qGhYOoj9JqQgXMOmzE2YEJP7chaNI4zD2XV8PxTbFpTwl87x4NqqaZW2c2rWea7nZ
	 fg8fSZK9oQZ2c9G/bGY3lkVJDdWkZEtsx94qyAEE+1I4hRIzIL7ZF6EZrzwvTcwMt4LIi
	 eFajQKXbkqONWxQgH0YPXD8rsqUtSfaeXsJJJuPlyOnTQYFOh7G73V37ynoQSxxFPhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z9ABo1nv;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473A606A32C
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 10:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3473A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z9ABo1nv
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso19173215e9.2
        for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 02:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795345011; x=1795949811; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBdQn4iaXs4K3IS08zgLB1njZ8472GlpmHn+HZOS+/M=;
        b=Z9ABo1nvg/zv1T7gL/ymQKN0Hz40BtXYZ1Hoc+12l6bNcYEiUxa23k+u5k5M3IXX41
         h9/JYLlxs1qFYWSYlcLVrWsbSZS2dL4hykilzO11hwJEYA9kuzjWOAfl3yUGqIDrsTeC
         Jd412cdJSC8qgxDxJW+cBJnNq66maZFmd6gSOlkjueLcRrzkiECOVVGDd950Rj9dxPJ7
         260G4Jj/SwIkMWpRoldmWL3Ts5EFbBHnvTD+K2CkZrr7yKQ2F86w+aa3mBT1I3xtMuyv
         poeLB8ZNgAlI7bWHrYKaInTI5Pzob4L2VX2NX0Gm9tfsX4H0XCMSXgWrmBehREhMylZK
         UTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795345011; x=1795949811;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBdQn4iaXs4K3IS08zgLB1njZ8472GlpmHn+HZOS+/M=;
        b=DGOt69qOcWDT7HifHoP8ajMWFRcHikjsnSObMEG6HzrpVb4FfUiO/lw34/9u6F5TFt
         3fYdq2IuZOkcqRnjgUdKW6SGumPphV8DWmrV6nMYNXp6rr6UXqF8+LXJECFdUfVk7wgu
         2+1SNIczQ81lLBInUL4hgZJ4ItrG33gkmLlsPtms4JTrm87pvG3BJxleyzbikhX2Ke21
         8dv1c1n4HaEoKsIGxmye9KVX9lmHqiKjVXfajSemdAkntcApb1o99YSFzE914VzWevBn
         st4haCE+zVM01n1Azj3ifWUbEQgVrDIOzsz7Jzo+y2QNWLBkCN/zGv25kiRhpDpVUyWt
         Cq1A==
X-Forwarded-Encrypted: i=1; AL+hErHtdxeG3I3tG79z5CXDrvjKhw9D9sR7OR8zP0/CPNGYSZK1DTT3yB6RH0CaVFYKVl1mMaZv@lists.linux.dev
X-Gm-Message-State: APuU4Z+47/vN4ijOOBh/P7zLRHzuOJo17b3/mEUJx3BQD9ocBzk9+7lO
	h9OykXpv1n9LLc9Pyel+siiC6Ru7DdxDof26AO/TlfO1kiE2bAs7SHhJROa8DbcNkVn5OF1Gxg=
	=
X-Received: from wmej22.prod.google.com ([2002:a05:600c:42d6:b0:4bb:4bbf:7120])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1548:b0:4a3:59c9:a756
 with SMTP id 5b1f17b1804b1-4bb88800013mr196849355e9.6.1795345011084; Sun, 22
 Nov 2026 02:56:51 -0800 (PST)
Date: Sun, 22 Nov 2026 11:56:47 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5956; i=ardb@kernel.org;
 h=from:subject; bh=DWnBtyBokAGUqkZ0KDweRYYnMpGBh6VqAzR3FDs49SA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZvpVP6UqzMkdP+Izn0/J3SjuelRjrdn5m1ZJ/Go1n5/9
 4MrXtH9HaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiIt8ZGaYLHvKZNzvbQr92
 6g3Ztupb+3YoL5ric0lI+Mqe87p/U9MZGRbKZ0gd825UltvOclL1weJb/caNf0J+6Ac7ttSz78y bxAkA
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122105646.2223131-2-ardb+git@google.com>
Subject: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock pointer
 if unused
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When lock debugging is disabled, local_lock_acquire() and friends are
empty, and so the per-CPU lock pointer that is passed to them, which is
usually computed using this_cpu_ptr(), is not used at all.

However, on x86, when the compiler does not support named address spaces
(i.e., Clang), this_cpu_ptr() is based on inline asm with a memory
operand, and Clang does not discard such inline asm even if its result
is unused. So the computation of the per-CPU address of the lock is
emitted regardless, e.g., on every local_lock_nested_bh() in
process_backlog() and on every local_lock() in the folio batching code.

This was addressed before by commit

  9983a9d577db ("locking/local_lock: Make the empty local_lock_*() function a macro.")

but that change was reverted by commit

  2d2f8f083ef2 ("Revert "locking/local_lock: Make the empty local_lock_*() function a macro."")

once commit

  1c1e7e3c23dd ("x86/percpu: Remove volatile from arch_raw_cpu_ptr().")

had dropped the volatile qualifier from the inline asm, on the basis that
the compiler no longer emits the unused per-CPU reference in that case.
This is true for GCC, but not for Clang.

So implement the !CONFIG_DEBUG_LOCK_ALLOC versions of these helpers as
macros that only reference their argument in dead code, so that it is
type checked but never evaluated. Referencing it only in an unevaluated
context instead, as the typecheck() in the original macros did, makes
Clang complain about per-CPU locks that are only used via these helpers
(-Wunneeded-internal-declaration), which is what commit

  a4812d47deff ("mm/page_alloc: mark pagesets as __maybe_unused")

had to work around at the time.

Also, only evaluate the lock pointer in __local_lock_acquire() and
__local_lock_release() when it is actually needed, i.e., for
local_trylock_t.

Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev
Fixes: 2d2f8f083ef2 ("Revert "locking/local_lock: Make the empty local_lock_*() function a macro."")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/local_lock_internal.h | 47 +++++++++++++-------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index 234be7f12c15..7c3191438c90 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -69,10 +69,21 @@ static inline void local_lock_debug_init(local_lock_t *l)
 #else /* CONFIG_DEBUG_LOCK_ALLOC */
 # define LOCAL_LOCK_DEBUG_INIT(lockname)
 # define LOCAL_TRYLOCK_DEBUG_INIT(lockname)
-static inline void local_lock_acquire(local_lock_t *l) { }
-static inline void local_trylock_acquire(local_lock_t *l) { }
-static inline void local_lock_release(local_lock_t *l) { }
 static inline void local_lock_debug_init(local_lock_t *l) { }
+
+/*
+ * The argument passed to these is usually a this_cpu_ptr() expression, which
+ * is implemented using inline asm when the compiler lacks support for named
+ * address spaces (e.g., Clang). Clang may fail to discard such inline asm
+ * even if its result is never used, so only reference the argument in dead
+ * code, which type checks it without evaluating it. (Referencing it only in an
+ * unevaluated context such as sizeof() would make Clang complain about per-CPU
+ * locks that are only used via these helpers being unneeded.)
+ */
+static inline void __local_lock_typecheck(local_lock_t *l) { }
+# define local_lock_acquire(l)		({ if (0) __local_lock_typecheck(l); })
+# define local_trylock_acquire(l)	({ if (0) __local_lock_typecheck(l); })
+# define local_lock_release(l)		({ if (0) __local_lock_typecheck(l); })
 #endif /* !CONFIG_DEBUG_LOCK_ALLOC */
 
 #define INIT_LOCAL_LOCK(lockname)	{ LOCAL_LOCK_DEBUG_INIT(lockname) }
@@ -105,20 +116,23 @@ do {								\
 	local_lock_debug_init(lock);				\
 } while (0)
 
+/*
+ * Only evaluate @lock if it is actually used, i.e., for local_trylock_t, or
+ * when lock debugging is enabled (see local_lock_acquire() above).
+ */
 #define __local_lock_acquire(lock)					\
 	do {								\
-		local_trylock_t *__tl;					\
-		local_lock_t *__l;					\
-									\
-		__l = (local_lock_t *)(lock);				\
-		__tl = (local_trylock_t *)__l;				\
 		_Generic((lock),					\
 			local_trylock_t *: ({				\
+				local_trylock_t *__tl = (local_trylock_t *)(lock); \
+									\
 				lockdep_assert(__tl->acquired == 0);	\
 				WRITE_ONCE(__tl->acquired, 1);		\
+				local_lock_acquire((local_lock_t *)__tl); \
 			}),						\
-			local_lock_t *: (void)0);			\
-		local_lock_acquire(__l);				\
+			local_lock_t *: ({				\
+				local_lock_acquire((local_lock_t *)(lock)); \
+			}));						\
 	} while (0)
 
 #define __local_lock(lock)					\
@@ -181,18 +195,17 @@ do {								\
 
 #define __local_lock_release(lock)					\
 	do {								\
-		local_trylock_t *__tl;					\
-		local_lock_t *__l;					\
-									\
-		__l = (local_lock_t *)(lock);				\
-		__tl = (local_trylock_t *)__l;				\
-		local_lock_release(__l);				\
 		_Generic((lock),					\
 			local_trylock_t *: ({				\
+				local_trylock_t *__tl = (local_trylock_t *)(lock); \
+									\
+				local_lock_release((local_lock_t *)__tl); \
 				lockdep_assert(__tl->acquired == 1);	\
 				WRITE_ONCE(__tl->acquired, 0);		\
 			}),						\
-			local_lock_t *: (void)0);			\
+			local_lock_t *: ({				\
+				local_lock_release((local_lock_t *)(lock)); \
+			}));						\
 	} while (0)
 
 #define __local_unlock(lock)					\
-- 
2.56.1.750.gf70dc682cf-goog

