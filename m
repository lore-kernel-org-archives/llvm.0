Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7508359FA4
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651566; cv=none; b=lF8qwFb8DaPXut/6ALmChc+Spcffr/1wwjhNDgz16/Zp7VymIvUAQ2yWoXLI61L5qrMFxc6SXuGUCMORCaaT9eGZJWlhkcMt5qi0B6tGSDfvZOms8FDILCGnWQKJWoO3WFPm4D2iwAOCp/xVR5IFIpe6JHhGSqZa2NBjYQro8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651566; c=relaxed/simple;
	bh=y6w7yFFLonXGAgHrhzP0GGTXuB+T66hNiJkaYUhbT3c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wzclcmj5WYkLgwGi53lO0z+g9aKJVc3eRL+TDHuQJxa03qHvDXQbDp/aIZLCA1d2IvpGbn/ypTgB81Msw+qqYOxoHR5eYQYrAx3rE5v9bzbJSvUTly+6hM6Bs6bQkmjicsAynmX6+nnFtBRuZkxEKvXGERc3BC3jlqw/1OSb77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IWd1o198; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IWd1o198"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779b432aecso6109865e9.0
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651548; x=1764256348; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IMqqhFVNLAUw4V1kneJBauR05JGQwrZoFZiIsH/esVM=;
        b=IWd1o198YXyxh9aEczsnbsqQhKSzPq3d6nh/7SY4EJVIWaMkC21/ngKw+V/e6BPUkT
         y4bZSyZLegNqaLiul1Frpmwr97bl2jNPfsdHFZn5sVD9odGG2j87LanlCRxdme7yMWrX
         WGNdvSZzknyxIVZfciYpFIMkQQ7FJgk8xf2B4wWDG/Rxvw3HVM4KDlMy/0cKm6cNaNFU
         KDZRahAxtuzEh6Xax+1O7KX1IkzMrq9i+wl8F+CsFXbxdjce8G6+k1xCEaBIHRkWM5JI
         w47e8cl1RqrLq7VgnxHbMwKmlpkAeQI5CVrfsJl6TF1XO3en1scEZEqlqJQQMcwZgwl6
         psYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651548; x=1764256348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMqqhFVNLAUw4V1kneJBauR05JGQwrZoFZiIsH/esVM=;
        b=SMenBQFI639f8wVaepY0cJi7KlVpoi45MxV/gPmDDDpJkvL7PmJnW/JCP2a9Ld0GfW
         ddfUaJWWQoy+9RQJmYIxsEMpwQ7qPlmUd5NOdmUFOR7I2C5Rek2Lvsfu4NBhJOLPAWFU
         pa6y/iCz7oiFsqUuvL/cMNvHicUjtiwanfchy0bMoBeUDc5Lp/H53bdKF7uxotLXgMEj
         hprbV9bGRwObtxTpKk7bCkqp/r/G4hBeoCnbYFMNKQjCRB8RNOxBYnX904w2Yicj5rgA
         cyThrM1BdjiHfICzQH1zugw5aMkvGfREDRr7l6Ik70qoScNURE8U8vrzFrnSgqPPGohd
         9GtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrGQeF7y878I9HHorosKuTAiJW9I5g7/S9l/5drlCfYYaR5r/OK8f1Ik0e8hwETDUY3tkk@lists.linux.dev
X-Gm-Message-State: AOJu0YzOI3Zqi1tIgW8gTQy/aWHTEsA/Qu6473oxnnlK9rNARTeWDUxO
	s/VVbk0DHpSaqM9UMdg/Yu+RjWW1cKcqNpZMmA0pn1imcmrWSyC7abgMXwcFshGZVpCBY7aKnvO
	qOg==
X-Google-Smtp-Source: AGHT+IF2zd2nCypWW3xVuzIPJvJqZO4w5aeyOpnB4ViuWbndz94zzjGIlhjCu+pGCOqCDC+J6F1KwZFxwQ==
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:477:afa:d217])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b16:b0:477:632a:fd67
 with SMTP id 5b1f17b1804b1-477b895407bmr35716765e9.12.1763651547909; Thu, 20
 Nov 2025 07:12:27 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:38 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-14-elver@google.com>
Subject: [PATCH v4 13/35] bit_spinlock: Support Clang's context analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The annotations for bit_spinlock.h have simply been using "bitlock" as
the token. For Sparse, that was likely sufficient in most cases. But
Clang's context analysis is more precise, and we need to ensure we
can distinguish different bitlocks.

To do so, add a token context, and a macro __bitlock(bitnum, addr)
that is used to construct unique per-bitlock tokens.

Add the appropriate test.

<linux/list_bl.h> is implicitly included through other includes, and
requires 2 annotations to indicate that acquisition (without release)
and release (without prior acquisition) of its bitlock is intended.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.
---
 Documentation/dev-tools/context-analysis.rst |  3 ++-
 include/linux/bit_spinlock.h                 | 22 ++++++++++++++---
 include/linux/list_bl.h                      |  2 ++
 lib/test_context-analysis.c                  | 26 ++++++++++++++++++++
 4 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation/dev-tools/context-analysis.rst
index 598962f6cb40..a3d925ce2df4 100644
--- a/Documentation/dev-tools/context-analysis.rst
+++ b/Documentation/dev-tools/context-analysis.rst
@@ -80,7 +80,8 @@ Supported Kernel Primitives
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Currently the following synchronization primitives are supported:
-`raw_spinlock_t`, `spinlock_t`, `rwlock_t`, `mutex`, `seqlock_t`.
+`raw_spinlock_t`, `spinlock_t`, `rwlock_t`, `mutex`, `seqlock_t`,
+`bit_spinlock`.
 
 For context guards with an initialization function (e.g., `spin_lock_init()`),
 calling this function before initializing any guarded members or globals
diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index 59e345f74b0e..07593d9003d5 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -9,6 +9,16 @@
 
 #include <asm/processor.h>  /* for cpu_relax() */
 
+/*
+ * For static context analysis, we need a unique token for each possible bit
+ * that can be used as a bit_spinlock. The easiest way to do that is to create a
+ * fake context that we can cast to with the __bitlock(bitnum, addr) macro
+ * below, which will give us unique instances for each (bit, addr) pair that the
+ * static analysis can use.
+ */
+context_guard_struct(__context_bitlock) { };
+#define __bitlock(bitnum, addr) (struct __context_bitlock *)(bitnum + (addr))
+
 /*
  *  bit-based spin_lock()
  *
@@ -16,6 +26,7 @@
  * are significantly faster.
  */
 static __always_inline void bit_spin_lock(int bitnum, unsigned long *addr)
+	__acquires(__bitlock(bitnum, addr))
 {
 	/*
 	 * Assuming the lock is uncontended, this never enters
@@ -34,13 +45,14 @@ static __always_inline void bit_spin_lock(int bitnum, unsigned long *addr)
 		preempt_disable();
 	}
 #endif
-	__acquire(bitlock);
+	__acquire(__bitlock(bitnum, addr));
 }
 
 /*
  * Return true if it was acquired
  */
 static __always_inline int bit_spin_trylock(int bitnum, unsigned long *addr)
+	__cond_acquires(true, __bitlock(bitnum, addr))
 {
 	preempt_disable();
 #if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
@@ -49,7 +61,7 @@ static __always_inline int bit_spin_trylock(int bitnum, unsigned long *addr)
 		return 0;
 	}
 #endif
-	__acquire(bitlock);
+	__acquire(__bitlock(bitnum, addr));
 	return 1;
 }
 
@@ -57,6 +69,7 @@ static __always_inline int bit_spin_trylock(int bitnum, unsigned long *addr)
  *  bit-based spin_unlock()
  */
 static __always_inline void bit_spin_unlock(int bitnum, unsigned long *addr)
+	__releases(__bitlock(bitnum, addr))
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
 	BUG_ON(!test_bit(bitnum, addr));
@@ -65,7 +78,7 @@ static __always_inline void bit_spin_unlock(int bitnum, unsigned long *addr)
 	clear_bit_unlock(bitnum, addr);
 #endif
 	preempt_enable();
-	__release(bitlock);
+	__release(__bitlock(bitnum, addr));
 }
 
 /*
@@ -74,6 +87,7 @@ static __always_inline void bit_spin_unlock(int bitnum, unsigned long *addr)
  *  protecting the rest of the flags in the word.
  */
 static __always_inline void __bit_spin_unlock(int bitnum, unsigned long *addr)
+	__releases(__bitlock(bitnum, addr))
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
 	BUG_ON(!test_bit(bitnum, addr));
@@ -82,7 +96,7 @@ static __always_inline void __bit_spin_unlock(int bitnum, unsigned long *addr)
 	__clear_bit_unlock(bitnum, addr);
 #endif
 	preempt_enable();
-	__release(bitlock);
+	__release(__bitlock(bitnum, addr));
 }
 
 /*
diff --git a/include/linux/list_bl.h b/include/linux/list_bl.h
index ae1b541446c9..df9eebe6afca 100644
--- a/include/linux/list_bl.h
+++ b/include/linux/list_bl.h
@@ -144,11 +144,13 @@ static inline void hlist_bl_del_init(struct hlist_bl_node *n)
 }
 
 static inline void hlist_bl_lock(struct hlist_bl_head *b)
+	__acquires(__bitlock(0, b))
 {
 	bit_spin_lock(0, (unsigned long *)b);
 }
 
 static inline void hlist_bl_unlock(struct hlist_bl_head *b)
+	__releases(__bitlock(0, b))
 {
 	__bit_spin_unlock(0, (unsigned long *)b);
 }
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 59c6642c582e..77e599a9281b 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -4,6 +4,7 @@
  * positive errors when compiled with Clang's context analysis.
  */
 
+#include <linux/bit_spinlock.h>
 #include <linux/build_bug.h>
 #include <linux/mutex.h>
 #include <linux/seqlock.h>
@@ -251,3 +252,28 @@ static void __used test_seqlock_writer(struct test_seqlock_data *d)
 	d->counter++;
 	write_sequnlock_irqrestore(&d->sl, flags);
 }
+
+struct test_bit_spinlock_data {
+	unsigned long bits;
+	int counter __guarded_by(__bitlock(3, &bits));
+};
+
+static void __used test_bit_spin_lock(struct test_bit_spinlock_data *d)
+{
+	/*
+	 * Note, the analysis seems to have false negatives, because it won't
+	 * precisely recognize the bit of the fake __bitlock() token.
+	 */
+	bit_spin_lock(3, &d->bits);
+	d->counter++;
+	bit_spin_unlock(3, &d->bits);
+
+	bit_spin_lock(3, &d->bits);
+	d->counter++;
+	__bit_spin_unlock(3, &d->bits);
+
+	if (bit_spin_trylock(3, &d->bits)) {
+		d->counter++;
+		bit_spin_unlock(3, &d->bits);
+	}
+}
-- 
2.52.0.rc1.455.g30608eb744-goog

