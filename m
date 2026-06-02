Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA4E3E0730
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405427; cv=none; b=s4bK9w1XTB9/InhYCfUn+maVpihvyN7Gnv5enyJ2Htwxl6OeoWMFVStahZl+4FyYV3UL040I3KNeQAT60WfNxjicVfpyUU/yps5290cSrPWvUAS7k82UjGhURwGbveJqDvBtxG13GliGzoaTDYsWNBVhzeahEjyo5Hv8qyEGD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405427; c=relaxed/simple;
	bh=M6OJfT3qSdP4lnrHz8anqee8kUQRnD0Hidbc1/0+8Oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHYP2tpL0BNp7jAqUXkSUYEWvGKZLXplZrLFXYwuhTNj7oyzjEytMGPip1fQjskSX+Y8XdBJMLDMqh+7qazyiDXXN6Ab+nytiFGt4Hp0yozyv9xUxrvqCuwh1LxwINXXfUzEnrnTPsaQ5kYHBXMyrrbGgcDL+U7wOjnCu/62qaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fXBxKlgl; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fXBxKlgl"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bed4f2f0898so296208766b.3
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405423; x=1781010223; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvXdowVtyuI/sQdPSdYXchM5M1PBQ4p+rahyvFeZ5AI=;
        b=fXBxKlglp5/lmAtaliZXHeE0TnNP0cMD/IsSYuPvUiCvfyQIe/Po5a4D3BaebHERnC
         xdanM1iEfUMbBt4vWu8ig4VBhy2m8LIhAWXGBGqZIgj+ilzKffoMp1fwdpZYt6E4xAO5
         vwAfuyKdGsiS07miCK9IzGMq8NrMpIqKXTwocs+jPT8aKEoCk/gpemi0k5UCCRphElo4
         H8hXoSSltzjF38/cccs/xyVU2t6+KEhTkDDiVSBUruKiswR4L5n4Q0jwVwPpxmZ+J+4j
         sEP2sl8w7VLKxF06sBLUrNpdRMNQGzOaQqmmUX6L3c416WJz8wVobxxeH6kk4ibd7FDP
         icbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405423; x=1781010223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gvXdowVtyuI/sQdPSdYXchM5M1PBQ4p+rahyvFeZ5AI=;
        b=fbTPuaz3Bua8mNm1S4JECSKD3jT9g0jjTGdNckzHM3NkHzZqD++A1qwM60SvR92Em7
         +XszY5u520t2DCw7omkxlDX88CAT1QNmJc7E2EnJyz49WODtt/GA84/I6M9AS71PvTk7
         KUmmdgY/7Q4ZW8OcFQ/uMvXL8LDyEmOEWCECu6vmMG9rLcpgQEjdSeb2pvyUQWWlQWBd
         XBkt+ioF+TcXodrDO2huQZ5pGNel72tk8+EifN2+m1SCP3oOl/Hz5n2WLQgHovfZqq4i
         2ZZEm4jJ6kTsXWKxrLtbSV3PmmhDpCuSvBMN9Xl7VbV8FxZU0YTNUB/XYnEvyuh3rk/+
         ITbg==
X-Forwarded-Encrypted: i=1; AFNElJ+MhsE3pX/xmAzdK+GXsNkK+NtQ8aPrVWC6G3mFvHfUfqH6YZ6PG3la1qeAtEmxTaDfuoEZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3EqeWTiUVFWOakdgE7XnRnqa0ucmPUzP1oIEU1elcRwwmEGN/
	QM82bJ8dcg+eNJWggbEDMQVy6AnH5qyaoMg0vG6NVnh9r3RSSj1Wz3jWveIEpk4nNVA=
X-Gm-Gg: Acq92OExzPWmuWlBA6EP0TH2GoqhqI2aTodFdwYCHMlFKyslgj83HoDag/4wFxXFCMU
	8RZeQpotCWvby31uEC0npxSO4ZUR/gYRKj8Jz1nAtfnJO7pgQdmH1KtCAx8ncYNwczQUWXL+gpN
	/Ww0+WuIIsRffFV72VP0ZmlOVoZMOlaC433yvsYcLdC+dK2M5Gu8oCbtDcx1wqEAqJhmrdoXGww
	0lqAFY/XWAlJ//s1kWm0m4SdD2DDK95dyt5dhtUdpEiTP2WiT/tbxKjzExUWrPssJ5W3UStF1NQ
	t/VvWLq1arcdIn7jd5N4No95PZv8OLaxVJ0RQIjqtcwV//D2N4VqwD6tZIyiTe6rWnKLqAZGA3P
	VtdwzTLjAd97h8DSUpnYWNkIgjMGtcxTENqbPI0Fso2PtZzl72o1B2/m4XdGFtKBb6ivehb8XRJ
	BT8U1WonRMjyDA1DtU4JsEtg==
X-Received: by 2002:a17:907:9804:b0:b9d:e301:20db with SMTP id a640c23a62f3a-beab2c5b6abmr978032466b.25.1780405423224;
        Tue, 02 Jun 2026 06:03:43 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beb2c4ca251sm373927366b.22.2026.06.02.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:42 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:56 -0300
Subject: [PATCH bpf-next RESEND v12 07/11] selftests/bpf: Skip tests whose
 objects were not built
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-7-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=5462;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=M6OJfT3qSdP4lnrHz8anqee8kUQRnD0Hidbc1/0+8Oc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO42RUtnZIHndSCnnVgwe1CRNhPwoE14l/dRzm98G/1mb45WSZUdfUGPbiD+bI9ENIF801GChpW
 htCh5W45WLwM=
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
 tools/testing/selftests/bpf/test_progs.c | 53 +++++++++++++++++++++++++++-----
 tools/testing/selftests/bpf/test_progs.h |  1 +
 2 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index cc14b13e23fe..7ba82974ee78 100644
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
@@ -1641,6 +1645,7 @@ static void calculate_summary_and_print_errors(struct test_env *env)
 	json_writer_t *w = NULL;
 
 	for (i = 0; i < prog_test_cnt; i++) {
+		struct prog_test_def *test = &prog_test_defs[i];
 		struct test_state *state = &test_states[i];
 
 		if (!state->tested)
@@ -1651,7 +1656,7 @@ static void calculate_summary_and_print_errors(struct test_env *env)
 
 		if (state->error_cnt)
 			fail_cnt++;
-		else
+		else if (!test->not_built)
 			succ_cnt++;
 	}
 
@@ -1700,8 +1705,13 @@ static void calculate_summary_and_print_errors(struct test_env *env)
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
@@ -1772,6 +1782,19 @@ static void server_main(void)
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
@@ -2046,15 +2069,20 @@ int main(int argc, char **argv)
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
@@ -2106,9 +2134,18 @@ int main(int argc, char **argv)
 
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
index 37955a8ad385..2cf950afcd85 100644
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
2.54.0

