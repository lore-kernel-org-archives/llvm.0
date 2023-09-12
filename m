Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAB1B64F
	for <llvm@lists.linux.dev>; Tue, 12 Sep 2023 21:03:53 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5958487ca15so65940907b3.1
        for <llvm@lists.linux.dev>; Tue, 12 Sep 2023 14:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694552632; x=1695157432; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Su3tcyVoOXGTvjYADlVUH9iHtW/BbNEgdwa7PWlndEM=;
        b=H/j7uYbS3j76yghrtDSo7KrKQr7H93Gm7Mx9iFmvLNIAxo8c0b5NKlQW1qXBa6uhxh
         ichXKfNjD14mGsa4PSSFhzm5XB4xAuoZPA9/dRfFld0KNy4WiQLPMmlYGvf/TVMR4dMf
         +IV4F8li/LZcdZbanpwPl4TRuq/dZnR+3F4mubIYQTgXEuWSmd2UApeMqQjEKH4Lf7Qw
         yoGIiaIfn0/w39LzEPHTLCwGUmrRflDH/t1NgLyoqU1SMjyCtpx4Suq22B95XFpps7i6
         OU5G64etSu3gz3NW60ral8dcvVU/WGPUrOn4JRuBX0x/gi8TB0EBZ3dw6SqSFYCgMDQV
         PXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694552632; x=1695157432;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Su3tcyVoOXGTvjYADlVUH9iHtW/BbNEgdwa7PWlndEM=;
        b=kaei8o2lmSS1o8G5qA36uTKFsCL87aglM7F1pDkP0cJIBWlHXVFBUcm7Duzzqivcu6
         e2mb4R7hsERrVr8alnLh8dma1N5yXp7HHt6qyZBH797mg/4UgCJFR7TNGtBHLbExPLyH
         AJAvA4Oy2zwGmgoqq4MuFHFnjVQu+kCyQvewWvv8vYWGjWqqZdkCVGafQSilCTSo+itG
         kV5w+UVsnAPgnKKHlCM8kKfNc22wmcy+uGpx3rqbV0158Q1DfJW9GgZlcrRnRZaAVr1x
         i+f3NLVi58kH/Fplad3KFINOGa7GxIYytVOrWlsQ0gtFTYSWV2Vybo9Eb1Glsi4ljjS/
         JGuQ==
X-Gm-Message-State: AOJu0YwHWgATkrTiec7oAsyF0AOZhMItqA2/YdSbizeY2OoShRSJcRPD
	VuNK+1aUpSLpE48zH6tMFSjy1uwXU0vyXAYEkg==
X-Google-Smtp-Source: AGHT+IF5YHlQSMrIw16r+uVSNv/451o25wdhmlzvVO3INNSaZxue3EcfGr3UbkP9vTp9NIAwIoM31DFP9zrJ7RrLFg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:400c:0:b0:589:a855:7af with SMTP
 id l12-20020a81400c000000b00589a85507afmr17848ywn.7.1694552632259; Tue, 12
 Sep 2023 14:03:52 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:03:50 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADbSAGUC/4WNWw6DIBREt2Lud2l4RKz9ch+NaRSvSKpigJA2h
 r2XsoH+zZlkzpzg0Rn0cK9OcBiNN3bPwC4VqGXYNRIzZQZOuaAtvZGXx3UO6AM5BjdszxIVYY0
 Uo+TYSD5DHh8OZ/Mu4kefeTE+WPcpP5H92r/KyAgjKOpxamnNJ8k6ba1e8arsBn1K6Qv4Q/Odv QAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694552631; l=4723;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=rBvEsviW5uVxRd+NSePgqHcF5aSjOLLvI+7rzhkkIw4=; b=YWVY/Weu/NSS3aIoj+Urk84igcHFCjWw8w12fSj3X9Av24E/Uzm8nDpKQdRL22iqOFzOi+bSg
 m9up5YJRe7YDO6RlPENJ2k/ZLpyQAWPEF7g/3lhb404Mrq/huWzpBnN
X-Mailer: b4 0.12.3
Message-ID: <20230912-kselftest-param_test-c-v1-1-80a6cffc7374@google.com>
Subject: [PATCH] selftests/rseq: fix kselftest Clang build warnings
From: Justin Stitt <justinstitt@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with Clang, I am getting many warnings from the selftests/rseq tree.

Here's one such example from rseq tree:
|  param_test.c:1234:10: error: address argument to atomic operation must be a pointer to _Atomic type ('intptr_t *' (aka 'long *') invalid)
|   1234 |         while (!atomic_load(&args->percpu_list_ptr)) {}
|        |                 ^           ~~~~~~~~~~~~~~~~~~~~~~
|  /usr/local/google/home/justinstitt/repos/tc-build/build/llvm/final/lib/clang/18/include/stdatomic.h:140:29: note: expanded from macro 'atomic_load'
|    140 | #define atomic_load(object) __c11_atomic_load(object, __ATOMIC_SEQ_CST)
|        |                             ^                 ~~~~~~

Use compiler builtins `__atomic_load_n()` and `__atomic_store_n()` with
accompanying __ATOMIC_ACQUIRE and __ATOMIC_RELEASE, respectively. This
will fix the warnings because the compiler builtins do not expect their
arguments to have _Atomic type. This should also make TSAN happier.

Link: https://github.com/ClangBuiltLinux/linux/issues/1698
Link: https://github.com/ClangBuiltLinux/continuous-integration2/issues/61
Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: Previous RFC https://lore.kernel.org/r/20230908-kselftest-param_test-c-v1-1-e35bd9052d61@google.com
---
 tools/testing/selftests/rseq/param_test.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/selftests/rseq/param_test.c
index bf951a490bb4..20403d58345c 100644
--- a/tools/testing/selftests/rseq/param_test.c
+++ b/tools/testing/selftests/rseq/param_test.c
@@ -1231,7 +1231,7 @@ void *test_membarrier_worker_thread(void *arg)
 	}
 
 	/* Wait for initialization. */
-	while (!atomic_load(&args->percpu_list_ptr)) {}
+	while (!__atomic_load_n(&args->percpu_list_ptr, __ATOMIC_ACQUIRE)) {}
 
 	for (i = 0; i < iters; ++i) {
 		int ret;
@@ -1299,22 +1299,22 @@ void *test_membarrier_manager_thread(void *arg)
 	test_membarrier_init_percpu_list(&list_a);
 	test_membarrier_init_percpu_list(&list_b);
 
-	atomic_store(&args->percpu_list_ptr, (intptr_t)&list_a);
+	__atomic_store_n(&args->percpu_list_ptr, (intptr_t)&list_a, __ATOMIC_RELEASE);
 
-	while (!atomic_load(&args->stop)) {
+	while (!__atomic_load_n(&args->stop, __ATOMIC_ACQUIRE)) {
 		/* list_a is "active". */
 		cpu_a = rand() % CPU_SETSIZE;
 		/*
 		 * As list_b is "inactive", we should never see changes
 		 * to list_b.
 		 */
-		if (expect_b != atomic_load(&list_b.c[cpu_b].head->data)) {
+		if (expect_b != __atomic_load_n(&list_b.c[cpu_b].head->data, __ATOMIC_ACQUIRE)) {
 			fprintf(stderr, "Membarrier test failed\n");
 			abort();
 		}
 
 		/* Make list_b "active". */
-		atomic_store(&args->percpu_list_ptr, (intptr_t)&list_b);
+		__atomic_store_n(&args->percpu_list_ptr, (intptr_t)&list_b, __ATOMIC_RELEASE);
 		if (rseq_membarrier_expedited(cpu_a) &&
 				errno != ENXIO /* missing CPU */) {
 			perror("sys_membarrier");
@@ -1324,27 +1324,27 @@ void *test_membarrier_manager_thread(void *arg)
 		 * Cpu A should now only modify list_b, so the values
 		 * in list_a should be stable.
 		 */
-		expect_a = atomic_load(&list_a.c[cpu_a].head->data);
+		expect_a = __atomic_load_n(&list_a.c[cpu_a].head->data, __ATOMIC_ACQUIRE);
 
 		cpu_b = rand() % CPU_SETSIZE;
 		/*
 		 * As list_a is "inactive", we should never see changes
 		 * to list_a.
 		 */
-		if (expect_a != atomic_load(&list_a.c[cpu_a].head->data)) {
+		if (expect_a != __atomic_load_n(&list_a.c[cpu_a].head->data, __ATOMIC_ACQUIRE)) {
 			fprintf(stderr, "Membarrier test failed\n");
 			abort();
 		}
 
 		/* Make list_a "active". */
-		atomic_store(&args->percpu_list_ptr, (intptr_t)&list_a);
+		__atomic_store_n(&args->percpu_list_ptr, (intptr_t)&list_a, __ATOMIC_RELEASE);
 		if (rseq_membarrier_expedited(cpu_b) &&
 				errno != ENXIO /* missing CPU*/) {
 			perror("sys_membarrier");
 			abort();
 		}
 		/* Remember a value from list_b. */
-		expect_b = atomic_load(&list_b.c[cpu_b].head->data);
+		expect_b = __atomic_load_n(&list_b.c[cpu_b].head->data, __ATOMIC_ACQUIRE);
 	}
 
 	test_membarrier_free_percpu_list(&list_a);
@@ -1401,7 +1401,7 @@ void test_membarrier(void)
 		}
 	}
 
-	atomic_store(&thread_args.stop, 1);
+	__atomic_store_n(&thread_args.stop, 1, __ATOMIC_RELEASE);
 	ret = pthread_join(manager_thread, NULL);
 	if (ret) {
 		errno = ret;

---
base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
change-id: 20230908-kselftest-param_test-c-1763b62e762f

Best regards,
--
Justin Stitt <justinstitt@google.com>

