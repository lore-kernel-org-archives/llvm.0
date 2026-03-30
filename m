Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714573A3819
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879804; cv=none; b=hvQBmoKiuRop9Q8w1Y17drFC3g36b7zQp2aO5J8ckdMyElX2pe4S90SJWrpG/l6NakRItkJLHTUOxSpCIn4ALwljj6UwZ8c4x4SCC8pmARda4oapS/1O3+J0kiNj6jC/hbD76/eRu/67tJFUJfEcO7YCt+Pw8drUez8ojeAo9V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879804; c=relaxed/simple;
	bh=pTCJHJX8bTl7q3lpIGFz0+hvyyonxW9EtJZoTs2vgbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qr4Juk9CUYVFMwCHYfZojcpkptYxylTm+oMHRnyIVlHWE2ckM5y0YNvx5ovwt6hhNmk4NfTa6M7Qki22TGqPuRXIy+8WC2Xl1EhEroAZmKLOFKANjgGaBFZfJ5p/EcnynLdqmX9RWj796U0YLKOjGOcpWCyUqE7y36khzSKkdHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n2c4MT7e; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n2c4MT7e"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so4472314f8f.2
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774879799; x=1775484599; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofGeXPfaVRXCWGVBncjC8OxpQsdvZbUIW7I2SC9DA3M=;
        b=n2c4MT7ehDPEnbhcFi2pluN/U4AN8N9j0nCp4FUSX30cLYIW9qWTCfXi3xSxx408yX
         4LIh4myqWq5d5XHXQBqOmwplR3evIvPU9MG8FTaA6oBJIGlYUZHzQ0ZiuoYqU17EXABY
         jNsUvb+xoXkMjuPrXZ127vGRDf8nId1Lf4u/+WPEicGOKgaZu7zj4RrqIABDeImGa43e
         BYX6OB2IaOYTJIrq+y0HVRAe2x6qYNJo8gSa0uZ00BlKd/q6BqEJ8+S6nDIxOWfyr7OO
         +OkNqS8DALEdWewVAe7vdDZnKgZt7RqN5G9Gha/OrfC/F3EZQeAyoJe6lMpmbxhrjYx2
         cYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879799; x=1775484599;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofGeXPfaVRXCWGVBncjC8OxpQsdvZbUIW7I2SC9DA3M=;
        b=LUzvzJzcWX9EHXHnsgAww2JRCzftO6j30FXcKoJDM5KYm6COWs5s/w49qBIEoGFtBR
         XOyBAAR+tsw3xBPLDRq0jayELK238eDJ8+2wGx0YGdboyqBp6TMVbNNv3VbIwfAFCYeD
         3Ol4i6fTJ92IUvu1WZsovzG/w+UBUc1m46orBvQPRu9GEjH9IXDui1ErlihthR4DqJ+N
         bIMldAQ3w2intNAV8RWpoY8UbMy2ELCocSutmBpRNGCDpL9Ef4KrDTgkHeOE9eDh9lZv
         9jbvn1y/sUXJMgEuRmTDzYbz9C13MvO9BYhFNKhJn/6lnEtch5wNdADE01rW/uipWdaw
         176Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFCB7PqdUbUGwu+n9puoV+hQg+/P8A1kkE4pGKsM5sRlvL0ivO11QGKcgNhov48zKMctYC@lists.linux.dev
X-Gm-Message-State: AOJu0YxQLwvbDF59wlN83oo7fXoT9QJjttMZ1RLKV1DxQ502accBdOBg
	QVe4fDCDaDF49OoztSuHme8g0flkzG6kfl8WG/tAgt3/Nc1lYesZLBd/1HAtK9UBDQ==
X-Gm-Gg: ATEYQzwREE8n0KEGv/LUd2pvdwK3Zs/3dd+FIzWnR2AKKAyiHAL/RcXJJpQHWQ30x7m
	2mvFdPd6YMB1JNFlR7hJSyhfwxeJT/nJJDv2cZq6ztKVTi1H0Uw/B10FrERDASMfQdgpYxjOE3/
	5Bs78CRD1eXlBilTLfmeJduKwoO1KwZtEYe6YFkDMcz5mn/rkqKq3JGneG0RRZmbjaPKJlgnpqC
	P/3ypl4K1SyhRWifWbgVXzWCP5qsDnQHKDrzMfSRCU53Xboqx0ANXyRdb9WGcUjkozHS5vUz7fF
	01qU09JZdA1Op6uXRyafrh69coeDRrF1BGEQmj8sUKDmGQbjaMsw6feKGIULZUXwzJ8/NhHrwvb
	WovnwhLzsqEXn5S2iGfZ9qHjcZnXB+DAle5YH5O7zuJ8/9uUl7diMeFP4x81zeyt80zrn0TVF5S
	SJGiqbDCFivIJMitLsdpNEQhZ4nLTyfz6DDOPClq6lsJwoUz7RoPiIXoDo0BKU
X-Received: by 2002:a5d:5389:0:b0:43c:f52b:7ff7 with SMTP id ffacd0b85a97d-43cf52b80f8mr9346306f8f.50.1774879798389;
        Mon, 30 Mar 2026 07:09:58 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:a898:3d0d:784b:16c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eb95fsm21396329f8f.12.2026.03.30.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:09:57 -0700 (PDT)
Date: Mon, 30 Mar 2026 16:09:50 +0200
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Subject: [PATCH tip/locking/core] compiler-context-analysis: Bump required
 Clang version to 23
Message-ID: <acqELlVC6vEeEF-W@elver.google.com>
References: <20260323153351.1412355-1-elver@google.com>
 <CANpmjNMo5kX=2B7UTo-gbiBSTAF0JPwWRZNf=KWpRP4tRA2FAg@mail.gmail.com>
 <20260325152000.GG3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325152000.GG3738786@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.2.13 (2024-03-09)

Clang 23 introduces support for multiple arguments in the `guarded_by`
and `pt_guarded_by` attributes [1]. This allows defining variables
protected by multiple context locks, where read access requires holding
at least one lock (shared or exclusive), and write access requires
holding all of them exclusively.

Clang 23 also provides a few other improvements (such as being able to
deal with arrays of locks [2]) that make it worthwhile bumping the
compiler version instead of trying to make both Clang 22 and later work
while supporting these new features.

Link: https://github.com/llvm/llvm-project/pull/186838 [1]
Link: https://github.com/llvm/llvm-project/pull/148551 [2]
Requested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Bump version instead of __guarded_by_any workaround.
---
 Documentation/dev-tools/context-analysis.rst |  2 +-
 include/linux/compiler-context-analysis.h    | 30 ++++++++++++++------
 lib/Kconfig.debug                            |  4 +--
 lib/test_context-analysis.c                  | 24 ++++++++++++++++
 4 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation/dev-tools/context-analysis.rst
index 54d9ee28de98..8e71e1e75b5b 100644
--- a/Documentation/dev-tools/context-analysis.rst
+++ b/Documentation/dev-tools/context-analysis.rst
@@ -17,7 +17,7 @@ features. To enable for Clang, configure the kernel with::
 
     CONFIG_WARN_CONTEXT_ANALYSIS=y
 
-The feature requires Clang 22 or later.
+The feature requires Clang 23 or later.
 
 The analysis is *opt-in by default*, and requires declaring which modules and
 subsystems should be analyzed in the respective `Makefile`::
diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index 00c074a2ccb0..1ab2622621c3 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -39,12 +39,14 @@
 # define __assumes_shared_ctx_lock(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
 
 /**
- * __guarded_by - struct member and globals attribute, declares variable
- *                only accessible within active context
+ * __guarded_by() - struct member and globals attribute, declares variable
+ *                  only accessible within active context
+ * @...: context lock instance pointer(s)
  *
  * Declares that the struct member or global variable is only accessible within
- * the context entered by the given context lock. Read operations on the data
- * require shared access, while write operations require exclusive access.
+ * the context entered by the given context lock(s). Read operations on the data
+ * require shared access to at least one of the context locks, while write
+ * operations require exclusive access to all listed context locks.
  *
  * .. code-block:: c
  *
@@ -52,17 +54,24 @@
  *		spinlock_t lock;
  *		long counter __guarded_by(&lock);
  *	};
+ *
+ *	struct some_state {
+ *		spinlock_t lock1, lock2;
+ *		long counter __guarded_by(&lock1, &lock2);
+ *	};
  */
 # define __guarded_by(...)		__attribute__((guarded_by(__VA_ARGS__)))
 
 /**
- * __pt_guarded_by - struct member and globals attribute, declares pointed-to
- *                   data only accessible within active context
+ * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
+ *                     data only accessible within active context
+ * @...: context lock instance pointer(s)
  *
  * Declares that the data pointed to by the struct member pointer or global
  * pointer is only accessible within the context entered by the given context
- * lock. Read operations on the data require shared access, while write
- * operations require exclusive access.
+ * lock(s). Read operations on the data require shared access to at least one
+ * of the context locks, while write operations require exclusive access to all
+ * listed context locks.
  *
  * .. code-block:: c
  *
@@ -70,6 +79,11 @@
  *		spinlock_t lock;
  *		long *counter __pt_guarded_by(&lock);
  *	};
+ *
+ *	struct some_state {
+ *		spinlock_t lock1, lock2;
+ *		long *counter __pt_guarded_by(&lock1, &lock2);
+ *	};
  */
 # define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 93f356d2b3d9..09e9bd003c70 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -630,7 +630,7 @@ config DEBUG_FORCE_WEAK_PER_CPU
 
 config WARN_CONTEXT_ANALYSIS
 	bool "Compiler context-analysis warnings"
-	depends on CC_IS_CLANG && CLANG_VERSION >= 220100
+	depends on CC_IS_CLANG && CLANG_VERSION >= 230000
 	# Branch profiling re-defines "if", which messes with the compiler's
 	# ability to analyze __cond_acquires(..), resulting in false positives.
 	depends on !TRACE_BRANCH_PROFILING
@@ -641,7 +641,7 @@ config WARN_CONTEXT_ANALYSIS
 	  and releasing user-definable "context locks".
 
 	  Clang's name of the feature is "Thread Safety Analysis". Requires
-	  Clang 22.1.0 or later.
+	  Clang 23 or later.
 
 	  Produces warnings by default. Select CONFIG_WERROR if you wish to
 	  turn these warnings into errors.
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 06b4a6a028e0..316f4dfcda65 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -159,6 +159,10 @@ TEST_SPINLOCK_COMMON(read_lock,
 struct test_mutex_data {
 	struct mutex mtx;
 	int counter __guarded_by(&mtx);
+
+	struct mutex mtx2;
+	int anyread __guarded_by(&mtx, &mtx2);
+	int *anyptr __pt_guarded_by(&mtx, &mtx2);
 };
 
 static void __used test_mutex_init(struct test_mutex_data *d)
@@ -219,6 +223,26 @@ static void __used test_mutex_cond_guard(struct test_mutex_data *d)
 	}
 }
 
+static void __used test_mutex_multiguard(struct test_mutex_data *d)
+{
+	mutex_lock(&d->mtx);
+	(void)d->anyread;
+	(void)*d->anyptr;
+	mutex_unlock(&d->mtx);
+
+	mutex_lock(&d->mtx2);
+	(void)d->anyread;
+	(void)*d->anyptr;
+	mutex_unlock(&d->mtx2);
+
+	mutex_lock(&d->mtx);
+	mutex_lock(&d->mtx2);
+	d->anyread++;
+	(*d->anyptr)++;
+	mutex_unlock(&d->mtx2);
+	mutex_unlock(&d->mtx);
+}
+
 struct test_seqlock_data {
 	seqlock_t sl;
 	int counter __guarded_by(&sl);
-- 
2.53.0.1018.g2bb0e51243-goog
