Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100D9330666
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367893; cv=none; b=SJRhcZk1geQg1A97RfKW+31JGpkX8Z6Fk6TGxk3fk1YLC5igFebIWwi7kWq/gNSXMeGwcDiY6zySgu+gRQwW3L/CGdLiYuIyiJOd4ClWFtNU46RkKweFj1IiMW2MLmrnEVQMkqCjHsEF/jEJkI4yCQsLPddoGjFcTn+vKvEXaSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367893; c=relaxed/simple;
	bh=hWJ8+H+Blfisu42DAY3lw1ddjSGc9cOuFP++V3VJBps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dpngi5R4JAeChZmvh8GBJIq9xu6+dJS5SXmzfWbDBYTIumwguPFh1cR+uXHG05YMsYoWWJM7c/QVEcddyZuphgZSquIn2a8Iw8KE2kSPxWTZFI2M+XfXlJ42JMhUY7ZVYd5HPNpcPnz6f09jCK5/311104QaioF8Qsspj9MvLQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TL6dfJSL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TL6dfJSL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488c2690057so85088435e9.0
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367885; x=1776972685; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzY9VRtrVYWSoxe1jiy+R66Gwq92f7iLl/5W0Djg918=;
        b=TL6dfJSLYYouI/JhR/S0ww5qPLJUXKQKri2agCrRV3POJJVQlrYqsQ6LCH5VqV5ygM
         crrk70aCEPg/OE/PU9J+HpOXfouNwMFqaf1yYEWyeNj2b9vqGqIb6amappPkM7n9vAgD
         jyeNHkcuIeEiwjN2hVRAiFCdxzKigxgsSr+x69Yg1wVwKTezB5IsJacL3uzjk0bMji9Y
         XWGL4s9vWn75wV5jdEE7Pg6o2cBESLNq0FqgUMWhHCS4lYPZqGxxlkTlNBot/Vf8Cste
         H+oGgwta7pUuH3mf1OVb60/QGRkxjjle4wyqBcRbjqWJxxWhkpXy/7xRvRnDm2lJzEjE
         01RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367885; x=1776972685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzY9VRtrVYWSoxe1jiy+R66Gwq92f7iLl/5W0Djg918=;
        b=LJInUVc8ZrHUorj0mBn5AI31Pfsnuj9yQGd3ooclI4G9DJVEnO9zcfN9i6QVBIkgoQ
         I1+bD36xN4AeQALHvIbvqcEq+Wnok6eBtmx4tAhv0S450Zo1aL2tzJV6zboQx0gGbsmk
         k+pAMVcGcUiQSxj27a1wIB9DK0+Q2e1ZTpA+rGF34NOG0pjspIu10ymNpYVMWwtgAFjf
         w/si9VNZemf0vknBFIlziec60FSYWIXdBM/W+MD8PzGe6dQiTWxY1FThgCsIk7ZXe+nm
         2q8UgHWdFw8rED3U3camP2yzjei4eWHppXBu7YClk+OjRpmVm2MFVHbcd3w7ovhcMHcV
         37NA==
X-Forwarded-Encrypted: i=1; AFNElJ8jH1qVno1MoypGMvyi5Mh3/t+pGvCCraV3JmfPY7yKtKBmzkN9RyMbpdc7aVLgUU6VR3Nd@lists.linux.dev
X-Gm-Message-State: AOJu0YxNwALz1QfDBUBcALRarpkmh2sZ6rhR4NrRVfm7IQeBun3t+QyT
	RB4tLdEVW7JsnP7ML+yYiH6ne/m1JhufW4EK9NGaqzI66CJSgFTAMG+FBRfgqxQ0o9s=
X-Gm-Gg: AeBDiessq3KqxBSTDAUWZRXnn0Jdd/qd9kj3m/YGVshhTkXwuc9EVX/cjKLQJplM/eq
	eZmJKGzJRyOH7T7kn9fC89iYF14eTlhAexsU3cnEp4cZGqeX2ihVW6lv3CxvFe63YIV9U5DpKci
	el7t76N0HT34uWCpJxtvX26k6bQw67rD0HK+yBUMMJZIeJ5MCJqEEzNeIP2Xg0AKn09yRO/TQOW
	Tk7tg0F5JPu9KecFELdEluIiZsZoLaFfYd0r485zkdf3KlYcMkFL23VsP1UOvmdxeqBHrjRj6fz
	iPe9xuTNPK/hWmX0TitE+5UucpSLv1jvdZUi/N4l2Fd2AUuhwRr5F2ZTxyyTeaD0O+S4k4cpHp1
	CxTvXy7y5Bwiuvsv2Eo8RkWurFWJDUrz/HlQQb+sEruLw1QE1mIDQXNSR3/Nsur6UBczW/ryILD
	S2zPFZZds73xAJbd6gdNxwDyY=
X-Received: by 2002:a05:600c:870c:b0:488:f360:da55 with SMTP id 5b1f17b1804b1-488fb26a08cmr2979535e9.12.1776367885464;
        Thu, 16 Apr 2026 12:31:25 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6b4fb8sm7038996c88.12.2026.04.16.12.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:24 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:56 -0300
Subject: [PATCH bpf-next v7 07/11] selftests/bpf: Skip tests whose objects
 were not built
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-7-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=4967;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=hWJ8+H+Blfisu42DAY3lw1ddjSGc9cOuFP++V3VJBps=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QC/NQqkOc7/4wXuZel4KZQa2/0iCQXtsCyHnx/qHGepqi9ZH/1cnpG+Y3ttsMsWCYYjv+EQjyFa
 0ZPtDTlYedAo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When both run_test and run_serial_test are NULL (because the corresponding
.test.o was not compiled), mark the test as not built instead of fatally
aborting.

Report these tests as "SKIP (not built)" in per-test output and include
them in the skip count so they remain visible in CI results and JSON
output. The summary line shows the not-built count when nonzero:

  Summary: 50/55 PASSED, 5 SKIPPED (3 not built), 0 FAILED

Tests filtered out by -t/-n remain invisible as before; only genuinely
unbuilt tests are surfaced.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_progs.c | 50 +++++++++++++++++++++++++++-----
 tools/testing/selftests/bpf/test_progs.h |  1 +
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 7fe16b5131b1..f04a579ecd4d 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -165,6 +165,8 @@ struct prog_test_def {
 	void (*run_test)(void);
 	void (*run_serial_test)(void);
 	bool should_run;
+	bool not_built;
+	bool selected;
 	bool need_cgroup_cleanup;
 	bool should_tmon;
 };
@@ -372,6 +374,8 @@ static void print_test_result(const struct prog_test_def *test, const struct tes
 	fprintf(env.stdout_saved, "#%-*d %s:", TEST_NUM_WIDTH, test->test_num, test->test_name);
 	if (test_state->error_cnt)
 		fprintf(env.stdout_saved, "FAIL");
+	else if (test->not_built)
+		fprintf(env.stdout_saved, "SKIP (not built)");
 	else if (!skipped_cnt)
 		fprintf(env.stdout_saved, "OK");
 	else if (skipped_cnt == subtests_cnt || !subtests_cnt)
@@ -1700,8 +1704,13 @@ static void calculate_summary_and_print_errors(struct test_env *env)
 	if (env->json)
 		fclose(env->json);
 
-	printf("Summary: %d/%d PASSED, %d SKIPPED, %d FAILED\n",
-	       succ_cnt, sub_succ_cnt, skip_cnt, fail_cnt);
+	if (env->not_built_cnt)
+		printf("Summary: %d/%d PASSED, %d SKIPPED (%d not built), %d FAILED\n",
+		       succ_cnt, sub_succ_cnt, skip_cnt, env->not_built_cnt,
+		       fail_cnt);
+	else
+		printf("Summary: %d/%d PASSED, %d SKIPPED, %d FAILED\n",
+		       succ_cnt, sub_succ_cnt, skip_cnt, fail_cnt);
 
 	env->succ_cnt = succ_cnt;
 	env->sub_succ_cnt = sub_succ_cnt;
@@ -1772,6 +1781,19 @@ static void server_main(void)
 		run_one_test(i);
 	}
 
+	/* mark not-built tests as skipped */
+	for (int i = 0; i < prog_test_cnt; i++) {
+		struct prog_test_def *test = &prog_test_defs[i];
+		struct test_state *state = &test_states[i];
+
+		if (test->not_built && test->selected) {
+			state->tested = true;
+			state->skip_cnt = 1;
+			env.not_built_cnt++;
+			print_test_result(test, state);
+		}
+	}
+
 	/* generate summary */
 	fflush(stderr);
 	fflush(stdout);
@@ -2046,15 +2068,20 @@ int main(int argc, char **argv)
 		struct prog_test_def *test = &prog_test_defs[i];
 
 		test->test_num = i + 1;
-		test->should_run = should_run(&env.test_selector,
-					      test->test_num, test->test_name);
+		test->selected = should_run(&env.test_selector,
+					    test->test_num, test->test_name);
+		test->should_run = test->selected;
 
-		if ((test->run_test == NULL && test->run_serial_test == NULL) ||
-		    (test->run_test != NULL && test->run_serial_test != NULL)) {
+		if (test->run_test && test->run_serial_test) {
 			fprintf(stderr, "Test %d:%s must have either test_%s() or serial_test_%sl() defined.\n",
 				test->test_num, test->test_name, test->test_name, test->test_name);
 			exit(EXIT_ERR_SETUP_INFRA);
 		}
+		if (!test->run_test && !test->run_serial_test) {
+			test->not_built = true;
+			test->should_run = false;
+			continue;
+		}
 		if (test->should_run)
 			test->should_tmon = should_tmon(&env.tmon_selector, test->test_name);
 	}
@@ -2106,9 +2133,18 @@ int main(int argc, char **argv)
 
 	for (i = 0; i < prog_test_cnt; i++) {
 		struct prog_test_def *test = &prog_test_defs[i];
+		struct test_state *state = &test_states[i];
 
-		if (!test->should_run)
+		if (!test->should_run) {
+			if (test->not_built && test->selected &&
+			    !env.get_test_cnt && !env.list_test_names) {
+				state->tested = true;
+				state->skip_cnt = 1;
+				env.not_built_cnt++;
+				print_test_result(test, state);
+			}
 			continue;
+		}
 
 		if (env.get_test_cnt) {
 			env.succ_cnt++;
diff --git a/tools/testing/selftests/bpf/test_progs.h b/tools/testing/selftests/bpf/test_progs.h
index 1a44467f4310..6ee10360e314 100644
--- a/tools/testing/selftests/bpf/test_progs.h
+++ b/tools/testing/selftests/bpf/test_progs.h
@@ -125,6 +125,7 @@ struct test_env {
 	int sub_succ_cnt; /* successful sub-tests */
 	int fail_cnt; /* total failed tests + sub-tests */
 	int skip_cnt; /* skipped tests */
+	int not_built_cnt; /* tests not built */
 
 	int saved_netns_fd;
 	int workers; /* number of worker process */

-- 
2.53.0

