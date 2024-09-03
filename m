Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B21D223C
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725396016; cv=none; b=fWKVYpuT8179+bCHENXjMjL71Xq3PdUZM9WTLHEupticmUCNUVkp1tbIl3hITjAUnpu/soP8ADkZ9q7FxHV2FbPXN3nQl21E82tRDExK0xyQ1G7LcOF7mR4z9dLBbSG1oawOgJ/5f/PPTahbFWdJ6TQUKkS44c8wscw1zIBjK04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725396016; c=relaxed/simple;
	bh=cCmLjf308k6OsUJLrInpoUdAeJs7fWLaNbFSDImA684=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JrWW/uWDDwtliiiE0PaqpZmUgU+0q9rcUf7MQJ/NIrAx3rd78rAoNdtlIS6GgRyPzIsqEC5WSU3f9MqD7CVCaQzK7WWhBHfoUxrs5gG3bL9iTT4YiKfWqWXazJpz8CyJpUQrqV8mmkZw4DxxL/exxZsZ7wcIVJcxSpAwmBoKOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E4yREPw9; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4yREPw9"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d73d0944acso53770607b3.1
        for <llvm@lists.linux.dev>; Tue, 03 Sep 2024 13:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725396013; x=1726000813; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gr0+wD1hQSkgsAJy15LgXOqT17mmHStoYkWLI3kOh1E=;
        b=E4yREPw9uONyYqH7LDtaXuICIwwE6mKFDElPTlF0E5fuu682i/kcfdjVNOpY4S0TEO
         7JcfyirkTjXi6K9+MlNfsbj5CkYPfoJ+m4zM7v/1l0IRJGJRW7Eubgk30bD7qEOOeAZC
         ZT4F1iRntr60MqbeUIwSyKz6l6NkHg4Xihs5oABEgVQErvF2FU+zZ8ITd4lgvJLuu0ZW
         f5zy0hUsGAm6ZlDpJ67ZrRx+F6IRIGHSZE8zcGFIhHKgOH+PV51F5fdYcaY6Y1BhH1Di
         0whClLWxA94NWwoKyrLhhJd3PBD/VgoO4NWCzy21imqbad/XK326vRhboWjZr2B5NuXW
         NfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725396013; x=1726000813;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gr0+wD1hQSkgsAJy15LgXOqT17mmHStoYkWLI3kOh1E=;
        b=Q4ctCswCiNv6bkUNp8f6Q6hREzt8hgwcFsOQsq9CtI6eshmWHyRmSfLhQ3symP29zq
         KEh9EHSM/l7LrMGa/Iwfan0cIe6CXUWExqLA6dc/dXetj7G2zWe4oSwqUZqIYGAI5/BG
         LM9eYz3gIoyBtaWzaCmobz+FsTiqVa/UoOkkhgYsxXwGkzTEEkprjnSyw6M2x8gLBazt
         tER6nYF0mfE9BJkmyOKgJEQlGJ0W5BB8wVNMpdxxyHff3UJdJg5yrZtnQ5837IkUZhV4
         4L/iinkb0ChLtBBTUFB3WbhlVqUjkdvWmnegawqn5EwQSCZ87JO3IPseRz6ZHUu6Z6a0
         GvAA==
X-Forwarded-Encrypted: i=1; AJvYcCWHHINo3gOTbDF16OOmMxG6Jo/YtfWewAs+xn2QM7sXTuJZpNZQe3nZNmYqsSQKNoixCepa@lists.linux.dev
X-Gm-Message-State: AOJu0YyR6vNwqCB1NVWF/kMN9GpNauCVCQ+vokJX/pvRdoaa4Duvya+6
	22rZ8VBV1FRvZIETYq5+GnhUy4ZpJ2egR+q+KwYRFe1krNncyCT/fTRKZsC96R3CnnSarsqF50T
	XGw==
X-Google-Smtp-Source: AGHT+IFl6cBrYkda8nNgdZrTivfv3zjTpKUU2f25L9umrr7vatGI4GPL+9fg9hOyModMI6oj7rvGWFpN3Tw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:4888:b0:6ad:e9c1:fc4f with SMTP id
 00721157ae682-6d40f922d32mr317297b3.5.1725396012716; Tue, 03 Sep 2024
 13:40:12 -0700 (PDT)
Date: Tue,  3 Sep 2024 20:39:12 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240903203915.3383774-1-edliaw@google.com>
Subject: [PATCH RESEND] selftests/futex: Order calls in futex_requeue
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Shuah Khan <shuah@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Oleg Nesterov <oleg@redhat.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Davidlohr Bueso <dbueso@suse.de>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Similar to fbf4dec70277 ("selftests/futex: Order calls to
futex_lock_pi"), which fixed a flake in futex_lock_pi due to racing
between the parent and child threads.

The same issue can occur in the futex_requeue test, because it expects
waiterfn to make progress to futex_wait before the parent starts to
requeue. This is mitigated by the parent sleeping for WAKE_WAIT_US, but
it still fails occasionally. This can be reproduced by adding a sleep in
the waiterfn before futex_wait:

TAP version 13
1..2
not ok 1 futex_requeue simple returned: 0
not ok 2 futex_requeue simple returned: 0
not ok 3 futex_requeue many returned: 0
not ok 4 futex_requeue many returned: 0

Instead, replace the sleep with barriers to make the sequencing
explicit.

Fixes: 7cb5dd8e2c8c ("selftests: futex: Add futex compare requeue test")
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../selftests/futex/functional/futex_requeue.c       | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index 51485be6eb2f..8f7d3e8bf32a 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -12,9 +12,9 @@
 
 #define TEST_NAME "futex-requeue"
 #define timeout_ns  30000000
-#define WAKE_WAIT_US 10000
 
 volatile futex_t *f1;
+static pthread_barrier_t barrier;
 
 void usage(char *prog)
 {
@@ -32,6 +32,8 @@ void *waiterfn(void *arg)
 	to.tv_sec = 0;
 	to.tv_nsec = timeout_ns;
 
+	pthread_barrier_wait(&barrier);
+
 	if (futex_wait(f1, *f1, &to, 0))
 		printf("waiter failed errno %d\n", errno);
 
@@ -70,13 +72,15 @@ int main(int argc, char *argv[])
 	ksft_print_msg("%s: Test futex_requeue\n",
 		       basename(argv[0]));
 
+	pthread_barrier_init(&barrier, NULL, 2);
 	/*
 	 * Requeue a waiter from f1 to f2, and wake f2.
 	 */
 	if (pthread_create(&waiter[0], NULL, waiterfn, NULL))
 		error("pthread_create failed\n", errno);
 
-	usleep(WAKE_WAIT_US);
+	pthread_barrier_wait(&barrier);
+	pthread_barrier_destroy(&barrier);
 
 	info("Requeuing 1 futex from f1 to f2\n");
 	res = futex_cmp_requeue(f1, 0, &f2, 0, 1, 0);
@@ -99,6 +103,7 @@ int main(int argc, char *argv[])
 		ksft_test_result_pass("futex_requeue simple succeeds\n");
 	}
 
+	pthread_barrier_init(&barrier, NULL, 11);
 
 	/*
 	 * Create 10 waiters at f1. At futex_requeue, wake 3 and requeue 7.
@@ -109,7 +114,8 @@ int main(int argc, char *argv[])
 			error("pthread_create failed\n", errno);
 	}
 
-	usleep(WAKE_WAIT_US);
+	pthread_barrier_wait(&barrier);
+	pthread_barrier_destroy(&barrier);
 
 	info("Waking 3 futexes at f1 and requeuing 7 futexes from f1 to f2\n");
 	res = futex_cmp_requeue(f1, 0, &f2, 3, 7, 0);
-- 
2.46.0.469.g59c65b2a67-goog

