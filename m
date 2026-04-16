Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3AA3B9D97
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342124; cv=none; b=O0BEGlmvVy6rc9spZz1mk6yiiH2hQxY5HndY4ig6Kx+r4Vd4VK+eX2aiMNsqVihGIbvmwo2PWAul9NLg2ZbzdRNxcJRs/AxatLYX03mdPSb9MbITYpqOVbO1Z/I+PZ0sZpU56m67cxM6LQFv2bXRURonuTuK+x5gPPb2qnlrzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342124; c=relaxed/simple;
	bh=hWJ8+H+Blfisu42DAY3lw1ddjSGc9cOuFP++V3VJBps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cAmRDfRRdIoZG2pkYLHCQUeK/pzzNL3lN8sb55VInIRKBAY9fKMXduwyH0uuI7NL+7zA3GkqNzavaPVd8U5OHiCGpfI7qL763Z3eMqcoo9PPC9auLEJQ7kyFUQdfRc6oLB15XooIW2CYxFjAF2pHlyowI5hxh1T7Xo6ahlBdEgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SZLN0aun; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SZLN0aun"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso80111105e9.3
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342120; x=1776946920; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzY9VRtrVYWSoxe1jiy+R66Gwq92f7iLl/5W0Djg918=;
        b=SZLN0aunAAF6dAyeQrga6uZy3nWr57ZpwBx7EiSzh510Ym5GocRvz6nATaqookwrLr
         g03pfSBrHEfePHwlH4Kmt6WVDPL3mTO9UXso/0oi+AZTE9JphpO7ZnzR5h0RaM0d0ppS
         +GLmsRKWdIGtjkQtUnVQ4s+4cH1mbcYnTBhO2vz5qV1utJvYEbuW6jAQ77NJI0XezgRi
         XoA/e3+YisthUEhajlVI6Z0wFmD2QB9Th17GeIp/VHWrG3x/+w1YQEQmQcYjezStxKrX
         funZEKLqxJ4I3GbISfp2OzmOIdsAZwwqZNVSnT+htwYq3B2zJZbo0WL4XFVxX6TY8rVY
         iaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342120; x=1776946920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzY9VRtrVYWSoxe1jiy+R66Gwq92f7iLl/5W0Djg918=;
        b=e88tXBC6+4vkwkDGIW4vqrbyZZZC4JR7daFABpnb6UFQgfRyB8aCMl1RLf3CuWTYF6
         QaEeYm0skG9WqheQ4/vKiev8bdP6SqsjRutqyqDM4rBa24ZdFHfpwNWUblhzaeRuQJbf
         aQv7w1gxGDlZy8HZj7btJU1mEJTHuJOLddsqu2jGZnujmC3EH6eozB5CM8D0AMos4J8w
         SpX56IBxLkg0oppifB+57iWUmDsDf3xQq3TRiWHIyHDj4s4SCBdddUI/mWX0UuRtEV4Q
         Lq4HTUR62MI4lKsSXllhZXvR9dQkuLjZUCItxF6H1cV0l8x2Do9aYhkUai0AnUvAJRZW
         FXsw==
X-Forwarded-Encrypted: i=1; AFNElJ/HakDzlTnjyCMX4CMCgLtQFLyhUwSHBFERJjoVC8YZmrybGYGHG0bOvr69myZBiPcAELrE@lists.linux.dev
X-Gm-Message-State: AOJu0YypHgjQ9/UjD0PZJ03nKeTQCzVh5QeexHowzzkslvPcCRigFaKl
	s+LlGqhIwwF13FV3OzFEio+0mn2B1rZlkfhIlyO9jzLIfu28VHlQN8URyK6rQv7FtyU=
X-Gm-Gg: AeBDievq+TnmJqc2Llnny5b8DYREzPmJnd58pS6lyxrB9UByg5lHoThGzusGBqz8YmK
	8pUtvYb1BCr9roIMScr+farDR9704SDn987sbiMUcJmJVujyFF0io804mxtI/hFA9QUc0AtAWok
	c3rHY4Cu4McUMLSUlKHkdU2jmXZ6eK2lyLgPo7wAiWK5Si3Z17vY33cwgTkhqzTMtByiZ/4+/2i
	kUb+Be1HyA2tO3fo6UsSi1DMMhQ5pE4ojCUQZrq4t2TQWVMMS+B4+tFqrTEMQBylv2YfXXdN3qc
	ceVDc5ldr37R41+dkN4EUVS+BScXM61gd+T/zdUgWktb4LbaSqDvbylhLDoLOiQNXreGUz/9nwU
	Ic4sgQ6ovSlA9XrPsTltmoiHaCE39EH/I8eFvaMlTQtrWLlueICybg+TDaJ0oP9U6OlceK1vyxS
	Jvu8wpRBGn5tE=
X-Received: by 2002:a05:600c:c0c8:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-488d67bbc13mr268026475e9.4.1776342120400;
        Thu, 16 Apr 2026 05:22:00 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6b5627sm5559601c88.13.2026.04.16.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:59 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:24 -0300
Subject: [PATCH bpf-next v6 07/11] selftests/bpf: Skip tests whose objects
 were not built
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-7-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=4967;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=hWJ8+H+Blfisu42DAY3lw1ddjSGc9cOuFP++V3VJBps=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP1RYdFz4dIdJNgmyRKGDMQyYvBhRXBGYf5XMChZjsKK0nzxfC2HPOlU95uliz2hlrVjX5dMdkJ
 j4pdbbdEThAw=
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

