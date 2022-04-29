Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47491869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:14 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2f8be9326fcso22422417b3.18
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FuO92T+gQ2JupQ9SuTqzvkGpbYeTtQp61yvoEs/MIhk=;
        b=TTfEcRfHmOL8UirjhQoEa7l5bNv/GjH+C6lfGkMxomdncoe0Hr0VHhGvlXKWylhz93
         CX/PcLQAgVyH0VfQURB3o/Ei/fHqTtBrgnXUprp9inU2sMx4h4JAwPk/UhzkkRwcl8Li
         wu6pHNY4Ukd+XIw+4Hj1nXjNRsYLPtVMUm6AYg8gTYJm4G2u/pBxf2jrgIdLagjYVwhO
         dLgmnbRMMvKmzohj4Q87bXPOX8hoLaGCuv6lcan48IjoVdneRG7K8DVMs90E8MuTZD+9
         7794liBZaVnMpmz/tu4JC4xxRfi713cDgBRfSnPH/QWlwzfp5/9aD7Eel9pDnJ9jE2RV
         zVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FuO92T+gQ2JupQ9SuTqzvkGpbYeTtQp61yvoEs/MIhk=;
        b=TS6lQMIVWrc1msKmWlJUbX4h7Wts66YAty3r951neLMGUVRGDEskT1cpc6nIB8Tc99
         ScjTE+vX+X9Zk/2M7vMn138pwE/SJY+cXwHrVI4ceiWL8Pd/Ux94yKtw51mJ2ydYLiHd
         d1nbwbYUo2c5kgi6IzwFdEaLOk86JzmFpYULiXPeAj65SDvo1nHyOHrFZvpoD2nZXhnJ
         PXZ8/CAFx70c6riP5xM0g2pKS1H8qPErR3Owoa+1JWA9zp0EiFVzxqUpi0wLJspkmDBR
         t4RwLOpZv43r165crnYORxDQZKqIKytPYL0/CLGgLeSBCTC4WsBt2HXK+P/L2D8PMDV6
         t4uQ==
X-Gm-Message-State: AOAM533Litjx/i/wTAqgCJWiDT5dFTjFy4tx1og/Qe7cytKUfqKLmXnH
	8UF+A7pXk0LdxGVMQnJ5e8wM2KYPH+Idu/Rh1Z4=
X-Google-Smtp-Source: ABdhPJxeSO9gyhjDxumTaAK3RpQIixgMmQctex1GmXog3DTcW7LHLIOrUVAl+SahcH2iIkb0Eq7WaSsfN7LgwDGm5oE=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:102a:b0:649:4564:5407 with
 SMTP id x10-20020a056902102a00b0064945645407mr117842ybt.565.1651264633971;
 Fri, 29 Apr 2022 13:37:13 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:34 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-12-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498; h=from:subject;
 bh=YiPdw8l/Nw5UPpL/vQkDV/vuspgcXAw5ywUyCPTHbRs=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExW59cQE6i4EWdpszacwquVOaMnOhiCbxpiPvav
 kGoTfU6JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMVgAKCRBMtfaEi7xW7mz/C/
 9TomtflYaaEXqp9/lMi4QyjyQFmshJEM6VyddnW6E9huSf2jbCzNiOV61PpGZCgXsVyDHLZbPcNABw
 8glehzbIS5ML5xwg4eFwoXsaJE4rxgx3qbNVyJi8QjOjbiIqcFnhbQ+s7eXyBIqczUmW+gGM7wP0T1
 U0X8gtEyI6jVDf9UPF7TjqQI+lk4Hc/szkjhUNZGH6smQ/D4lzmeJU8s3OMk4KfYIws09Q4JJkRGjI
 nrBWGaBnB2VNj9lgnWGb+08kCF192EqptfaxQ5qbt8d5V2nUBL2vCk+hRclwrhbvz1DKYBm+EpKnDS
 kIzlncItNwcDyrQlmcXwJ/BeUBWYOgduyJns83VjU6BalQptHxVJfI5bfbURT9hYpruMXTjCnS33qC
 I2Qp1HAjHRkIeoU/q7BNe5VtyqrzcwN0mF/YvqRQIkmvuGWxR2KIuqrCJk/leuk4CcufsF3wicIQRQ
 FmxC55GjR38SNTNu9y0zxoYMTgbL+xxlvCcmnT1UyUFY8=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 11/21] treewide: Drop WARN_ON_FUNCTION_MISMATCH
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
index edb0e2a602a8..a4c116dec698 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -219,22 +219,6 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
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
2.36.0.464.gb9c8b46e94-goog

