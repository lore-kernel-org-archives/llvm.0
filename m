Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D54176259
	for <llvm@lists.linux.dev>; Wed, 18 Sep 2024 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726701068; cv=none; b=ZK51zgR31ElLDl7XVJS1kC1H8o7qV2kxQ/q5UrUvP8GbZTpPV9nr1kHYbGY/TJ44jQunP9d01HjA2vS+WlFX0LiIOYlgv7Us7/wS8g3dosOfX7LyZCRV+wG3l5BJuP3UB30Q23aJOgEYTtdbprQ8wdTeyS9DaE1tN+svakqrFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726701068; c=relaxed/simple;
	bh=jEpaRqX8x9ZoV7NGwJBcnn25L7osKDYWpdYayHxA/LA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lfgLDEJVteosDDRy63C47EJFtGc3xwF1Oy2Xe9ZLAGBchZ1FCKPKFsJFt75jnKptoX6aFyBZZvo4Ac/VRpNkJI5Qr1ONtjtWqfgKLNYUEkgU+HU9/mmOarNghdvVXDaF3nLwLFsLKtOBpq4EgmGGPhgrpfWuokz/IxvOtTeJSAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DpYwtDtz; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DpYwtDtz"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7198667a879so282324b3a.2
        for <llvm@lists.linux.dev>; Wed, 18 Sep 2024 16:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726701066; x=1727305866; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YA0w8JE4YsZuKs1FGvLh6dGW1GjJTJ/xAnovafRZBSc=;
        b=DpYwtDtzaHd8Iv+j6VPdS7E7VdBByqAX5IRSzF5/vRHsZrkwAu/m0Jw7GnSdWF8/Js
         a01c7PuPempxZweE+oy0v2m/+3XGmrLF7RDfXQ8YXdZu2vp2Dy9L7zG0ZveNLdyO23/S
         wcYzvWHHB/UUMOO1fS/DqH/LYOrAkND3kY8T8nKbSr3fhmdXR8XTcp9tyCkc/v/ZRZ0M
         c8YLyoE1CKLTFTYHFPOI02pLh4/sY6gFu2tQKPG9Va36mhLAUOw1p/fRfW5gndEvtwVL
         BmrjSgUGQ3kmtck+ihVhb5v+6wu0FVdomxS4zcLDfWmGNi2TBNQ2hUJr3Bjk5PCQN/LO
         5D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726701066; x=1727305866;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YA0w8JE4YsZuKs1FGvLh6dGW1GjJTJ/xAnovafRZBSc=;
        b=kCoxOvLMQS8zVcvZhR/imKxJI2Ax51V6oRePZ7qhGNAdMsAZBTKLb0r+f/nqXcrwEQ
         GRvrXED0e0KMA+2b8kAAVWXWwS0Jtm9dPJ10VRyV72hoaY0ntEN3ZSZjFcPVXaWWJ86i
         ETXCmCJy99aV6nJTHpQsIwFCExnsCNKiLX6+2qcuN6MPUb9JYYdPxKTBv0UUJJHf+WOY
         Upv1bYEb31gv6/ZOKjrBj7NEirNEJPBElSCvnh2HSeTZ4grxbrkLaBjy2jKKpjWEMe0j
         m8zgnuLMxIQGggi29lBcAz24l2mGt4J+v4n/8b8MmKDjEevagbMon2V6zldWQ+WtqygC
         CNMg==
X-Forwarded-Encrypted: i=1; AJvYcCVDRbZXwSo8C6HVzrYdbFUmhkfeMalDaHSlVhA7s8PzxJPhRVJd4+cIqKR7i5z9IYtqU0N7@lists.linux.dev
X-Gm-Message-State: AOJu0YzOTNL7vvGhboeEcdbQuSLVumAq2A2AUY52fmTJQXkiZC74fsHm
	826OvethLP8aE7d8omFJvDkLpvRDZP2hAzBRHZMPkNygkSlemhrwYOs/0jh/Vjw25IQW5YLgxw7
	Hvg==
X-Google-Smtp-Source: AGHT+IFR5wvpsM8KmOcWHfEpfCZTMacE04uaSHilS6oprIqygqchRKXw74pEjG1MSWi2VY6unf7hnOt+cOo=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a62:e302:0:b0:718:d4f5:aa40 with SMTP id
 d2e1a72fcca58-71936b74189mr42304b3a.5.1726701065978; Wed, 18 Sep 2024
 16:11:05 -0700 (PDT)
Date: Wed, 18 Sep 2024 23:11:00 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918231102.234253-1-edliaw@google.com>
Subject: [PATCH RESEND v2] selftests/futex: Order calls in futex_requeue
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"H. Peter Anvin" <hpa@linux.intel.com>, Andy Lutomirski <luto@mit.edu>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Davidlohr Bueso <dbueso@suse.de>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixes a race between parent and child threads in futex_requeue.

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
Signed-off-by: Edward Liaw <edliaw@google.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
---
 .../selftests/futex/functional/futex_requeue.c       | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/too=
ls/testing/selftests/futex/functional/futex_requeue.c
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
 	to.tv_sec =3D 0;
 	to.tv_nsec =3D timeout_ns;

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
 	res =3D futex_cmp_requeue(f1, 0, &f2, 0, 1, 0);
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
 	res =3D futex_cmp_requeue(f1, 0, &f2, 3, 7, 0);
--
2.46.0.662.g92d0881bb0-goog

