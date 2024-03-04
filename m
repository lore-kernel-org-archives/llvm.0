Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C7626A0
	for <llvm@lists.linux.dev>; Mon,  4 Mar 2024 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709575916; cv=none; b=tk0wqZDyy+dyiFXpQgjj38fa2xjZ1A7ItEHM7KF4kUgLtJWmaaJUYazmFmxMA/NHWspjFmTiW7AQ9OJ4IDGeVOcWnqG+TsMUnb/jzPXufEPf5qQQvnLpIhUKjv88KrJS6LvHz8ZU7KkuXMpNR9kHDC+2htTr+Fn7G5u9aY2ujQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709575916; c=relaxed/simple;
	bh=MScqXbgh2ejjfIy/Sp3FOyl/aojS0G+mf0C488clcqM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nXhoBj81HHoa7daF0y8b9R3MFrRP+bPvcSNqdrbAbsYlUf4axq70kmZBSaxOsbdBkY3PDRWaCsKXWJP5aYBoR8aGoAGneJXGlHu4TV/1CBnHivACTZK5FgwH/eVe/a4MgSbIybqvRs2GtRW70QroR0lLoaIiLVnTZLAS5/Yy39E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ilKg4DSV; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ilKg4DSV"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6e5a145ab89so2999233b3a.0
        for <llvm@lists.linux.dev>; Mon, 04 Mar 2024 10:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709575914; x=1710180714; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs5vwdtP3lE2gaF2HIymTQhqiVBDxVfpiBYTXFLcGDM=;
        b=ilKg4DSVw2l/hebFdezX4C+I/UkGajProf3YjYwE9aiRf0KsiyKh+jdAupX4fckiTD
         LeReXEjJiLm8H8Jj0zz6TkSVQGig6MWO9t8IqwzmqrrJXsKQdcTe3dusHfeDmxOEIVog
         ATIi3BeeuMLixlyS+wLyAsOCcqZEGZXzrfNEolzfvg5Rl9A1GdO0d4tLmRN0Q118YjqP
         4Oic+Sq01cAS2DZK5Cf5jFf3IKiZs6PzytPho3RQs9PD1ULhERC1P9D7MTp2RpxzW+p/
         KvAwGnFsvPI3EZBledLolyUdmnGVlj6zZBCHAfO075RJU9aCBIy8mOebXf3XiZImEo9I
         zq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709575914; x=1710180714;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs5vwdtP3lE2gaF2HIymTQhqiVBDxVfpiBYTXFLcGDM=;
        b=JzU1ku4iIt4vm1bM2nm4Oc+7pFOoTA1UEAUWuQrEPNDcl1HDAJnqHMUVd1vW/1WLqE
         t3rIfMT5mDnQ9MEJedsrAG2cB02CPJb58jFzfiUSb4yGQLDArRI3wX7YllZeyGOZecYe
         oRFOQuN9B6rSwoIVGkr9Ejgn2XnqgdGtfoILnWfgSW6P19dlpCG2HPRWty6VD6sQFXkm
         Ri9n4rfh6GILrcHFK2ofiQHicKSjHrFYY/uvM+hooOhOBX3cU9bpF/FVj8zz1srGWohe
         6b73TT6PX8T8yRbkamIYycR7VeWp4wFbQCAZyohe2AwKg+hryVAcHDY1dwv0Tx4cYyb4
         +HYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpuTgKP0yXSCISN6YosfKEjrDsA7RcxOVfP7YqymP1Wu82Kh6zWNjt02dD7rFWzZqdrRdVpLAGEpJ8p9AF/2NsxNJMvA==
X-Gm-Message-State: AOJu0Ywalsa8SvZFoDsfR+EYgNC1Ge8ZZuUmfu7Tm6J88rNCD3eoIzBj
	7CnJTTShm/thJsxXnW5ehPQGKvZFlcW/yjm1JIGC/3Zgthdf3rO7CIwN4oXpOR2eW0afDGSpAZr
	+jA==
X-Google-Smtp-Source: AGHT+IF7KqVnyc41EkIolVtSQO6rbDjjbbUw9e2d1bsUL0JqfeSVikRN4mrRaBo+n6JY/DRESTPhKhoP27U=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:aa7:888a:0:b0:6e6:2541:8b4a with SMTP id
 z10-20020aa7888a000000b006e625418b4amr24416pfe.5.1709575914639; Mon, 04 Mar
 2024 10:11:54 -0800 (PST)
Date: Mon,  4 Mar 2024 18:11:33 +0000
In-Reply-To: <20240304181140.644212-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240304181140.644212-1-edliaw@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240304181140.644212-3-edliaw@google.com>
Subject: [PATCH v1 2/3] selftests/timers/posix_timers: Use TAP reporting format
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[edliaw: Fix checkpatch recommendations]
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/timers/posix_timers.c | 161 +++++++-----------
 1 file changed, 66 insertions(+), 95 deletions(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 03779b6b3c20..0f550fc9e879 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -10,6 +10,7 @@
 #include <sys/time.h>
 #include <stdio.h>
 #include <signal.h>
+#include <string.h>
 #include <unistd.h>
 #include <time.h>
 #include <pthread.h>
@@ -19,6 +20,20 @@
 #define DELAY 2
 #define USECS_PER_SEC 1000000
 
+static void __fatal_error(const char *test, const char *name, const char *what)
+{
+	char buf[64];
+
+	strerror_r(errno, buf, sizeof(buf));
+
+	if (name && strlen(name))
+		ksft_exit_fail_msg("%s %s %s %s\n", test, name, what, buf);
+	else
+		ksft_exit_fail_msg("%s %s %s\n", test, what, buf);
+}
+
+#define fatal_error(name, what)		__fatal_error(__func__, name, what)
+
 static volatile int done;
 
 /* Busy loop in userspace to elapse ITIMER_VIRTUAL */
@@ -67,15 +82,13 @@ static int check_diff(struct timeval start, struct timeval end)
 	diff = end.tv_usec - start.tv_usec;
 	diff += (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
 
-	if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
-		printf("Diff too high: %lld..", diff);
+	if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2)
 		return -1;
-	}
 
 	return 0;
 }
 
-static int check_itimer(int which)
+static void check_itimer(int which)
 {
 	const char *name;
 	int err;
@@ -91,7 +104,7 @@ static int check_itimer(int which)
 	else if (which == ITIMER_REAL)
 		name = "ITIMER_REAL";
 	else
-		return -1;
+		ksft_exit_fail_msg("Unknown setitimer() type %d\n", which);
 
 	done = 0;
 
@@ -103,16 +116,12 @@ static int check_itimer(int which)
 		signal(SIGALRM, sig_handler);
 
 	err = gettimeofday(&start, NULL);
-	if (err < 0) {
-		ksft_perror("Can't call gettimeofday()");
-		return -1;
-	}
+	if (err < 0)
+		fatal_error(name, "gettimeofday()");
 
 	err = setitimer(which, &val, NULL);
-	if (err < 0) {
-		ksft_perror("Can't set timer");
-		return -1;
-	}
+	if (err < 0)
+		fatal_error(name, "setitimer()");
 
 	if (which == ITIMER_VIRTUAL)
 		user_loop();
@@ -122,19 +131,15 @@ static int check_itimer(int which)
 		idle_loop();
 
 	err = gettimeofday(&end, NULL);
-	if (err < 0) {
-		ksft_perror("Can't call gettimeofday()");
-		return -1;
-	}
+	if (err < 0)
+		fatal_error(name, "gettimeofday()");
 
-	ksft_test_result(check_diff(start, end) == 0, "%s\n", name);
-
-	return 0;
+	ksft_test_result(!check_diff(start, end), "%s %s\n", __func__, name);
 }
 
-static int check_timer_create(int which)
+static void check_timer_create(int which)
 {
-	const char *type;
+	const char *name;
 	int err;
 	timer_t id;
 	struct timeval start, end;
@@ -142,47 +147,37 @@ static int check_timer_create(int which)
 		.it_value.tv_sec = DELAY,
 	};
 
-	if (which == CLOCK_THREAD_CPUTIME_ID) {
-		type = "thread";
-	} else if (which == CLOCK_PROCESS_CPUTIME_ID) {
-		type = "process";
-	} else {
-		ksft_print_msg("Unknown timer_create() type %d\n", which);
-		return -1;
-	}
+	if (which == CLOCK_THREAD_CPUTIME_ID)
+		name = "thread";
+	else if (which == CLOCK_PROCESS_CPUTIME_ID)
+		name = "process";
+	else
+		ksft_exit_fail_msg("Unknown timer_create() type %d\n", which);
 
 	done = 0;
 	err = timer_create(which, NULL, &id);
-	if (err < 0) {
-		ksft_perror("Can't create timer");
-		return -1;
-	}
-	signal(SIGALRM, sig_handler);
+	if (err < 0)
+		fatal_error(name, "timer_create()");
+
+	if (signal(SIGALRM, sig_handler) == SIG_ERR)
+		fatal_error(name, "signal()");
 
 	err = gettimeofday(&start, NULL);
-	if (err < 0) {
-		ksft_perror("Can't call gettimeofday()");
-		return -1;
-	}
+	if (err < 0)
+		fatal_error(name, "gettimeofday()");
 
 	err = timer_settime(id, 0, &val, NULL);
-	if (err < 0) {
-		ksft_perror("Can't set timer");
-		return -1;
-	}
+	if (err < 0)
+		fatal_error(name, "timer_settime()");
 
 	user_loop();
 
 	err = gettimeofday(&end, NULL);
-	if (err < 0) {
-		ksft_perror("Can't call gettimeofday()");
-		return -1;
-	}
+	if (err < 0)
+		fatal_error(name, "gettimeofday()");
 
 	ksft_test_result(check_diff(start, end) == 0,
-			 "timer_create() per %s\n", type);
-
-	return 0;
+			 "%s %s\n", __func__, name);
 }
 
 static int remain;
@@ -205,7 +200,7 @@ static void distribution_handler(int nr)
  * Test that all running threads _eventually_ receive CLOCK_PROCESS_CPUTIME_ID
  * timer signals. This primarily tests that the kernel does not favour any one.
  */
-static int check_timer_distribution(void)
+static void check_timer_distribution(void)
 {
 	const int nthreads = 10;
 	pthread_t threads[nthreads];
@@ -221,26 +216,20 @@ static int check_timer_distribution(void)
 
 	done = 0;
 	remain = nthreads + 1;  /* worker threads + this thread */
-	signal(SIGALRM, distribution_handler);
+	if (signal(SIGALRM, distribution_handler) == SIG_ERR)
+		fatal_error(NULL, "signal()");
+
 	err = timer_create(CLOCK_PROCESS_CPUTIME_ID, NULL, &id);
-	if (err < 0) {
-		ksft_perror("Can't create timer");
-		return -1;
-	}
+	if (err < 0)
+		fatal_error(NULL, "timer_create()");
+
 	err = timer_settime(id, 0, &val, NULL);
-	if (err < 0) {
-		ksft_perror("Can't set timer");
-		return -1;
-	}
+	if (err < 0)
+		fatal_error(NULL, "timer_settime()");
 
 	for (i = 0; i < nthreads; i++) {
-		err = pthread_create(&threads[i], NULL, distribution_thread,
-				     NULL);
-		if (err) {
-			ksft_print_msg("Can't create thread: %s (%d)\n",
-				       strerror(errno), errno);
-			return -1;
-		}
+		if (pthread_create(&threads[i], NULL, distribution_thread, NULL))
+			fatal_error(NULL, "pthread_create()");
 	}
 
 	/* Wait for all threads to receive the signal. */
@@ -252,23 +241,15 @@ static int check_timer_distribution(void)
 	}
 	done = 1;
 
-	if (timer_delete(id)) {
-		ksft_perror("Can't delete timer\n");
-		return -1;
-	}
+	if (timer_delete(id))
+		fatal_error(NULL, "timer_delete()");
 
 	for (i = 0; i < nthreads; i++) {
-		err = pthread_join(threads[i], NULL);
-		if (err) {
-			ksft_print_msg("Can't join thread: %s (%d)\n",
-				       strerror(errno), errno);
-			return -1;
-		}
+		if (pthread_join(threads[i], NULL))
+			fatal_error(NULL, "pthread_join()");
 	}
 
 	ksft_test_result((now - start <= 5), "%s\n", __func__);
-
-	return 0;
 }
 
 int main(int argc, char **argv)
@@ -279,17 +260,10 @@ int main(int argc, char **argv)
 	ksft_print_msg("Testing posix timers. False negative may happen on CPU execution\n");
 	ksft_print_msg("based timers if other threads run on the CPU...\n");
 
-	if (check_itimer(ITIMER_VIRTUAL) < 0)
-		return ksft_exit_fail();
-
-	if (check_itimer(ITIMER_PROF) < 0)
-		return ksft_exit_fail();
-
-	if (check_itimer(ITIMER_REAL) < 0)
-		return ksft_exit_fail();
-
-	if (check_timer_create(CLOCK_THREAD_CPUTIME_ID) < 0)
-		return ksft_exit_fail();
+	check_itimer(ITIMER_VIRTUAL);
+	check_itimer(ITIMER_PROF);
+	check_itimer(ITIMER_REAL);
+	check_timer_create(CLOCK_THREAD_CPUTIME_ID);
 
 	/*
 	 * It's unfortunately hard to reliably test a timer expiration
@@ -300,11 +274,8 @@ int main(int argc, char **argv)
 	 * to ensure true parallelism. So test only one thread until we
 	 * find a better solution.
 	 */
-	if (check_timer_create(CLOCK_PROCESS_CPUTIME_ID) < 0)
-		return ksft_exit_fail();
-
-	if (check_timer_distribution() < 0)
-		return ksft_exit_fail();
+	check_timer_create(CLOCK_PROCESS_CPUTIME_ID);
+	check_timer_distribution();
 
 	ksft_finished();
 }
-- 
2.44.0.rc1.240.g4c46232300-goog

