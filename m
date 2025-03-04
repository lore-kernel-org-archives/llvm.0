Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A37A1FDE03
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080328; cv=none; b=nRpffBZlX/4ZyqqUgoGD9swkvzKSsfW8Ek0QCDUgZ8t7SmCe1s0OuSpRpKrcz62Gu3NUVeNLkgS4jEQCVhj8IVkqoD55cWU087K0vAB+zO7MkEhpK+ZbmxNQIOSJgBuKcasFE7YcHlvCgfJesNNF3AeRrrUUop+lkqz8qBZe8BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080328; c=relaxed/simple;
	bh=c8IW28x9pVJ3uD+41rCTL2BIJUzCYO63UJBK2wSfgWE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k77hb8Zwkqo3OsDu7mJCgmd1kCo9oOaSRG5JbSP2Z9+3ENvrp+9I1Cnkf6EqvZYlMoZZn8HKBZHaoXJsugEv7z4+7EUV51j+05u8GKayABoyAGEZqeQX0vZpIawZX3M9gQvZ/zcbsR/Uhoo/Rwju/yoV6CsZ4MdBUZfeo2+9GmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UIyM2BYl; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UIyM2BYl"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5df498f31ccso6644816a12.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080325; x=1741685125; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=07Wov0mqGRdlTFI57GwZAG7K2eg+AiDKRE973TUpU6Y=;
        b=UIyM2BYlhKkBiEPC2/jRJB16UMn1BIvYRRZsE/NWo1TJCLCKnUJPOmXy8LWa3FiinZ
         9m7+Ug6NRAMiuCmBN8UBWSvGRKobNDhg6nltqsEG4aGWGDZ/GWGtshSowIT9N2RLtDl/
         PZb6MOw1XLXboJNYcJoSn7q9wGbjf3ZchDDfrRsmLrNQdPSVihJcMIwTan/8XYVIb+m0
         GgWBn3XIZpP4zFl4XybFLZFtvrsEBpuyyHpw5gPTNT4QixRFeTkkXRnk6YJrDFnSx3/R
         THpgC2C0kpQncmOs0dSxP/I2zPV1/fFzOstyo4ylq4x504r27EW9iykzZyr/oJadGGP8
         J/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080325; x=1741685125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07Wov0mqGRdlTFI57GwZAG7K2eg+AiDKRE973TUpU6Y=;
        b=VUTG4sKE4cM+K8iUWDuxbA+cCa4+QJ1ZOYPso7YkqRMsGqjXaWOet/TH1puM5y+0LV
         GdmH2YLJsfRePug1WtPvb8dzK2m0vkRnHyCtccaNvhdsZDLt6Wh++w6JDWVVG9JyUqw2
         DWBRnaqaBvnc3MGx7onsMs/hZ1lcTeNWwETw9hCuy/MRTVjzAgbnAnI9dJHqjJzDMB3D
         DCtdvG4LFNnEWSsKPlYZmy91QF7kUZcO46BFIm50Hokm5pSsw37KWFOJPeIjDnUCdNXn
         ZZ4qgUPK89E+Gp2OwsWGBMJsg+UNRumQEGY4wYURW7acIlKDFoyiaeHB7DIFeRAM28vg
         Vlhg==
X-Forwarded-Encrypted: i=1; AJvYcCXRdRx5xYP0BEh/aSxJoBgBs2m9I4SxiTvTScJdrpylyqeNm1dtVhzbjg5ML0B3Z7jlMvyB@lists.linux.dev
X-Gm-Message-State: AOJu0YxG5CMMAJtglK2y7O3D9D947FNCbc5oJa9ImEpG0ZA+qUyh6rCV
	VwVEDA6sIMAO6xUuFP4VU5PiRZe5YouNKLFnI3ElljJLAwCNss0/6DbPR1qixepSvG/CS2dOdw=
	=
X-Google-Smtp-Source: AGHT+IEBgXpXhg9C+r+XZJg0OX31obTvbu83kkqSV+WpLbyK2OQUzgWPpBMR/CJkehpBgNUdfJdDgye1dw==
X-Received: from ejcvg16.prod.google.com ([2002:a17:907:d310:b0:abf:62a3:633f])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:2801:b0:abf:4647:a8cb
 with SMTP id a640c23a62f3a-abf4647a9d8mr1347716166b.44.1741080325134; Tue, 04
 Mar 2025 01:25:25 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:05 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-7-elver@google.com>
Subject: [PATCH v2 06/34] cleanup: Basic compatibility with capability analysis
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
2.48.1.711.g2feabab25a-goog

