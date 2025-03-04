Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D020409D
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080364; cv=none; b=hApNzmz0EBcsdApLHSpF/icXZq0nAkjHNLd59w095PYgZdjxId6N52Ng5o1HCV+N7vrBCj3QXwxSMSW79YMjMSLTKyBJ4BnyKCFjpMs3RnHRNAY3B2wz968LLCtOFsIdbMHSrC6MAYnPXQt7PUX+5IXgUtzqvJ5HTBsdfU07K04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080364; c=relaxed/simple;
	bh=5Pp0cWVWeR/iKG+6F+FtpYqvROINCcN+zxDEvkyjIk0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D+vHvv6MNhzfKNCg1NOIVDJS954dFAp1F/DxRQWeHd7KJCLbdol8OWbxLiefWEZAw0RSy4wG1hlhfPmtKfHfETQR+tW31W1X1jPH6TL3ROpErRQsHlGK9e7xOlMlilkSg0MpMvxRIGm1ri61XEfJft02xxmVaiihcIksNl8GLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z8qK+UBZ; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z8qK+UBZ"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5e4c2618332so2147150a12.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080360; x=1741685160; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fevqVsEsX3/oCaV46XhekBmDNUcdyGVL5LKZ5XmlZNY=;
        b=Z8qK+UBZ4vR74GiFYBIY+LfHbsJJDJAfeqOFMXa0UNhDryTp22bzEVuFHmb7uaBwXy
         fkg512bA0RctK2cx90Jgoh6z4oZrDoJF7KE6LkK0c2eX5x8k5qz2vBIcQn+Y/5LjsFZJ
         fGlvx7Ost1sCj9o9gpqK5g8T5SytKSzl2pUXwh36Mn1C96uuMcWDj/c/7e1nAxuLnelM
         VH1qkkdcsKzUraArAplBRDND7mdgmlMxJXy/W6vNAym2eXzvrTdMin/AsmZcYBPtOlhs
         rOsGN9+ORutVtvFZ2uVMp9G/izOuEpdghDB2tD9McVsZMf+VTxt6hDD2U50kwy5CcjFy
         1Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080360; x=1741685160;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fevqVsEsX3/oCaV46XhekBmDNUcdyGVL5LKZ5XmlZNY=;
        b=C8XTmXoI+V5k/1WFt+05fDJTzomc519GD0MACnATbcBiQFZgxb/yl2M39K46R71i/2
         IErmGf+BuUI4NQN8pU8U5o3Kao+3OIPDMmyQWoYtPjokZ2pqa0BV2rX12NUARHOtSJdd
         knOrielKmb4DrTgGcTZmy1X15m3nOBF5efLHYvbGBSMkJT0/sfWzvQfUpx0rFhLPBiIJ
         gLhU7h4+lgt+69ZUsSeuy1bvUXMqr1vduikJCfd9FXnywMkX5Z9Kcz3fzG4N72vTFxzI
         95PkJMmgzn5Aa17Ue2rft3sLYVP+9dx/fMm6kslySIq69UOVicD8J0AXIDymcavC7ajs
         Tahw==
X-Forwarded-Encrypted: i=1; AJvYcCXS7iBbHFKRFllzAxhlVPArszVXwi5rWTQbcgIUJYu1WZoIQ4GRmbA3N8bSdS4kcZk6M1E7@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpfgi7G66amZ7lvtnVFIVhktXxzjgKu5+Bg+HlPakockiYL9ab
	izJwehfwBHIzO34ixhtRfS+clX7mvj+ZfI6Wi/kW9cYjCwpj6o9rwRBHKeyOwmJpDIl77nN3rw=
	=
X-Google-Smtp-Source: AGHT+IFl5s6Iny66DH2m/TkuwyT+wpjNT0HF7LAin4sZpCAQX9J/MzXeXyXsNOCBtJkLhAkMTTKBYFaHlQ==
X-Received: from edbfe12.prod.google.com ([2002:a05:6402:390c:b0:5e0:963d:6041])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3904:b0:5e5:335:dad2
 with SMTP id 4fb4d7f45d1cf-5e50335de72mr16333101a12.26.1741080360656; Tue, 04
 Mar 2025 01:26:00 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:18 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-20-elver@google.com>
Subject: [PATCH v2 19/34] locking/local_lock: Support Clang's capability analysis
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add support for Clang's capability analysis for local_lock_t.

Signed-off-by: Marco Elver <elver@google.com>
---
 .../dev-tools/capability-analysis.rst         |  2 +-
 include/linux/local_lock.h                    | 18 ++++----
 include/linux/local_lock_internal.h           | 41 ++++++++++++++---
 lib/test_capability-analysis.c                | 46 +++++++++++++++++++
 4 files changed, 90 insertions(+), 17 deletions(-)

diff --git a/Documentation/dev-tools/capability-analysis.rst b/Documentation/dev-tools/capability-analysis.rst
index 7e4d94d65043..e892a5292841 100644
--- a/Documentation/dev-tools/capability-analysis.rst
+++ b/Documentation/dev-tools/capability-analysis.rst
@@ -80,7 +80,7 @@ Supported Kernel Primitives
 
 Currently the following synchronization primitives are supported:
 `raw_spinlock_t`, `spinlock_t`, `rwlock_t`, `mutex`, `seqlock_t`,
-`bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`.
+`bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`, `local_lock_t`.
 
 For capabilities with an initialization function (e.g., `spin_lock_init()`),
 calling this function on the capability instance before initializing any
diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
index 091dc0b6bdfb..63fadcf66216 100644
--- a/include/linux/local_lock.h
+++ b/include/linux/local_lock.h
@@ -51,12 +51,12 @@
 #define local_unlock_irqrestore(lock, flags)			\
 	__local_unlock_irqrestore(lock, flags)
 
-DEFINE_GUARD(local_lock, local_lock_t __percpu*,
-	     local_lock(_T),
-	     local_unlock(_T))
-DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
-	     local_lock_irq(_T),
-	     local_unlock_irq(_T))
+DEFINE_LOCK_GUARD_1(local_lock, local_lock_t __percpu,
+		    local_lock(_T->lock),
+		    local_unlock(_T->lock))
+DEFINE_LOCK_GUARD_1(local_lock_irq, local_lock_t __percpu,
+		    local_lock_irq(_T->lock),
+		    local_unlock_irq(_T->lock))
 DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
 		    local_lock_irqsave(_T->lock, _T->flags),
 		    local_unlock_irqrestore(_T->lock, _T->flags),
@@ -68,8 +68,8 @@ DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
 #define local_unlock_nested_bh(_lock)				\
 	__local_unlock_nested_bh(_lock)
 
-DEFINE_GUARD(local_lock_nested_bh, local_lock_t __percpu*,
-	     local_lock_nested_bh(_T),
-	     local_unlock_nested_bh(_T))
+DEFINE_LOCK_GUARD_1(local_lock_nested_bh, local_lock_t __percpu,
+		    local_lock_nested_bh(_T->lock),
+		    local_unlock_nested_bh(_T->lock))
 
 #endif
diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index 420866c1c70b..01830f75d9a3 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -10,12 +10,13 @@
 
 #ifndef CONFIG_PREEMPT_RT
 
-typedef struct {
+struct_with_capability(local_lock) {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lockdep_map	dep_map;
 	struct task_struct	*owner;
 #endif
-} local_lock_t;
+};
+typedef struct local_lock local_lock_t;
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 # define LOCAL_LOCK_DEBUG_INIT(lockname)		\
@@ -62,6 +63,7 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_PERCPU);			\
 	local_lock_debug_init(lock);				\
+	__assert_cap(lock);					\
 } while (0)
 
 #define __spinlock_nested_bh_init(lock)				\
@@ -73,40 +75,47 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_NORMAL);			\
 	local_lock_debug_init(lock);				\
+	__assert_cap(lock);					\
 } while (0)
 
 #define __local_lock(lock)					\
 	do {							\
 		preempt_disable();				\
 		local_lock_acquire(this_cpu_ptr(lock));		\
+		__acquire(lock);				\
 	} while (0)
 
 #define __local_lock_irq(lock)					\
 	do {							\
 		local_irq_disable();				\
 		local_lock_acquire(this_cpu_ptr(lock));		\
+		__acquire(lock);				\
 	} while (0)
 
 #define __local_lock_irqsave(lock, flags)			\
 	do {							\
 		local_irq_save(flags);				\
 		local_lock_acquire(this_cpu_ptr(lock));		\
+		__acquire(lock);				\
 	} while (0)
 
 #define __local_unlock(lock)					\
 	do {							\
+		__release(lock);				\
 		local_lock_release(this_cpu_ptr(lock));		\
 		preempt_enable();				\
 	} while (0)
 
 #define __local_unlock_irq(lock)				\
 	do {							\
+		__release(lock);				\
 		local_lock_release(this_cpu_ptr(lock));		\
 		local_irq_enable();				\
 	} while (0)
 
 #define __local_unlock_irqrestore(lock, flags)			\
 	do {							\
+		__release(lock);				\
 		local_lock_release(this_cpu_ptr(lock));		\
 		local_irq_restore(flags);			\
 	} while (0)
@@ -115,19 +124,37 @@ do {								\
 	do {							\
 		lockdep_assert_in_softirq();			\
 		local_lock_acquire(this_cpu_ptr(lock));	\
+		__acquire(lock);				\
 	} while (0)
 
 #define __local_unlock_nested_bh(lock)				\
-	local_lock_release(this_cpu_ptr(lock))
+	do {							\
+		__release(lock);				\
+		local_lock_release(this_cpu_ptr(lock));		\
+	} while (0)
 
 #else /* !CONFIG_PREEMPT_RT */
 
+#include <linux/spinlock.h>
+
 /*
  * On PREEMPT_RT local_lock maps to a per CPU spinlock, which protects the
  * critical section while staying preemptible.
  */
 typedef spinlock_t local_lock_t;
 
+/*
+ * Because the compiler only knows about the base per-CPU variable, use this
+ * helper function to make the compiler think we lock/unlock the @base variable,
+ * and hide the fact we actually pass the per-CPU instance @pcpu to lock/unlock
+ * functions.
+ */
+static inline local_lock_t *__local_lock_alias(local_lock_t __percpu *base, local_lock_t *pcpu)
+	__returns_cap(base)
+{
+	return pcpu;
+}
+
 #define INIT_LOCAL_LOCK(lockname) __LOCAL_SPIN_LOCK_UNLOCKED((lockname))
 
 #define __local_lock_init(l)					\
@@ -138,7 +165,7 @@ typedef spinlock_t local_lock_t;
 #define __local_lock(__lock)					\
 	do {							\
 		migrate_disable();				\
-		spin_lock(this_cpu_ptr((__lock)));		\
+		spin_lock(__local_lock_alias(__lock, this_cpu_ptr((__lock)))); \
 	} while (0)
 
 #define __local_lock_irq(lock)			__local_lock(lock)
@@ -152,7 +179,7 @@ typedef spinlock_t local_lock_t;
 
 #define __local_unlock(__lock)					\
 	do {							\
-		spin_unlock(this_cpu_ptr((__lock)));		\
+		spin_unlock(__local_lock_alias(__lock, this_cpu_ptr((__lock)))); \
 		migrate_enable();				\
 	} while (0)
 
@@ -163,12 +190,12 @@ typedef spinlock_t local_lock_t;
 #define __local_lock_nested_bh(lock)				\
 do {								\
 	lockdep_assert_in_softirq_func();			\
-	spin_lock(this_cpu_ptr(lock));				\
+	spin_lock(__local_lock_alias(lock, this_cpu_ptr(lock))); \
 } while (0)
 
 #define __local_unlock_nested_bh(lock)				\
 do {								\
-	spin_unlock(this_cpu_ptr((lock)));			\
+	spin_unlock(__local_lock_alias(lock, this_cpu_ptr((lock)))); \
 } while (0)
 
 #endif /* CONFIG_PREEMPT_RT */
diff --git a/lib/test_capability-analysis.c b/lib/test_capability-analysis.c
index 7ccb163ab5b1..81c8e74548a9 100644
--- a/lib/test_capability-analysis.c
+++ b/lib/test_capability-analysis.c
@@ -6,7 +6,9 @@
 
 #include <linux/bit_spinlock.h>
 #include <linux/build_bug.h>
+#include <linux/local_lock.h>
 #include <linux/mutex.h>
+#include <linux/percpu.h>
 #include <linux/rcupdate.h>
 #include <linux/rwsem.h>
 #include <linux/seqlock.h>
@@ -433,3 +435,47 @@ static void __used test_srcu_guard(struct test_srcu_data *d)
 	guard(srcu)(&d->srcu);
 	(void)srcu_dereference(d->data, &d->srcu);
 }
+
+struct test_local_lock_data {
+	local_lock_t lock;
+	int counter __guarded_by(&lock);
+};
+
+static DEFINE_PER_CPU(struct test_local_lock_data, test_local_lock_data) = {
+	.lock = INIT_LOCAL_LOCK(lock),
+};
+
+static void __used test_local_lock_init(struct test_local_lock_data *d)
+{
+	local_lock_init(&d->lock);
+	d->counter = 0;
+}
+
+static void __used test_local_lock(void)
+{
+	unsigned long flags;
+
+	local_lock(&test_local_lock_data.lock);
+	this_cpu_add(test_local_lock_data.counter, 1);
+	local_unlock(&test_local_lock_data.lock);
+
+	local_lock_irq(&test_local_lock_data.lock);
+	this_cpu_add(test_local_lock_data.counter, 1);
+	local_unlock_irq(&test_local_lock_data.lock);
+
+	local_lock_irqsave(&test_local_lock_data.lock, flags);
+	this_cpu_add(test_local_lock_data.counter, 1);
+	local_unlock_irqrestore(&test_local_lock_data.lock, flags);
+
+	local_lock_nested_bh(&test_local_lock_data.lock);
+	this_cpu_add(test_local_lock_data.counter, 1);
+	local_unlock_nested_bh(&test_local_lock_data.lock);
+}
+
+static void __used test_local_lock_guard(void)
+{
+	{ guard(local_lock)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
+	{ guard(local_lock_irq)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
+	{ guard(local_lock_irqsave)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
+	{ guard(local_lock_nested_bh)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
+}
-- 
2.48.1.711.g2feabab25a-goog

