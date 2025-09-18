Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2830CD90
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204347; cv=none; b=iFH0DMF+nBU6IWV9UI1oG6vBk78RV3tsG2rb4Att6GSwvVAlqSodazy4daBb8vyNjn2TBb9XJUjZtdv4HpzwHIGZzbk+codieBuikUGJLCQywWgx5hsH6X+F0JtLod5KlOnUrG+zmIS2WCAotl9YsB0s+O/NR+qTb17kJZT7GiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204347; c=relaxed/simple;
	bh=SpXjZaCjy1x0daUBiuysZq16feeBwiZs5t3P+YC87y4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eJggpBkVdGHlXqmnHsY96q4i3gOb5pxh6JVPZykRQC0BuVMUcG6yBmjAjJHTXYdHgt6d+kpkdXYRFiQRRmxpLuObdA90qFNkZTVx6bGuoyhrf+w5G8kClB7pvVr0dcC5WUDB5d2E3T9euPU2geGbg/j9WFpY00Eu6qMSF59yAjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YX/qR5ev; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YX/qR5ev"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b0438a5f20fso87657366b.3
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204343; x=1758809143; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UhQ+U9se/SSPfFCtaRf+8xWbg1y5S3svPblZWk1KYzo=;
        b=YX/qR5evdEuLndmOcBorAbdw4IEhBxtOucdBpK1skrERLWMr4gwaJ+ZjbhGnCq+Ejq
         sVKfitEjgw5X5WwMvESlJK/HVMqE9F9uuYuvXyCRbr+VVdbyW30NoUJP1JqYCKgo0NX9
         Ot0NkD+wHAbdyM7uXu8E65qnUzNARN5Asq3eWPwv5OVfliLSUxVQId/u4MaUapYR6uju
         EdJc3YstI2Q5JLSVdRfXG6Eoqg3rcLbecC/q4Xz8qC/w82HlZIAoBpCQSwz4snMGdmsk
         UdyNr5DC1J9F9XqgQ1Ih8N+jJpKjc5aR2XsCn45lCi6IRF7Tll+35MQX6KzrIx5ak4HL
         PJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204343; x=1758809143;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhQ+U9se/SSPfFCtaRf+8xWbg1y5S3svPblZWk1KYzo=;
        b=mVNRFI60SUyGUjeCT2A3BRndxQ6lyoMe6qwwOGs3T23NDF1evjDwWKYScUI+RRahOQ
         uTb8QWoYyC9C2F4xb7Z97VByn/l66SHc8hqtxeEQeg8Jo/2KBsgN+fS4gynPR6JIp+qG
         EN+NJN8UG8OAvf4nCoiCbEYqLtyuDLmxCuTEk3jaCZKQKvVycnJZ2eO0Qp0Th2p/V2zs
         kb1N95ZJAEzHBaAq0PUcKAgMnF5XVpnFJIZQcAYvUDLULLwAAFSS9K5dT3h0Dx8F5qEN
         xaQ24mj8U9OzBF7fV20pWiUyz662zCBskNOXE1zZGJw7SleI0VfrWAFr7b9FX31VTY1g
         sjXw==
X-Forwarded-Encrypted: i=1; AJvYcCW1zZs2yoGzWEPSeVMgERlQKF8Bg1XUBDKcAHig3VBnbrR/zb1axNXHHIPDwFOkUQJnJLz+@lists.linux.dev
X-Gm-Message-State: AOJu0YyHwM1RH4Y4jEdlo0BEgXbQSQfoBlouCVew/W2SGBO1qKsgpAa+
	3PbcJt93rSx9nqeooHrfn/Ro3Qegm3PKts4kQhchbRBx/BZW6PBqnU8npejeJE0XiEotdeqH1Gq
	mMg==
X-Google-Smtp-Source: AGHT+IHx20k8wpv+0CdEL8tKSP3AAmnqjSsLU77F74q4U9IVeOOTYh+6Sm2wrNtaQlemdoGnkvfY1U7RLg==
X-Received: from ejcth16.prod.google.com ([2002:a17:907:8e10:b0:b07:e1ab:ac42])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:86a0:b0:b07:dbf9:a002
 with SMTP id a640c23a62f3a-b1bba0036fcmr627925566b.47.1758204342817; Thu, 18
 Sep 2025 07:05:42 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:17 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-7-elver@google.com>
Subject: [PATCH v3 06/35] cleanup: Basic compatibility with capability analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Introduce basic compatibility with cleanup.h infrastructure: introduce
DECLARE_LOCK_GUARD_*_ATTRS() helpers to add attributes to constructors
and destructors respectively.

Note: Due to the scoped cleanup helpers used for lock guards wrapping
acquire and release around their own constructors/destructors that store
pointers to the passed locks in a separate struct, we currently cannot
accurately annotate *destructors* which lock was released. While it's
possible to annotate the constructor to say which lock was acquired,
that alone would result in false positives claiming the lock was not
released on function return.

Instead, to avoid false positives, we can claim that the constructor
"assumes" that the taken lock is held via __assumes_cap().

This will ensure we can still benefit from the analysis where scoped
guards are used to protect access to guarded variables, while avoiding
false positives. The only downside are false negatives where we might
accidentally lock the same lock again:

	raw_spin_lock(&my_lock);
	...
	guard(raw_spinlock)(&my_lock);  // no warning

Arguably, lockdep will immediately catch issues like this.

While Clang's analysis supports scoped guards in C++ [1], there's no way
to apply this to C right now. Better support for Linux's scoped guard
design could be added in future if deemed critical.

[1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#scoped-capability

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Add *_ATTRS helpers instead of implicit __assumes_cap (suggested by Peter)
* __assert -> __assume rename
---
 include/linux/cleanup.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 2573585b7f06..54fc70d8da27 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -274,16 +274,21 @@ const volatile void * __must_check_fn(const volatile void *val)
 
 #define DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)		\
 typedef _type class_##_name##_t;					\
+typedef _type lock_##_name##_t;						\
 static inline void class_##_name##_destructor(_type *p)			\
+	__no_capability_analysis					\
 { _type _T = *p; _exit; }						\
 static inline _type class_##_name##_constructor(_init_args)		\
+	__no_capability_analysis					\
 { _type t = _init; return t; }
 
 #define EXTEND_CLASS(_name, ext, _init, _init_args...)			\
+typedef lock_##_name##_t lock_##_name##ext##_t;				\
 typedef class_##_name##_t class_##_name##ext##_t;			\
 static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
 { class_##_name##_destructor(p); }					\
 static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
+	__no_capability_analysis \
 { class_##_name##_t t = _init; return t; }
 
 #define CLASS(_name, var)						\
@@ -461,12 +466,14 @@ _label:									\
  */
 
 #define __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, ...)		\
+typedef _type lock_##_name##_t;						\
 typedef struct {							\
 	_type *lock;							\
 	__VA_ARGS__;							\
 } class_##_name##_t;							\
 									\
 static inline void class_##_name##_destructor(class_##_name##_t *_T)	\
+	__no_capability_analysis					\
 {									\
 	if (!__GUARD_IS_ERR(_T->lock)) { _unlock; }			\
 }									\
@@ -475,6 +482,7 @@ __DEFINE_GUARD_LOCK_PTR(_name, &_T->lock)
 
 #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)			\
 static inline class_##_name##_t class_##_name##_constructor(_type *l)	\
+	__no_capability_analysis 					\
 {									\
 	class_##_name##_t _t = { .lock = l }, *_T = &_t;		\
 	_lock;								\
@@ -483,6 +491,7 @@ static inline class_##_name##_t class_##_name##_constructor(_type *l)	\
 
 #define __DEFINE_LOCK_GUARD_0(_name, _lock)				\
 static inline class_##_name##_t class_##_name##_constructor(void)	\
+	__no_capability_analysis					\
 {									\
 	class_##_name##_t _t = { .lock = (void*)1 },			\
 			 *_T __maybe_unused = &_t;			\
@@ -490,6 +499,14 @@ static inline class_##_name##_t class_##_name##_constructor(void)	\
 	return _t;							\
 }
 
+#define DECLARE_LOCK_GUARD_0_ATTRS(_name, _lock, _unlock)		\
+static inline class_##_name##_t class_##_name##_constructor(void) _lock;\
+static inline void class_##_name##_destructor(class_##_name##_t *_T) _unlock;
+
+#define DECLARE_LOCK_GUARD_1_ATTRS(_name, _lock, _unlock)		\
+static inline class_##_name##_t class_##_name##_constructor(lock_##_name##_t *_T) _lock;\
+static inline void class_##_name##_destructor(class_##_name##_t *_T) _unlock;
+
 #define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)		\
 __DEFINE_CLASS_IS_CONDITIONAL(_name, false);				\
 __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)		\
-- 
2.51.0.384.g4c02a37b29-goog

