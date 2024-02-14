Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF4312B69
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707886491; cv=none; b=dUn/AYDGQN9YkN6458lXOEOHX9Z6DvpP15Lgss76QCcBB8lqNFb99j/4iI39LemPwoO6HITGVCtwif2zkpByLTuSvXeMTM3+u+CnREsvVd6ULGdDwNhJQHv9RhXAV4ZLEwRZCCfutj1J0sR+jIURydqOmjOKBmlaWRC9DYmHnuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707886491; c=relaxed/simple;
	bh=e3Zo3j0Y+lDByuniGWZetsyjr0YP2URaOB3bhuKdkPg=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=f6nTSmrz62rHbGmKrpgwzwpnaqjd2Tw6ePe8TDb60oxK8yWJynULD/5Q34FFsaonIunlo43DH35J0QUGmqJ7pt+TnUjP0ZK1syrZ38YLOYVH1dORddujvgP1Kvk2ouOcfwnL+laAruEpbc/9dBKurdze5lCr+ZL6GZNhDkdPleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vyGSirfC; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vyGSirfC"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5ffee6fcdc1so82503887b3.2
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707886488; x=1708491288; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKUjhtJivPO8JCDFJHJoi47s/FDcERs+KA6j2+NQ9Pw=;
        b=vyGSirfCAXP4iOkLl9xKqY+7yPDhMpdbhY+lVVrVqgdID3o4jn6gPDx51Rbo3yNvui
         F7XmobbG1d6oVi3at4j46Zs9vfPxLoxdh6gj3XtJJQy1Ap1LX+ODc5lnRoRXTQOj7tbe
         pD+OWQi6wLtjP3d/eVlm3izLglxg+0BudQSezDd8z1SjRqotuiFQ82Vbi2AmFHuY+tRf
         JJ9gNqruPczT00qhkNjYtIg0Y3y2GGKmUVi2XUR9znIyKI3DM8GFXPxKge5KRuBvJ5hW
         XPyXApzttnrfC6H/m5nhtNl1U+yV/jYZvQawZMUIXra5+CGNlJKOXTAldjGawBpVSr1U
         FIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707886488; x=1708491288;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKUjhtJivPO8JCDFJHJoi47s/FDcERs+KA6j2+NQ9Pw=;
        b=O1UT3g1DbVKRm5pxmOPkBiDECwfiphH+CkKs0f9JWiBW4ZDE2/x7FigeOd91q431eR
         ZcnWixYpsLfp+fCS2/E10yf05Q4x12e9BFaaAQJEoZjLSPjUrmA1Ml47vO1tQhmqnz1R
         x4VBQIwKmSOlMtai+pboyoJw6+hGPz04KPcqadUpqMRkPYtEIQS8FA6dEnSfrRkTDGYn
         L+RQ++U9Xtbbp+3+A78b2it7QOBHqiugiEN9yCo6GxRWln00u8rObsegNqx8RU67aRAi
         37/wSaEMvtvqSv+dzdAtXWjyILjTlSrRfoMz0Yo+TucN3o2XDEvSRUDpOjLwxgx6Zquv
         RofQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfETx3YSZRmusjLmBAfRQ2OUdFU60ZLiq/4rk8tTYGNADftqZts8x5ZvY6Iv+M065IEhIfRy985+0SCLPY0P0lFgk2Sg==
X-Gm-Message-State: AOJu0Yw4JZznCAj+hivkPJgSCnZQ3r+KtmPDY+lsL9P6jZTY4rpMLPn0
	SPYRvydgqRyUNtGt3OaXYG4DwdtnbJosXhor29dBKt1MQCx2zbDHAG4SKn4qRcCMht+U6M/nj9l
	4Q1PL6w==
X-Google-Smtp-Source: AGHT+IFaN3HW0664XFpfWjVh+YIsZwjCWaY/qcAJfYwFw79REvzT+YK/wfYBlfPVn+iiGWFoQcPfD5tRp/xV
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:6d92:85eb:9adc:66dd])
 (user=irogers job=sendgmr) by 2002:a05:6902:1505:b0:dcc:8be2:7cb0 with SMTP
 id q5-20020a056902150500b00dcc8be27cb0mr77852ybu.0.1707886488084; Tue, 13 Feb
 2024 20:54:48 -0800 (PST)
Date: Tue, 13 Feb 2024 20:53:55 -0800
In-Reply-To: <20240214045356.748330-1-irogers@google.com>
Message-Id: <20240214045356.748330-8-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240214045356.748330-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v4 7/8] perf tests: Run time generate shell test suites
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@arm.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rather than special shell test logic, do a single pass to create an
array of test suites. Hold the shell test file name in the test suite
priv field. This makes the special shell test logic in builtin-test.c
redundant so remove it.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/builtin-test.c  |  91 +---------------------
 tools/perf/tests/tests-scripts.c | 130 ++++++++++++++++++-------------
 tools/perf/tests/tests-scripts.h |  10 +--
 3 files changed, 81 insertions(+), 150 deletions(-)

diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 6d5001daaf63..c42cb40fc242 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -130,6 +130,7 @@ static struct test_suite *generic_tests[] = {
 static struct test_suite **tests[] = {
 	generic_tests,
 	arch_tests,
+	NULL, /* shell tests created at runtime. */
 };
 
 static struct test_workload *workloads[] = {
@@ -299,74 +300,12 @@ static int test_and_print(struct test_suite *t, int subtest)
 	return err;
 }
 
-struct shell_test {
-	const char *file;
-};
-
-static int shell_test__run(struct test_suite *test, int subdir __maybe_unused)
-{
-	int err;
-	struct shell_test *st = test->priv;
-	char *cmd;
-
-	asprintf(&cmd, "%s%s", st->file, verbose ? " -v" : "");
-	if (!cmd)
-		return TEST_FAIL;
-	err = system(cmd);
-	free(cmd);
-	if (!err)
-		return TEST_OK;
-
-	return WEXITSTATUS(err) == 2 ? TEST_SKIP : TEST_FAIL;
-}
-
-static int run_shell_tests(int argc, const char *argv[], int i, int width,
-				struct intlist *skiplist)
-{
-	struct shell_test st;
-	const struct script_file *files, *file;
-
-	files = list_script_files();
-	if (!files)
-		return 0;
-	for (file = files; file->file; file++) {
-		int curr = i++;
-		struct test_case test_cases[] = {
-			{
-				.desc = file->desc,
-				.run_case = shell_test__run,
-			},
-			{ .name = NULL, }
-		};
-		struct test_suite test_suite = {
-			.desc = test_cases[0].desc,
-			.test_cases = test_cases,
-			.priv = &st,
-		};
-		st.file = file->file;
-
-		if (test_suite.desc == NULL ||
-		    !perf_test__matches(test_suite.desc, curr, argc, argv))
-			continue;
-
-		pr_info("%3d: %-*s:", i, width, test_suite.desc);
-
-		if (intlist__find(skiplist, i)) {
-			color_fprintf(stderr, PERF_COLOR_YELLOW, " Skip (user override)\n");
-			continue;
-		}
-
-		test_and_print(&test_suite, 0);
-	}
-	return 0;
-}
-
 static int __cmd_test(int argc, const char *argv[], struct intlist *skiplist)
 {
 	struct test_suite *t;
 	unsigned int j, k;
 	int i = 0;
-	int width = list_script_max_width();
+	int width = 0;
 
 	for_each_test(j, k, t) {
 		int len = strlen(test_description(t, -1));
@@ -441,28 +380,6 @@ static int __cmd_test(int argc, const char *argv[], struct intlist *skiplist)
 			}
 		}
 	}
-
-	return run_shell_tests(argc, argv, i, width, skiplist);
-}
-
-static int perf_test__list_shell(int argc, const char **argv, int i)
-{
-	const struct script_file *files, *file;
-
-	files = list_script_files();
-	if (!files)
-		return 0;
-	for (file = files; file->file; file++) {
-		int curr = i++;
-		struct test_suite t = {
-			.desc = file->desc
-		};
-
-		if (!perf_test__matches(t.desc, curr, argc, argv))
-			continue;
-
-		pr_info("%3d: %s\n", i, t.desc);
-	}
 	return 0;
 }
 
@@ -489,9 +406,6 @@ static int perf_test__list(int argc, const char **argv)
 					test_description(t, subi));
 		}
 	}
-
-	perf_test__list_shell(argc, argv, i);
-
 	return 0;
 }
 
@@ -551,6 +465,7 @@ int cmd_test(int argc, const char **argv)
 	/* Unbuffered output */
 	setvbuf(stdout, NULL, _IONBF, 0);
 
+	tests[2] = create_script_test_suites();
 	argc = parse_options_subcommand(argc, argv, test_options, test_subcommands, test_usage, 0);
 	if (argc >= 1 && !strcmp(argv[0], "list"))
 		return perf_test__list(argc - 1, argv + 1);
diff --git a/tools/perf/tests/tests-scripts.c b/tools/perf/tests/tests-scripts.c
index 9b3b66dd5508..e60867b1e5ce 100644
--- a/tools/perf/tests/tests-scripts.c
+++ b/tools/perf/tests/tests-scripts.c
@@ -26,16 +26,6 @@
 #include "tests.h"
 #include "util/rlimit.h"
 
-
-/*
- * As this is a singleton built once for the run of the process, there is
- * no value in trying to free it and just let it stay around until process
- * exits when it's cleaned up.
- */
-static size_t files_num = 0;
-static struct script_file *files = NULL;
-static int files_max_width = 0;
-
 static int shell_tests__dir_fd(void)
 {
 	char path[PATH_MAX], *exec_path;
@@ -131,12 +121,31 @@ static char *strdup_check(const char *str)
 	return newstr;
 }
 
-static void append_script(int dir_fd, const char *name, char *desc)
+static int shell_test__run(struct test_suite *test, int subtest __maybe_unused)
+{
+	const char *file = test->priv;
+	int err;
+	char *cmd;
+
+	asprintf(&cmd, "%s%s", file, verbose ? " -v" : "");
+	if (!cmd)
+		return TEST_FAIL;
+	err = system(cmd);
+	free(cmd);
+	if (!err)
+		return TEST_OK;
+
+	return WEXITSTATUS(err) == 2 ? TEST_SKIP : TEST_FAIL;
+}
+
+static void append_script(int dir_fd, const char *name, char *desc,
+			  struct test_suite ***result,
+			  size_t *result_sz)
 {
 	char filename[PATH_MAX], link[128];
-	struct script_file *files_tmp;
-	size_t files_num_tmp, len;
-	int width;
+	struct test_suite *test_suite, **result_tmp;
+	struct test_case *tests;
+	size_t len;
 
 	snprintf(link, sizeof(link), "/proc/%d/fd/%d", getpid(), dir_fd);
 	len = readlink(link, filename, sizeof(filename));
@@ -146,33 +155,43 @@ static void append_script(int dir_fd, const char *name, char *desc)
 	}
 	filename[len++] = '/';
 	strcpy(&filename[len], name);
-	files_num_tmp = files_num + 1;
-	if (files_num_tmp >= SIZE_MAX) {
-		pr_err("Too many script files\n");
-		abort();
+
+	tests = calloc(2, sizeof(*tests));
+	if (!tests) {
+		pr_err("Out of memory while building script test suite list\n");
+		return;
 	}
+	tests[0].name = strdup_check(name);
+	tests[0].desc = strdup_check(desc);
+	tests[0].run_case = shell_test__run;
+
+	test_suite = zalloc(sizeof(*test_suite));
+	if (!test_suite) {
+		pr_err("Out of memory while building script test suite list\n");
+		free(tests);
+		return;
+	}
+	test_suite->desc = desc;
+	test_suite->test_cases = tests;
+	test_suite->priv = strdup_check(filename);
 	/* Realloc is good enough, though we could realloc by chunks, not that
 	 * anyone will ever measure performance here */
-	files_tmp = realloc(files,
-			    (files_num_tmp + 1) * sizeof(struct script_file));
-	if (files_tmp == NULL) {
-		pr_err("Out of memory while building test list\n");
-		abort();
+	result_tmp = realloc(*result, (*result_sz + 1) * sizeof(*result_tmp));
+	if (result_tmp == NULL) {
+		pr_err("Out of memory while building script test suite list\n");
+		free(tests);
+		free(test_suite);
+		return;
 	}
 	/* Add file to end and NULL terminate the struct array */
-	files = files_tmp;
-	files_num = files_num_tmp;
-	files[files_num - 1].file = strdup_check(filename);
-	files[files_num - 1].desc = desc;
-	files[files_num].file = NULL;
-	files[files_num].desc = NULL;
-
-	width = strlen(desc); /* Track max width of desc */
-	if (width > files_max_width)
-		files_max_width = width;
+	*result = result_tmp;
+	(*result)[*result_sz] = test_suite;
+	(*result_sz)++;
 }
 
-static void append_scripts_in_dir(int dir_fd)
+static void append_scripts_in_dir(int dir_fd,
+				  struct test_suite ***result,
+				  size_t *result_sz)
 {
 	struct dirent **entlist;
 	struct dirent *ent;
@@ -191,7 +210,7 @@ static void append_scripts_in_dir(int dir_fd)
 			char *desc = shell_test__description(dir_fd, ent->d_name);
 
 			if (desc) /* It has a desc line - valid script */
-				append_script(dir_fd, ent->d_name, desc);
+				append_script(dir_fd, ent->d_name, desc, result, result_sz);
 			continue;
 		}
 		if (ent->d_type != DT_DIR) {
@@ -204,32 +223,35 @@ static void append_scripts_in_dir(int dir_fd)
 				continue;
 		}
 		fd = openat(dir_fd, ent->d_name, O_PATH);
-		append_scripts_in_dir(fd);
+		append_scripts_in_dir(fd, result, result_sz);
 	}
 	for (i = 0; i < n_dirs; i++) /* Clean up */
 		zfree(&entlist[i]);
 	free(entlist);
 }
 
-const struct script_file *list_script_files(void)
+struct test_suite **create_script_test_suites(void)
 {
-	int dir_fd;
-
-	if (files)
-		return files; /* Singleton - we already know our list */
-
-	dir_fd = shell_tests__dir_fd(); /* Walk  dir */
-	if (dir_fd < 0)
-		return NULL;
+	struct test_suite **result = NULL, **result_tmp;
+	size_t result_sz = 0;
+	int dir_fd = shell_tests__dir_fd(); /* Walk  dir */
 
-	append_scripts_in_dir(dir_fd);
-	close(dir_fd);
+	/*
+	 * Append scripts if fd is good, otherwise return a NULL terminated zero
+	 * length array.
+	 */
+	if (dir_fd >= 0)
+		append_scripts_in_dir(dir_fd, &result, &result_sz);
 
-	return files;
-}
-
-int list_script_max_width(void)
-{
-	list_script_files(); /* Ensure we have scanned all scripts */
-	return files_max_width;
+	result_tmp = realloc(result, (result_sz + 1) * sizeof(*result_tmp));
+	if (result_tmp == NULL) {
+		pr_err("Out of memory while building script test suite list\n");
+		abort();
+	}
+	/* NULL terminate the test suite array. */
+	result = result_tmp;
+	result[result_sz] = NULL;
+	if (dir_fd >= 0)
+		close(dir_fd);
+	return result;
 }
diff --git a/tools/perf/tests/tests-scripts.h b/tools/perf/tests/tests-scripts.h
index 3508a293aaf9..b553ad26ea17 100644
--- a/tools/perf/tests/tests-scripts.h
+++ b/tools/perf/tests/tests-scripts.h
@@ -2,14 +2,8 @@
 #ifndef TESTS_SCRIPTS_H
 #define TESTS_SCRIPTS_H
 
-struct script_file {
-	char *file;
-	char *desc;
-};
+#include "tests.h"
 
-/* List available script tests to run - singleton - never freed */
-const struct script_file *list_script_files(void);
-/* Get maximum width of description string */
-int list_script_max_width(void);
+struct test_suite **create_script_test_suites(void);
 
 #endif /* TESTS_SCRIPTS_H */
-- 
2.43.0.687.g38aa6559b0-goog

