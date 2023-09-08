Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B5C30F9C
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 23:03:25 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d8027f9dfefso1122168276.0
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 16:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694214204; x=1694819004; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b98aA5lsSwU0e6a2QD0NPfrvu8IBYbkSu4DS3ojXLjM=;
        b=g+x5/Wnpbx3FcWYIrweRhPENc1fuiM145gbEiIkPCen/3bqkl7G8ZOFB1TsPRQwBkE
         qchs0AXipdeG4ngNbqLTdfxahOdsSdTWqYvGtFyVsje+RdvpxYnbmyrLYyll6RAWeO/Z
         DnLmTdOANMUIlq04fk4xnDjs310Q5b1sbjjdw4iPrR3RMoleTtyXl9nrnU6KQUlX5Xxb
         ZkBorYzJ3VRa9oXqKLZws9OO8D0YOeJRxeMKiqwru6ibi+ujcSxK+TA8I9P4ooap0AYb
         Z6T3YaWkyLGSMYa9KfMN/ev5BZWujWSW+J1DImuJbnONqABlyZ09Eiz+5Mpvmzmvv2vO
         CSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694214204; x=1694819004;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b98aA5lsSwU0e6a2QD0NPfrvu8IBYbkSu4DS3ojXLjM=;
        b=rLKd85WTWgb75U0i7aF7Qq9N3LlMLCCnGefhTR1N4VFiWWEdmPbO7w5p63EVNw3dyP
         WJPAk2ESaQ3REHTRd3+BakDA5qfqIA9kic3d7/eDsaqg4j8CmI/7cV9mLHdHOmFjYodd
         GLKxGbj9M7874ljhBfZFwyLy+mn+hcnYZBDxBlvo2+r2CNsEN7AAf0WGE5jQGr4vYpuT
         TM43/Sxem+9aYDnVZKTp2Ew1s3k3i/iSFUfwZWLdtHR+owZqsYY6GtH8GuyRhjXzaM0Y
         l9MJzNVx1YLt2nlp7JnWWndLVtmUWBqRa9xCDZN9orkdbb3pUMiyIhG17rwSRB0cjVlq
         YcOw==
X-Gm-Message-State: AOJu0Yyt2guuv7Pi/atnFrLH1CsxiEukr02oxlg9Lm8plf45Wu1kJf9a
	21jjBUJ4FB1mWwDGF7ovsMioG6UFNJv/VnOJNA==
X-Google-Smtp-Source: AGHT+IH7+IGP4N+5rjSjCLLdCVJhYLHEeHbwhPidz47HX5WWuR/DTQJlAG4w6KEvm7q3PZZODEduULaPwxf1R/NQyw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1682:b0:d7b:8d0c:43f1 with
 SMTP id bx2-20020a056902168200b00d7b8d0c43f1mr92700ybb.9.1694214204562; Fri,
 08 Sep 2023 16:03:24 -0700 (PDT)
Date: Fri, 08 Sep 2023 23:03:23 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADqo+2QC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDSwML3ezi1Jy0ktTiEt2CxKLE3HgwM1nX0NzMOMnMKNXczChNCai5oCg 1LbMCbHC0UpCbs1JsbS0A5OV5420AAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694214203; l=2948;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=U7toQp9XYVwiQw1flxIcg0RQUw/WUAt8uuyO5vIs0cs=; b=m6DVoM2aKvthnKkhJ2kEFW+8y3zfXgXLKKjGBV5dz10ltPeArywKoK91of1kYJaKM4dIIj+L1
 7a9X6VMUvMWD0OcAOciXLUli+xa7n05MUMrwODU7CmSEplQPe9zvpz6
X-Mailer: b4 0.12.3
Message-ID: <20230908-kselftest-param_test-c-v1-1-e35bd9052d61@google.com>
Subject: [PATCH RFC] selftests/rseq: fix kselftest Clang build warnings
From: Justin Stitt <justinstitt@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

Hi,

I am experiencing many warnings when trying to build tools/testing/selftests.

Here's one such example from rseq tree:
|  param_test.c:1234:10: error: address argument to atomic operation must be a pointer to _Atomic type ('intptr_t *' (aka 'long *') invalid)
|   1234 |         while (!atomic_load(&args->percpu_list_ptr)) {}
|        |                 ^           ~~~~~~~~~~~~~~~~~~~~~~
|  /usr/local/google/home/justinstitt/repos/tc-build/build/llvm/final/lib/clang/18/include/stdatomic.h:140:29: note: expanded from macro 'atomic_load'
|    140 | #define atomic_load(object) __c11_atomic_load(object, __ATOMIC_SEQ_CST)
|        |                             ^                 ~~~~~~

I added the _Atomic type in various locations to silence _all_ (10) of these
warnings. I'm wondering, though, perhaps the absence of these _Atomic
types in the first place is on purpose? Am I on the right track to fix
these warnings without damaging the legitimacy of the tests at hand?

I'd like some feedback about where to go from here and if others are
experiencing the same issues. Thanks!

FWIW here's my specific build incantation on Clang-18 (49d41de57896e935cd5726719c5208bce22694ae):
$ make LLVM=1 -j128 ARCH=x86_64 mrproper headers defconfig kselftest-merge
$ make LLVM=1 ARCH=x86_64 -C tools/testing/selftests

Link: https://github.com/ClangBuiltLinux/linux/issues/1698
Link: https://github.com/ClangBuiltLinux/continuous-integration2/issues/61
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 tools/testing/selftests/rseq/param_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/selftests/rseq/param_test.c
index bf951a490bb4..94802aeed2c6 100644
--- a/tools/testing/selftests/rseq/param_test.c
+++ b/tools/testing/selftests/rseq/param_test.c
@@ -356,7 +356,7 @@ struct inc_thread_test_data {
 };
 
 struct percpu_list_node {
-	intptr_t data;
+	_Atomic intptr_t data;
 	struct percpu_list_node *next;
 };
 
@@ -1212,8 +1212,8 @@ static int set_signal_handler(void)
 /* Test MEMBARRIER_CMD_PRIVATE_RESTART_RSEQ_ON_CPU membarrier command. */
 #ifdef TEST_MEMBARRIER
 struct test_membarrier_thread_args {
-	int stop;
-	intptr_t percpu_list_ptr;
+	_Atomic int stop;
+	_Atomic intptr_t percpu_list_ptr;
 };
 
 /* Worker threads modify data in their "active" percpu lists. */
@@ -1240,7 +1240,7 @@ void *test_membarrier_worker_thread(void *arg)
 			int cpu = get_current_cpu_id();
 
 			ret = rseq_offset_deref_addv(RSEQ_MO_RELAXED, RSEQ_PERCPU,
-				&args->percpu_list_ptr,
+				(intptr_t*)&args->percpu_list_ptr,
 				sizeof(struct percpu_list_entry) * cpu, 1, cpu);
 		} while (rseq_unlikely(ret));
 	}

---
base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
change-id: 20230908-kselftest-param_test-c-1763b62e762f

Best regards,
--
Justin Stitt <justinstitt@google.com>

