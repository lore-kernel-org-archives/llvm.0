Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2909F1DFDAF
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865887; cv=none; b=YHOQjGqnJ3NLO7TWW5tpM6W3IzXCqgZzlQF4Cxvcx0yZZRHN7pmOUdFVjKJN+rZ36BmNqOyBzpv54CvQlCPhonEWGbnp5XneksRwe78s3ewQ2/cSDcqYsD98w8XUvPwATu9YoSGqLBPjrbGiDLVzaUUOurjhP0dQl/uQSl/Jhxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865887; c=relaxed/simple;
	bh=nbrPwXyZS1EvTzB5y+SypJlT/s4PiDMg7VB+pOJqZ2M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LjccAsaa/a4WuW+9vL6chujZP/P7i2dfqQnfgFzRO0vVZh4iMZ3DARoaeJpfwoPLRKm8UjdgcSxX/gF1OiT29rouuimrPaarQC24oOulncVJ8xkOQv0YBQXSR6At2W6IcY4/MEPBD3pZZKJpg91KrYip8H7TaBUrPQ/dC86GcUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UyJ4zOX5; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UyJ4zOX5"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-aaf901a0ef9so137776566b.0
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738865883; x=1739470683; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DbQd0Feo/QZz3Rhlb0Ii9wR2JgNHixpKT0msEk4JbI=;
        b=UyJ4zOX5TljiE2529e29j45fPK2eP6O8GzdpZTzZrpsWxDzxhfWR3SpTc21r2v1j8d
         H2NaftF2WZuYcuX6iDQvjM/+c8OipCUA5qUkNycqrYxDM/LnLWJG9hxIc82vL2owwIYz
         rNwE27FcTYH7MzrzU2tMu7+G8EBXQtsVBeujwuxJMUTVlAbuPd/BQbKLPOtOKxcftOKM
         /4YTxM8jvSlS3UUHKMjuHdaVF2A6FKWjOx22tSRyuk2KZyr7ox9WeJQzf1xTZko5uN24
         XkRIN2Seu7/834WOz94hVqIeV+lXY5pN7dxw9EcaAOqUjR2QvOVGovAYXk4enzyQdm82
         +79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865883; x=1739470683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DbQd0Feo/QZz3Rhlb0Ii9wR2JgNHixpKT0msEk4JbI=;
        b=vXLLNKL3tWpnHwSYAbDOzlB+nt89CwqteZIOA384v1AXDISHJNJ3VfTYBCl+ZWF76/
         D07h6PlPxO/MS4SOaNuRgO4z9EW9RwnYZQoo8FyxV5WsyTn6yToVnEKWha3EpqKbybdm
         ocndVMSlpTGsOxK0tvb7xied8aLZIMpB4w6YTSU3+hUsLPevNIuDrqhCWpmWjZH4Wx9n
         kRPKtejFOXLw5SKhr+8jkTaXn5K5JgbuXPQww8vKOYHNjU7HttSi5K2IpAZ2YuApwRc6
         5D6/YG6Q72qCNhb9HtGkmiJXegatxNGt0YtsoqNdUIkpqe+MgL40KqXQIS44dPyRYT0L
         0Fsw==
X-Forwarded-Encrypted: i=1; AJvYcCULmLyDwCsqSmQX+yWqxW+ouMNw+RaXBxhPSPHeKtySzWR22cRWW+Sbbr6DXpi6Et9brPhC@lists.linux.dev
X-Gm-Message-State: AOJu0YybztNC++h+oP6Gx9rlu7VvRp9ZyBTEeGrQD9dzXe7IwShUQ8ic
	RsAlHFgP/Vl+JD0OZvyRtVrNydkKh0kMEfmCsMGmM65vfENskdmb4lVlt1dbdFYWRayL1Kk0Ew=
	=
X-Google-Smtp-Source: AGHT+IEpKrf/iQkrY6KOXq/iYZBQV1l1pAnmjhSh7YEqml+QLzZmS4/pcVjkplICVk/aelHvFs7D7YrXFw==
X-Received: from edbes17.prod.google.com ([2002:a05:6402:3811:b0:5d8:7c8:cde8])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7251:b0:aa6:6885:e2f0
 with SMTP id a640c23a62f3a-ab75e35de7emr916219966b.46.1738865883628; Thu, 06
 Feb 2025 10:18:03 -0800 (PST)
Date: Thu,  6 Feb 2025 19:10:01 +0100
In-Reply-To: <20250206181711.1902989-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206181711.1902989-8-elver@google.com>
Subject: [PATCH RFC 07/24] cleanup: Basic compatibility with capability analysis
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Due to the scoped cleanup helpers used for lock guards wrapping
acquire/release around their own constructors/destructors that store
pointers to the passed locks in a separate struct, we currently cannot
accurately annotate *destructors* which lock was released. While it's
possible to annotate the constructor to say which lock was acquired,
that alone would result in false positives claiming the lock was not
released on function return.

Instead, to avoid false positives, we can claim that the constructor
"asserts" that the taken lock is held. This will ensure we can still
benefit from the analysis where scoped guards are used to protect access
to guarded variables, while avoiding false positives. The only downside
are false negatives where we might accidentally lock the same lock
again:

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
 include/linux/cleanup.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index ec00e3f7af2b..93a166549add 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -223,7 +223,7 @@ const volatile void * __must_check_fn(const volatile void *val)
  *	@exit is an expression using '_T' -- similar to FREE above.
  *	@init is an expression in @init_args resulting in @type
  *
- * EXTEND_CLASS(name, ext, init, init_args...):
+ * EXTEND_CLASS(name, ext, ctor_attrs, init, init_args...):
  *	extends class @name to @name@ext with the new constructor
  *
  * CLASS(name, var)(args...):
@@ -243,15 +243,18 @@ const volatile void * __must_check_fn(const volatile void *val)
 #define DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)		\
 typedef _type class_##_name##_t;					\
 static inline void class_##_name##_destructor(_type *p)			\
+	__no_capability_analysis					\
 { _type _T = *p; _exit; }						\
 static inline _type class_##_name##_constructor(_init_args)		\
+	__no_capability_analysis					\
 { _type t = _init; return t; }
 
-#define EXTEND_CLASS(_name, ext, _init, _init_args...)			\
+#define EXTEND_CLASS(_name, ext, ctor_attrs, _init, _init_args...)		\
 typedef class_##_name##_t class_##_name##ext##_t;			\
 static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
 { class_##_name##_destructor(p); }					\
 static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
+	__no_capability_analysis ctor_attrs					\
 { class_##_name##_t t = _init; return t; }
 
 #define CLASS(_name, var)						\
@@ -299,7 +302,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
 
 #define DEFINE_GUARD_COND(_name, _ext, _condlock) \
 	__DEFINE_CLASS_IS_CONDITIONAL(_name##_ext, true); \
-	EXTEND_CLASS(_name, _ext, \
+	EXTEND_CLASS(_name, _ext,, \
 		     ({ void *_t = _T; if (_T && !(_condlock)) _t = NULL; _t; }), \
 		     class_##_name##_t _T) \
 	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *_T) \
@@ -371,6 +374,7 @@ typedef struct {							\
 } class_##_name##_t;							\
 									\
 static inline void class_##_name##_destructor(class_##_name##_t *_T)	\
+	__no_capability_analysis					\
 {									\
 	if (_T->lock) { _unlock; }					\
 }									\
@@ -383,6 +387,7 @@ static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)	\
 
 #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)			\
 static inline class_##_name##_t class_##_name##_constructor(_type *l)	\
+	__no_capability_analysis __asserts_cap(l)			\
 {									\
 	class_##_name##_t _t = { .lock = l }, *_T = &_t;		\
 	_lock;								\
@@ -391,6 +396,7 @@ static inline class_##_name##_t class_##_name##_constructor(_type *l)	\
 
 #define __DEFINE_LOCK_GUARD_0(_name, _lock)				\
 static inline class_##_name##_t class_##_name##_constructor(void)	\
+	__no_capability_analysis					\
 {									\
 	class_##_name##_t _t = { .lock = (void*)1 },			\
 			 *_T __maybe_unused = &_t;			\
@@ -410,7 +416,7 @@ __DEFINE_LOCK_GUARD_0(_name, _lock)
 
 #define DEFINE_LOCK_GUARD_1_COND(_name, _ext, _condlock)		\
 	__DEFINE_CLASS_IS_CONDITIONAL(_name##_ext, true);		\
-	EXTEND_CLASS(_name, _ext,					\
+	EXTEND_CLASS(_name, _ext, __asserts_cap(l),			\
 		     ({ class_##_name##_t _t = { .lock = l }, *_T = &_t;\
 		        if (_T->lock && !(_condlock)) _T->lock = NULL;	\
 			_t; }),						\
-- 
2.48.1.502.g6dc24dfdaf-goog

