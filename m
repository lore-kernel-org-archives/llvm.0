Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E222334FF59
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159253; cv=none; b=nF2Qn9xwjBtS0ntpFTMGf8Cn05otb7UDm3OruzdVbYl86/WhoKv+xLaxHKSgRCNATk0stDq7fy5eS+Kp0GL60FlRAAPjWYVQFL+4qU4iu5PBPZIBYZvZlD7BoUuhbPnJ/5xL3Itv+clYnhpJjt7+xdYR2W6xY/PQ4RwiFoB0cDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159253; c=relaxed/simple;
	bh=42FYH4YydcI8JRQNr8EFVNHBN8JBHnU8gH/4zTSZoQU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=upM2fuXYBrN06BYKe+tukfIswISSnXoYJmhhUdy1AVHF55SZqCQuOqbt9d/o6CeGA4nELPmcCYN+YVdyYxb6JJNE2wusudut5+3bpjFrp260Gi58gFiCJ9u6lHgvi0dX5iNbi5TlufTCvH6RtMp94yfITJv7IKHMiZt/qtu2hHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TqdrQRFu; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TqdrQRFu"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64c90e9b0faso239829a12.0
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159249; x=1766764049; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4XK3qzntTZnJieCCKu4A/HzWNSoArWneMhDpC7gb9Kg=;
        b=TqdrQRFu6WDTTFTORg+LwbybD3MVOS6jeLietY43adJp/aduxNhP++OW4Fkw33OrMM
         LbjAUOvJCfoJNSEjX76EGljlgB9ajG1C5JMfEdJBtvjC3BIaG1vVumTfNmrW09vU0wKM
         Kk22L4sQ6/cigsF+K1IDdh+ZOd7rcM1fV9HE60cWpCtUgCBDxQZlKU2QotQ6JDICbUBw
         ndiQEBzsksX0+p4HaNcsMFZppPPLeFDZI4HfVcyR2cPZ7C61UB4RODIX3Y8SZqpPVJkH
         F9/5W8g33h2njdBzvNawDNv9ttCeMHnDf5S1gwV4e954biOO7X9TCe1eRbOo8QkJy+7O
         sWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159249; x=1766764049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XK3qzntTZnJieCCKu4A/HzWNSoArWneMhDpC7gb9Kg=;
        b=bdHG7Kk7CZQOuUJp0WJxf8fNY58bCCplUmGCK5fahTbcpDiGnml0M3/wyG8kz9IfLA
         CR08sQCaIgt2KT8Iq53pGLorVaMUZEFHIgwgd6fEZYVz2yMEuYSDSlg+IoD9uOS/O+Wi
         tEup4+/QpF1fY61RO7prQhQB9Bv1zfw0DW/6Kk5vN+gOdOd3y1nc8m7dGLpSUXC1vXA6
         xHO0/WmB40+XBYaYMpsne4Zgg8UWTFRj70J9plqLLZf9XiecffWpek3CYfB0XMG7xcEI
         pJkbl5OLE4r2fFqpKTPY688OL0KNhKy173TUBR3bIsw7I+iH4jMtbi4VQT/7qB0dcP9R
         WIDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBj0mEVuFHZ5CuyOYv2xmUS3bCP75Fj8k97UY17B31NptkuFxHCKQ4kxwpDQdXHVOZq73N@lists.linux.dev
X-Gm-Message-State: AOJu0YxJYtNfQhlSQzfBpgO5Sx1jo7R8hw+RfTms78IOKue4aQ+35XPG
	HHLd5W152Ax4B3/B4kVd+9IOch3YXx29n/H13L/0gW5FSWqNbD1uFojDlPfD5hyCiIOyMr768eN
	Fbw==
X-Google-Smtp-Source: AGHT+IHX5UXwk2F+9TvQVKLp2kAzUS4yz1dfz5S20YIyCpvaeeaogsyAn1dyrJKuFHxwFv13c6Ax3+QEyg==
X-Received: from edpr3.prod.google.com ([2002:aa7:c143:0:b0:64b:9f62:a079])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:d62:b0:64b:993f:ce06
 with SMTP id 4fb4d7f45d1cf-64b993fd097mr1762424a12.32.1766159249192; Fri, 19
 Dec 2025 07:47:29 -0800 (PST)
Date: Fri, 19 Dec 2025 16:40:20 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-32-elver@google.com>
Subject: [PATCH v5 31/36] stackdepot: Enable context analysis
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

Enable context analysis for stackdepot.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.

v2:
* Remove disable/enable_context_analysis() around headers.
---
 lib/Makefile     |  1 +
 lib/stackdepot.c | 20 ++++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index 89defefbf6c0..e755eee4e76f 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -250,6 +250,7 @@ obj-$(CONFIG_POLYNOMIAL) += polynomial.o
 # Prevent the compiler from calling builtins like memcmp() or bcmp() from this
 # file.
 CFLAGS_stackdepot.o += -fno-builtin
+CONTEXT_ANALYSIS_stackdepot.o := y
 obj-$(CONFIG_STACKDEPOT) += stackdepot.o
 KASAN_SANITIZE_stackdepot.o := n
 # In particular, instrumenting stackdepot.c with KMSAN will result in infinite
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index de0b0025af2b..166f50ad8391 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -61,18 +61,18 @@ static unsigned int stack_bucket_number_order;
 /* Hash mask for indexing the table. */
 static unsigned int stack_hash_mask;
 
+/* The lock must be held when performing pool or freelist modifications. */
+static DEFINE_RAW_SPINLOCK(pool_lock);
 /* Array of memory regions that store stack records. */
-static void **stack_pools;
+static void **stack_pools __pt_guarded_by(&pool_lock);
 /* Newly allocated pool that is not yet added to stack_pools. */
 static void *new_pool;
 /* Number of pools in stack_pools. */
 static int pools_num;
 /* Offset to the unused space in the currently used pool. */
-static size_t pool_offset = DEPOT_POOL_SIZE;
+static size_t pool_offset __guarded_by(&pool_lock) = DEPOT_POOL_SIZE;
 /* Freelist of stack records within stack_pools. */
-static LIST_HEAD(free_stacks);
-/* The lock must be held when performing pool or freelist modifications. */
-static DEFINE_RAW_SPINLOCK(pool_lock);
+static __guarded_by(&pool_lock) LIST_HEAD(free_stacks);
 
 /* Statistics counters for debugfs. */
 enum depot_counter_id {
@@ -291,6 +291,7 @@ EXPORT_SYMBOL_GPL(stack_depot_init);
  * Initializes new stack pool, and updates the list of pools.
  */
 static bool depot_init_pool(void **prealloc)
+	__must_hold(&pool_lock)
 {
 	lockdep_assert_held(&pool_lock);
 
@@ -338,6 +339,7 @@ static bool depot_init_pool(void **prealloc)
 
 /* Keeps the preallocated memory to be used for a new stack depot pool. */
 static void depot_keep_new_pool(void **prealloc)
+	__must_hold(&pool_lock)
 {
 	lockdep_assert_held(&pool_lock);
 
@@ -357,6 +359,7 @@ static void depot_keep_new_pool(void **prealloc)
  * the current pre-allocation.
  */
 static struct stack_record *depot_pop_free_pool(void **prealloc, size_t size)
+	__must_hold(&pool_lock)
 {
 	struct stack_record *stack;
 	void *current_pool;
@@ -391,6 +394,7 @@ static struct stack_record *depot_pop_free_pool(void **prealloc, size_t size)
 
 /* Try to find next free usable entry from the freelist. */
 static struct stack_record *depot_pop_free(void)
+	__must_hold(&pool_lock)
 {
 	struct stack_record *stack;
 
@@ -428,6 +432,7 @@ static inline size_t depot_stack_record_size(struct stack_record *s, unsigned in
 /* Allocates a new stack in a stack depot pool. */
 static struct stack_record *
 depot_alloc_stack(unsigned long *entries, unsigned int nr_entries, u32 hash, depot_flags_t flags, void **prealloc)
+	__must_hold(&pool_lock)
 {
 	struct stack_record *stack = NULL;
 	size_t record_size;
@@ -486,6 +491,7 @@ depot_alloc_stack(unsigned long *entries, unsigned int nr_entries, u32 hash, dep
 }
 
 static struct stack_record *depot_fetch_stack(depot_stack_handle_t handle)
+	__must_not_hold(&pool_lock)
 {
 	const int pools_num_cached = READ_ONCE(pools_num);
 	union handle_parts parts = { .handle = handle };
@@ -502,7 +508,8 @@ static struct stack_record *depot_fetch_stack(depot_stack_handle_t handle)
 		return NULL;
 	}
 
-	pool = stack_pools[pool_index];
+	/* @pool_index either valid, or user passed in corrupted value. */
+	pool = context_unsafe(stack_pools[pool_index]);
 	if (WARN_ON(!pool))
 		return NULL;
 
@@ -515,6 +522,7 @@ static struct stack_record *depot_fetch_stack(depot_stack_handle_t handle)
 
 /* Links stack into the freelist. */
 static void depot_free_stack(struct stack_record *stack)
+	__must_not_hold(&pool_lock)
 {
 	unsigned long flags;
 
-- 
2.52.0.322.g1dd061c0dc-goog

