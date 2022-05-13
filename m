Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7437A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:33 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id i17-20020a259d11000000b0064cd3084085so812036ybp.9
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=A+7QPiSqoa8uHCAaz7cWSuhzWOaNl1zZwhVwOmSdW3Q=;
        b=eoneec1qCPJ+mzeLTO/26o4Gge0cWT5SAiGzbalPj2kajo6F/0cY+hXNaJV6/r+1ew
         Y6uGiwZLXUyodzZ8UYO/n8YLOsl89RGDclgPhS6fxgoPf/o7am8+mqu4bw/b3L+/Yuyi
         Cc/OaxzJLjKECCzrQRpdRnOuumBxE4idnbmxYj0GGrcjayFmVVo2gRU+pSIAIGWkmF0a
         3GrUoXzWAOrstvsKGj3Hh/ia4A/Gbuk8XwS8MbQH/z19h/yMUcGvuCm84jFLSCi6XCzG
         qcVtZMwaKqUWyqXG9PrxZtGErnPUmFAsNBu4fvRjKv6v93XufMYo0X2ugGmnuiRsSDsp
         gASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=A+7QPiSqoa8uHCAaz7cWSuhzWOaNl1zZwhVwOmSdW3Q=;
        b=iIhSXBJq9zwbsgnzVgStNwPPb3TcXtbkD3kkzwQy3mHJw06b2uax8KTo0eCBUCNmEJ
         5I+DzXtqtkaIiuiHzNEABFSRhn0IG381A0awmffTstTIO2YRfcWo4iujLQj1b7LcP+ZI
         w3l9XqF/Qi63Zsonj3c0IIP+AtHFXZy1ugyvVqmlQj3J7yWlCcynixTbgPnjAie65ORM
         WlHoFNblychRe42D+4TIoCl5q+sIEYsBkmGhjfbXR4MTA8+FEg1IcIwSuj21t4YfgQq8
         A4s7bl/YcXTF037/BapTLbFJiAtyx+BkSkYjc+/iaT2c3T/677bIdj42Af3AuArL8tcb
         lK7w==
X-Gm-Message-State: AOAM532rEr6CrVsDceafL1cnlGuKUOoOA7cTQ0g4T9csmrUjyLt3/BWn
	FdSNyXqFqfZleYUw8kj+kGvZEPaT/R8kTAqiE/U=
X-Google-Smtp-Source: ABdhPJzvGknJQJvJIOdsshYzjyQxItMWAOO5KzitzyEuNvSreyd+VCQrAAW9GnGKTwHoKx86rGgma5rzRyc5taV0BnQ=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a81:3685:0:b0:2fb:947b:5247 with SMTP
 id d127-20020a813685000000b002fb947b5247mr7593917ywa.64.1652473352269; Fri,
 13 May 2022 13:22:32 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:51 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-14-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492; h=from:subject;
 bh=O+VMkemg5E90usG6SsfLEV+HTvQnGaBlMMBcrxqTesI=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3kE9sw78o8+eJw34YnMmYuK157n4APskm6j4x8
 RWFsHcaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn695AAKCRBMtfaEi7xW7nURC/
 wOdNWBO3UhCkvlEOcn4eL9iiDgGLHqd+ms7km80Bh8LZzW9sOnnlG3t3vRb52kdG5VEXtgkxioGv41
 xDP0vHe/60Dqza8pTAK6oUDwZ9oravnzAdveNeysGT+iWwn6o+1PlLzaJmMM1WHiNJunt64I1Frt7l
 MG+kykOaX8IOtuUHQGbZHWos22oiPy9qAluaUwvZuPOkfOfDaZILICUJ+aOVo0YsM8pziu05P1lMyZ
 S6JU5H6j9BiCebv0Fc2EqSsSN5gNHjaRWhPBzA5au10tr+30q+wOqa1BHCK8mMAkmGTFUQZsKOfVyJ
 OcIxdboVGgRVBnDBRJCMZ8aytWoWx0G6HlaYhqS/WvOC1C4QDVu1DaIIC7FFX3v7KJB+D8zmwf7Tzo
 BbojzcBBfnmu6tJIxx1uUPt69XNi1OBt4xpbkBA8+eLJ4X7gmJouTVZo8KFUFQJeB6mF8MYQ1ttzhr
 h0OWEF+nFaDfGtzLvSL23nOGQJx8DP5aI9DLAbnTGhKs8=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 13/21] treewide: Drop WARN_ON_FUNCTION_MISMATCH
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

CONFIG_CFI_CLANG no longer breaks cross-module function address
equality, which makes WARN_ON_FUNCTION_MISMATCH unnecessary. Remove
the definition and switch back to WARN_ON_ONCE.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/asm-generic/bug.h | 16 ----------------
 kernel/kthread.c          |  3 +--
 kernel/workqueue.c        |  2 +-
 3 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index ba1f860af38b..4050b191e1a9 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -220,22 +220,6 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 # define WARN_ON_SMP(x)			({0;})
 #endif
 
-/*
- * WARN_ON_FUNCTION_MISMATCH() warns if a value doesn't match a
- * function address, and can be useful for catching issues with
- * callback functions, for example.
- *
- * With CONFIG_CFI_CLANG, the warning is disabled because the
- * compiler replaces function addresses taken in C code with
- * local jump table addresses, which breaks cross-module function
- * address equality.
- */
-#if defined(CONFIG_CFI_CLANG) && defined(CONFIG_MODULES)
-# define WARN_ON_FUNCTION_MISMATCH(x, fn) ({ 0; })
-#else
-# define WARN_ON_FUNCTION_MISMATCH(x, fn) WARN_ON_ONCE((x) != (fn))
-#endif
-
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 50265f69a135..dfeb87876b4a 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1050,8 +1050,7 @@ static void __kthread_queue_delayed_work(struct kthread_worker *worker,
 	struct timer_list *timer = &dwork->timer;
 	struct kthread_work *work = &dwork->work;
 
-	WARN_ON_FUNCTION_MISMATCH(timer->function,
-				  kthread_delayed_work_timer_fn);
+	WARN_ON_ONCE(timer->function != kthread_delayed_work_timer_fn);
 
 	/*
 	 * If @delay is 0, queue @dwork->work immediately.  This is for
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 0d2514b4ff0d..18c1a1c09684 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1651,7 +1651,7 @@ static void __queue_delayed_work(int cpu, struct workqueue_struct *wq,
 	struct work_struct *work = &dwork->work;
 
 	WARN_ON_ONCE(!wq);
-	WARN_ON_FUNCTION_MISMATCH(timer->function, delayed_work_timer_fn);
+	WARN_ON_ONCE(timer->function != delayed_work_timer_fn);
 	WARN_ON_ONCE(timer_pending(timer));
 	WARN_ON_ONCE(!list_empty(&work->entry));
 
-- 
2.36.0.550.gb090851708-goog

