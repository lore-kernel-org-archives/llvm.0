Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B5A21E0A8
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865925; cv=none; b=eNQHAnMVfYFL2XwFHo70u3FkKypYcTTncOUsDG4kJGlOlUcVlMyIPZI8DVzc8PCryZGpbnJy4HWOjfjDq8ABT6T9Gf39DruqhfPMeydBEbkNmaeC8jt/umaN8B0HDow8IT/ZQMJKYjrJ/iTecibooOy5s+bSUfm+GS5jCrWotXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865925; c=relaxed/simple;
	bh=62DVLhLLiJSVkhZ+NOavdiQcCNV6tDH/K6t59rw7Blo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rnYWY2VmKakg4YIsJiLHn4S9Cq4LFklPxONYR44yJe1paRor/b6BgeE7dka/qdcKBOJxz1YFh2+TqK1TGsZpn7BqqEuqGQzUvJR4hkMn2N8teCa8vT2zbkyIl7j7AVWxT06FeG8ZCpKP7ZmzYHjv3CbzlR86zF+yYpWVRqVa8fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mQmsQLn7; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mQmsQLn7"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5d9fcb4a122so1483819a12.0
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738865921; x=1739470721; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xc/nsPoKHTE+OnZKDVqwWYhiGzXohY6mN55B1zkjrXo=;
        b=mQmsQLn7e72wJa/g9iC0zw8LhRAi9zDsRJQBBdtBedx8s84jt0GKsYWbQVu6PVkmDG
         t/0FkCk2g3rh1qDANvoLXVRWO381/hz5KA8/n09iu7cvMJ/EBJiAioEw/hqDh0aj+u7R
         hx4WvdS6XWgHaodZRDjvbSWU5+pTtkwGGmRzCIiTHpbLK2+RU/IVRRz5jDU2S29sKV9L
         HeQnKINWOKyvOfoTfFOfTvKwfq2AyZ8DczTxReDMKIfPkkY4Zk5882uSObh9D6b1wmVi
         XhwVZt6K+8svDVqdw6BIxNdWG99qpwMqumPFT7rN5fbyiFTZM6Gmc8VVSTUo5McWKY0m
         00tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865921; x=1739470721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xc/nsPoKHTE+OnZKDVqwWYhiGzXohY6mN55B1zkjrXo=;
        b=jE9xL2SxaGKqKwcL9++dfTFLA3gjkOgjLPcn5ml/Bq6mz1p0SS5guGx2mEQ89rgto/
         m9x5nVV1E8fff4431xsYzI6L7KsJro8wXqkBiJK6qeQvf1WNx4xf1YVWuLUg2Jo0wlFk
         xltkz7ebBuKWTzpb2VweH9FLIOBlX2jc9V6fe3X9/m2ifMKSgEtlpWVjffzIgu8KzsUE
         ku9nrIRv5DoETDEYNxhe8GPRbL5HV6bciEIWR1GKwOmJgLy+GhshbTcsUbUXO7z7h9oV
         cRkAUEmZFjH17xU10JYJ4astYnVCLLyVQBIXOKOjo/VIkDqbODTaMy1OHzJCLbVkfgHg
         USEg==
X-Forwarded-Encrypted: i=1; AJvYcCXtDOmJYVD1CLbgg9QzKfc2zoMHn7yQdT28TA/hBWGQgYWSU6P2R5pH17UQJp/ItQjgPqS2@lists.linux.dev
X-Gm-Message-State: AOJu0YwG9YxDGoWlWJkhJ3H1il9RWt9IyqFIVcSir/qVXxMHjixIWwVg
	hPMhrOizNjxOjxzIoYLFow1GwmNWqC4/tW/DuFhIfMwnG9OsfqeSaXsdUID/xZ2YKM+dLGaJ4g=
	=
X-Google-Smtp-Source: AGHT+IGMLO3VG3x3Ju4enmaIZ1q2blYdg0P0/rVgQoMBt/NBEB2is3323Ue5scgPotcIXUb1LrdBgJTq1g==
X-Received: from edah39.prod.google.com ([2002:a05:6402:ea7:b0:5dc:92bc:54c2])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2390:b0:5db:f26d:fff8
 with SMTP id 4fb4d7f45d1cf-5de4508dcc3mr323309a12.22.1738865921739; Thu, 06
 Feb 2025 10:18:41 -0800 (PST)
Date: Thu,  6 Feb 2025 19:10:16 +0100
In-Reply-To: <20250206181711.1902989-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206181711.1902989-23-elver@google.com>
Subject: [PATCH RFC 22/24] kcov: Enable capability analysis
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

Enable capability analysis for the KCOV subsystem.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/Makefile |  2 ++
 kernel/kcov.c   | 40 +++++++++++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/kernel/Makefile b/kernel/Makefile
index 87866b037fbe..7e399998532d 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -39,6 +39,8 @@ KASAN_SANITIZE_kcov.o := n
 KCSAN_SANITIZE_kcov.o := n
 UBSAN_SANITIZE_kcov.o := n
 KMSAN_SANITIZE_kcov.o := n
+
+CAPABILITY_ANALYSIS_kcov.o := y
 CFLAGS_kcov.o := $(call cc-option, -fno-conserve-stack) -fno-stack-protector
 
 obj-y += sched/
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 187ba1b80bda..d89c933fe682 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) "kcov: " fmt
 
+disable_capability_analysis();
+
 #define DISABLE_BRANCH_PROFILING
 #include <linux/atomic.h>
 #include <linux/compiler.h>
@@ -27,6 +29,8 @@
 #include <linux/log2.h>
 #include <asm/setup.h>
 
+enable_capability_analysis();
+
 #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
 
 /* Number of 64-bit words written per one comparison: */
@@ -55,13 +59,13 @@ struct kcov {
 	refcount_t		refcount;
 	/* The lock protects mode, size, area and t. */
 	spinlock_t		lock;
-	enum kcov_mode		mode;
+	enum kcov_mode		mode __var_guarded_by(&lock);
 	/* Size of arena (in long's). */
-	unsigned int		size;
+	unsigned int		size __var_guarded_by(&lock);
 	/* Coverage buffer shared with user space. */
-	void			*area;
+	void			*area __var_guarded_by(&lock);
 	/* Task for which we collect coverage, or NULL. */
-	struct task_struct	*t;
+	struct task_struct	*t __var_guarded_by(&lock);
 	/* Collecting coverage from remote (background) threads. */
 	bool			remote;
 	/* Size of remote area (in long's). */
@@ -391,6 +395,7 @@ void kcov_task_init(struct task_struct *t)
 }
 
 static void kcov_reset(struct kcov *kcov)
+	__must_hold(&kcov->lock)
 {
 	kcov->t = NULL;
 	kcov->mode = KCOV_MODE_INIT;
@@ -400,6 +405,7 @@ static void kcov_reset(struct kcov *kcov)
 }
 
 static void kcov_remote_reset(struct kcov *kcov)
+	__must_hold(&kcov->lock)
 {
 	int bkt;
 	struct kcov_remote *remote;
@@ -419,6 +425,7 @@ static void kcov_remote_reset(struct kcov *kcov)
 }
 
 static void kcov_disable(struct task_struct *t, struct kcov *kcov)
+	__must_hold(&kcov->lock)
 {
 	kcov_task_reset(t);
 	if (kcov->remote)
@@ -435,8 +442,11 @@ static void kcov_get(struct kcov *kcov)
 static void kcov_put(struct kcov *kcov)
 {
 	if (refcount_dec_and_test(&kcov->refcount)) {
-		kcov_remote_reset(kcov);
-		vfree(kcov->area);
+		/* Capability-safety: no references left, object being destroyed. */
+		capability_unsafe(
+			kcov_remote_reset(kcov);
+			vfree(kcov->area);
+		);
 		kfree(kcov);
 	}
 }
@@ -491,6 +501,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 	unsigned long size, off;
 	struct page *page;
 	unsigned long flags;
+	unsigned long *area;
 
 	spin_lock_irqsave(&kcov->lock, flags);
 	size = kcov->size * sizeof(unsigned long);
@@ -499,10 +510,11 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 		res = -EINVAL;
 		goto exit;
 	}
+	area = kcov->area;
 	spin_unlock_irqrestore(&kcov->lock, flags);
 	vm_flags_set(vma, VM_DONTEXPAND);
 	for (off = 0; off < size; off += PAGE_SIZE) {
-		page = vmalloc_to_page(kcov->area + off);
+		page = vmalloc_to_page(area + off);
 		res = vm_insert_page(vma, vma->vm_start + off, page);
 		if (res) {
 			pr_warn_once("kcov: vm_insert_page() failed\n");
@@ -522,10 +534,10 @@ static int kcov_open(struct inode *inode, struct file *filep)
 	kcov = kzalloc(sizeof(*kcov), GFP_KERNEL);
 	if (!kcov)
 		return -ENOMEM;
+	spin_lock_init(&kcov->lock);
 	kcov->mode = KCOV_MODE_DISABLED;
 	kcov->sequence = 1;
 	refcount_set(&kcov->refcount, 1);
-	spin_lock_init(&kcov->lock);
 	filep->private_data = kcov;
 	return nonseekable_open(inode, filep);
 }
@@ -556,6 +568,7 @@ static int kcov_get_mode(unsigned long arg)
  * vmalloc fault handling path is instrumented.
  */
 static void kcov_fault_in_area(struct kcov *kcov)
+	__must_hold(&kcov->lock)
 {
 	unsigned long stride = PAGE_SIZE / sizeof(unsigned long);
 	unsigned long *area = kcov->area;
@@ -584,6 +597,7 @@ static inline bool kcov_check_handle(u64 handle, bool common_valid,
 
 static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 			     unsigned long arg)
+	__must_hold(&kcov->lock)
 {
 	struct task_struct *t;
 	unsigned long flags, unused;
@@ -814,6 +828,7 @@ static inline bool kcov_mode_enabled(unsigned int mode)
 }
 
 static void kcov_remote_softirq_start(struct task_struct *t)
+	__must_hold(&kcov_percpu_data.lock)
 {
 	struct kcov_percpu_data *data = this_cpu_ptr(&kcov_percpu_data);
 	unsigned int mode;
@@ -831,6 +846,7 @@ static void kcov_remote_softirq_start(struct task_struct *t)
 }
 
 static void kcov_remote_softirq_stop(struct task_struct *t)
+	__must_hold(&kcov_percpu_data.lock)
 {
 	struct kcov_percpu_data *data = this_cpu_ptr(&kcov_percpu_data);
 
@@ -896,10 +912,12 @@ void kcov_remote_start(u64 handle)
 	/* Put in kcov_remote_stop(). */
 	kcov_get(kcov);
 	/*
-	 * Read kcov fields before unlock to prevent races with
-	 * KCOV_DISABLE / kcov_remote_reset().
+	 * Read kcov fields before unlocking kcov_remote_lock to prevent races
+	 * with KCOV_DISABLE and kcov_remote_reset(); cannot acquire kcov->lock
+	 * here, because it might lead to deadlock given kcov_remote_lock is
+	 * acquired _after_ kcov->lock elsewhere.
 	 */
-	mode = kcov->mode;
+	mode = capability_unsafe(kcov->mode);
 	sequence = kcov->sequence;
 	if (in_task()) {
 		size = kcov->remote_size;
-- 
2.48.1.502.g6dc24dfdaf-goog

