Received: from mail-lf1-f74.google.com (mail-lf1-f74.google.com [209.85.167.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3E5361DB6
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651935; cv=none; b=eYDzFd2YaC3/iBuYSlDsiwmal8XnfYjCSUengemIjNKCL9zREqFffHyn0NPbbn1x/wxS9kdakhTZVy/ZPEGVMtvfii5DWwPk7osO/+reBnJryPTWxsDKRQZRw+TSZdWItvPr2oFLGX7OQ/g2mTw7MRVxliNIPJ89CMd/LywrIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651935; c=relaxed/simple;
	bh=EwfXd6yRg4bFKtUUrXe0W+ENNOKQmqy6Ot7CBhxbXoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RwsHNl5e+txtNcQcB5PIUNjfuK3q1F8SYMKOcBR1kqpH4w4wjTsP7Q+OxlcKVomSAreIAkqqssU92L0ubz7OeMSPngfIGwQLZ7QGd10r7ayaiF24H2wlVFotB32jrsShJyGxz73A2hEIqqlXgH5C/IiXoa3EswviKIzLqTsj5xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YtR/OvNs; arc=none smtp.client-ip=209.85.167.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YtR/OvNs"
Received: by mail-lf1-f74.google.com with SMTP id 2adb3069b0e04-57b9c463726so574123e87.1
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651928; x=1764256728; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sW5aRQBUT1YS/p7X2M8vu94/jdaGEDQWZc189ONsN2k=;
        b=YtR/OvNsNY2ezenXj+tDEdOlt1ErExItMDXcW8xCGfcu+V/eEP5GzLs0XEviEb8WS3
         amRGgTj8bM4WvwbM2Cn3/X5b74SePufRFeHIfv1g7PfxB82mCAEU4wTidnb476g5o6Jg
         Wvwy8Q1wPzVt+trAbiDH/MwyWtS8sBbngTvJ7+BuLkyeG5dO605TM2i4QcEXn/R8Dyy9
         XmgLe9iWdTJSF8HwSGe4ZYo18wZb1bOnyG/5nldrDDFNS7nxdCCHQYizJEk2elFYdC8P
         7ExsCNik14bJQb5zCX5O3fS0SktCVW7P81PdeSqfExeh640voT5kab3QAGwvIvjg2vHD
         mNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651928; x=1764256728;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sW5aRQBUT1YS/p7X2M8vu94/jdaGEDQWZc189ONsN2k=;
        b=htvRmMsHGThJ0EGe5E745vZInH9w+ATGpmjJhO3tJQBFN6JjH65fuNsWzq7fKSoSc8
         8SCUfdV6EQ8VeLrUA8lvjmM4ZMrr/lTj9nCMwewXy0OO1hXz8AgxyMM+XLDozRpbUaCl
         enV3iBqyn0GzHdUvFLFrRBsRj1+Wtq5jh1CyRVbErfkTLYnBWwoaCvzU0VQx7Ewilj7K
         qDmnhH4nABy9yTmFc08Humx0A654V38SCrmEZYfOwW6oqsKno7Pj6GwkyCrgP+K7K0iz
         tLtS87NuxdXwy/bcE5nMI0V0GWbTWa7orhyfHPXgmwFLNRxg8tfP7DADwBUE7tWC1+zw
         Nj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVnplFqrFrfUXmTDpiPtsBJGx/xu1i3Uo51suTSpYcqISg2kiwmZElpsXpHEXyPddwSwsS@lists.linux.dev
X-Gm-Message-State: AOJu0YyZMPkynlKbLk0WkQUKMZtpXgepstFCjMwwUE/xzVqOnkO5FMQg
	kjcBfpizJ0utRN+T0Ibq7Qd730/WBMIZqJTu9e0kA5LY+a5kfHIuoZgiGw1TfKkaGt6E5NyvYH3
	ATw==
X-Google-Smtp-Source: AGHT+IER1f7gc9WQ7LnpbrPIA/y0BLZGbO4bUsdn+Ne1pOxE592x9Yu2PvTpMRh0Noc8+8JrQHGkxnvByA==
X-Received: from wrsz10.prod.google.com ([2002:a5d:4c8a:0:b0:42b:3a01:7808])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:adf:f290:0:b0:42b:3e0a:64b7
 with SMTP id ffacd0b85a97d-42cb9a560c2mr2413997f8f.53.1763651508025; Thu, 20
 Nov 2025 07:11:48 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:32 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-8-elver@google.com>
Subject: [PATCH v4 07/35] lockdep: Annotate lockdep assertions for context analysis
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

Clang's context analysis can be made aware of functions that assert that
locks are held.

Presence of these annotations causes the analysis to assume the context
guard is held after calls to the annotated function, and avoid false
positives with complex control-flow; for example, where not all
control-flow paths in a function require a held lock, and therefore
marking the function with __must_hold(..) is inappropriate.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.

v3:
* __assert -> __assume rename
---
 include/linux/lockdep.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 67964dc4db95..2c99a6823161 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
 #define lockdep_assert_held(l)		\
-	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+	do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_guard(l); } while (0)
 
 #define lockdep_assert_not_held(l)	\
 	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
 #define lockdep_assert_held_write(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 0))
+	do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_ctx_guard(l); } while (0)
 
 #define lockdep_assert_held_read(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 1))
+	do { lockdep_assert(lockdep_is_held_type(l, 1)); __assume_shared_ctx_guard(l); } while (0)
 
 #define lockdep_assert_held_once(l)		\
 	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
@@ -389,10 +389,10 @@ extern int lockdep_is_held(const void *);
 #define lockdep_assert(c)			do { } while (0)
 #define lockdep_assert_once(c)			do { } while (0)
 
-#define lockdep_assert_held(l)			do { (void)(l); } while (0)
+#define lockdep_assert_held(l)			__assume_ctx_guard(l)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		__assume_ctx_guard(l)
+#define lockdep_assert_held_read(l)		__assume_shared_ctx_guard(l)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 #define lockdep_assert_none_held_once()	do { } while (0)
 
-- 
2.52.0.rc1.455.g30608eb744-goog

