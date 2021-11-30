Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D547B29CA
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:45:11 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id 187-20020a1c02c4000000b003335872db8dso10296421wmc.2
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cCyxJnES0DWyrpQ2J5vRoZu9DlHTb3+fL88VjiCWbjg=;
        b=cKjMDTXM8NjyKwJV3lDtGCObCm4HpcJe5F+4CzZRRXVIIKSOXaY8t1H5jc/MfrMybp
         l7C1C5PdFSieee+5Ow4GgXoKOJzHKEgRplPyzIuWqJojZ+nN2/4IJsjhDdaZMC4hfGLc
         YjipwbrwuXGRJcsG9dWRqwvvUcQGiVB9s3RVhs0q+yDpoxr5r2oMHuFRBcQ1r5QIpX3k
         KQBK18DLneuEMmku+aWMunTXlRFji0E50ji38pRBCDpdp+D21l7U1sivA4dITmYi7DXU
         QeLVu19keyQA504MdNHYtGnlBTN/rI+Vy0aqov/bs8mgOaxhMmA9ff8gcphJR+tq3WW4
         AyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cCyxJnES0DWyrpQ2J5vRoZu9DlHTb3+fL88VjiCWbjg=;
        b=u8u65ebEDYeC+N0wEVzv675emGKayrQTtByVfk353vO4fLKerlNThLaooAYW2QvjyF
         POwvzP4tyGel4JPFXpGwuwlaSUZRn7joFFzKRo2a8zjePjiy7cLuvD3ZTCqlfkqaqR5S
         4munK+msoOaDsMJedHMkKD+ugqSYXZ4aWAdXd6+jkY2r3sRMG60N0M69rqDC0T/Qffqh
         iXuUswRsGNpGDVRA3U2wOKLctcT5JrpVK4KWPJ9eVbw6LDgYconp0nJ8FdIkxjS9quPc
         xUoyOJyPww8zRBlzzrb3MZk0OJdgG09E9qxPii1NxuWsevzYUhMNGTt3wZAZIYE8l75b
         xGdA==
X-Gm-Message-State: AOAM533GznXWDzhCnTdFYqQW8BiUdvQ3CC4gDfxMosVUlWltYE6otYDi
	7uh/0UoFgByRyLWL+nGwUJIVHAYNfA==
X-Google-Smtp-Source: ABdhPJz78uHZ/XMYdk54D/l9GyDkbV5tPc83Pq6RQwiWk9kg5EHHGLp650DVfz5FKzeodb/NW5W0kpyZ5g==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:1d1b:: with SMTP id
 l27mr623895wms.1.1638272709978; Tue, 30 Nov 2021 03:45:09 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:11 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-4-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 03/25] kcsan: Avoid checking scoped accesses from nested contexts
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Avoid checking scoped accesses from nested contexts (such as nested
interrupts or in scheduler code) which share the same kcsan_ctx.

This is to avoid detecting false positive races of accesses in the same
thread with currently scoped accesses: consider setting up a watchpoint
for a non-scoped (normal) access that also "conflicts" with a current
scoped access. In a nested interrupt (or in the scheduler), which shares
the same kcsan_ctx, we cannot check scoped accesses set up in the parent
context -- simply ignore them in this case.

With the introduction of kcsan_ctx::disable_scoped, we can also clean up
kcsan_check_scoped_accesses()'s recursion guard, and do not need to
modify the list's prev pointer.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kcsan.h |  1 +
 kernel/kcsan/core.c   | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/linux/kcsan.h b/include/linux/kcsan.h
index fc266ecb2a4d..13cef3458fed 100644
--- a/include/linux/kcsan.h
+++ b/include/linux/kcsan.h
@@ -21,6 +21,7 @@
  */
 struct kcsan_ctx {
 	int disable_count; /* disable counter */
+	int disable_scoped; /* disable scoped access counter */
 	int atomic_next; /* number of following atomic ops */
 
 	/*
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index e34a1710b7bc..bd359f8ee63a 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -204,15 +204,17 @@ check_access(const volatile void *ptr, size_t size, int type, unsigned long ip);
 static noinline void kcsan_check_scoped_accesses(void)
 {
 	struct kcsan_ctx *ctx = get_ctx();
-	struct list_head *prev_save = ctx->scoped_accesses.prev;
 	struct kcsan_scoped_access *scoped_access;
 
-	ctx->scoped_accesses.prev = NULL;  /* Avoid recursion. */
+	if (ctx->disable_scoped)
+		return;
+
+	ctx->disable_scoped++;
 	list_for_each_entry(scoped_access, &ctx->scoped_accesses, list) {
 		check_access(scoped_access->ptr, scoped_access->size,
 			     scoped_access->type, scoped_access->ip);
 	}
-	ctx->scoped_accesses.prev = prev_save;
+	ctx->disable_scoped--;
 }
 
 /* Rules for generic atomic accesses. Called from fast-path. */
@@ -465,6 +467,15 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 		goto out;
 	}
 
+	/*
+	 * Avoid races of scoped accesses from nested interrupts (or scheduler).
+	 * Assume setting up a watchpoint for a non-scoped (normal) access that
+	 * also conflicts with a current scoped access. In a nested interrupt,
+	 * which shares the context, it would check a conflicting scoped access.
+	 * To avoid, disable scoped access checking.
+	 */
+	ctx->disable_scoped++;
+
 	/*
 	 * Save and restore the IRQ state trace touched by KCSAN, since KCSAN's
 	 * runtime is entered for every memory access, and potentially useful
@@ -578,6 +589,7 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 	if (!kcsan_interrupt_watcher)
 		local_irq_restore(irq_flags);
 	kcsan_restore_irqtrace(current);
+	ctx->disable_scoped--;
 out:
 	user_access_restore(ua_flags);
 }
-- 
2.34.0.rc2.393.gf8c9666880-goog

