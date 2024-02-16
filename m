Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E514AD32
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 23:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708127729; cv=none; b=m0uTiSj4AzrqLrYWz2sePGiMjO22IglT1ovnBUjAHLaBgtWJC9jE55ipX7Q1oa+8CeTjAy1FTzcn+S/0/KHhQ613oEhwQdbXcVIChcO7AuTWIrzGTLJEKWh704kYgNJRcl2KEcgc48raJE55mkQ20PQIlPo8aFZHUMTA1pKBlJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708127729; c=relaxed/simple;
	bh=JvHCpgh4aCf+IBbox5C5R6/5SztYcmRnsES50kS19ls=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=Ki70cpejn6xYh+sxC1L9a+y5+eHHjnseV0fFzU7IKzppWVisEjBvAkB07F5naCKRpsLR42WY/f1dzzGKWTCdHsIhaifarH0zLUpxsCzbxMu4Y60G3lyS71ym59/b0tQyvcUbQhtTNaoq1Uzd+v7agQkXBkf72TUS31Tbwnaeauk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kgqrfbzw; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kgqrfbzw"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcbfe1a42a4so5684487276.2
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 15:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708127726; x=1708732526; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1db4d5Ry/IAvhrQl71MJvl5OaxqbAsRxOegC78cfvLc=;
        b=kgqrfbzwhlq1T/ywsv4FngYl0pLDA361rSr2IoQTf8UCTzFegiVVD+M+9UBiyIAihL
         C7D72KKx2RGshlEiH6snPqMXDA+4rkZ9umuF+75gv11SGKOWshNSI6mZ6AUW65zeR2hK
         WjNFRpikZ4crFjTn906eCzQZzjq9n7PaCKSRYw4HkKkFIM4Zw0qgxEnYWrAehPaGf5Pm
         HuwbH9MEVruF1fX7KSGkDQntrkAtV3Le8wx3tTPi+Q/37HZowFV+vS0OFNvzPkV8RSXl
         fpD5e2gCH7Fux8qX6UpaN754TS1Mar/4RwZayeQmJxwztwBdMutFZMvzfU6FWUXZ8A9q
         w0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708127726; x=1708732526;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1db4d5Ry/IAvhrQl71MJvl5OaxqbAsRxOegC78cfvLc=;
        b=ANGueZ2YOEwYxE6wlNz3kK+2lTqDQZSw57yty2Iw9OrVhXEYZ16g5e0sjaiarb6axA
         3tk+1nqxR5EEDlxFMb4JFH0U2U/EfZ/o3bc9WLaZk9EBsne2XUBLkssNS65n/MUtwE63
         dEL8HOLHQ98P97Mn/U30LUtrijQkx+r9DOhaMUupMxvzc9VV0GSx7Bkm6uxu1i3IbfCc
         UnHHrRzvieVga9ZB5b5o4VLz2zKC9yAT77KFOb9pVVzZSKEXgb5Xnu1wp4lDFkyjFNgr
         hblNRwWTMh5c6ILPklOXHwrUxaTp/HPh7CdgA/DZ5rasyFsiwbZHAoPE3ec4cM8/inJP
         VS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvJKEUhbDInD+DDoB83Ldlau7Yz1z5SLlLq7nBxD3zf4k10iUZgCbmDEi0dQKGk3Sk+dF4PYcAzU6OHVE0UWl//keFhA==
X-Gm-Message-State: AOJu0Yy68FTImspFb0XHkngblTP42LB1reEh4aaJHqHchBxXQolFfawp
	+3q/g7zXA0S/6s0TMCkGIdw6/7w8YYNPN3LAqmt32ji73m5rHHWajWPXE328FJ5dd27HnKYRt7b
	T3y4OVA==
X-Google-Smtp-Source: AGHT+IE2brmciwBJhNcBrG0QyPHJFaDalVFuK47RtgzwrHtEKYgblCbE74jd+6Hyh5tPi6WvqbZ1KhiKaHj/
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4b5c:352:4272:e34e])
 (user=irogers job=sendgmr) by 2002:a25:bc92:0:b0:dcb:bc80:8333 with SMTP id
 e18-20020a25bc92000000b00dcbbc808333mr653600ybk.13.1708127726529; Fri, 16 Feb
 2024 15:55:26 -0800 (PST)
Date: Fri, 16 Feb 2024 15:52:00 -0800
In-Reply-To: <20240216235203.229256-1-irogers@google.com>
Message-Id: <20240216235203.229256-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240216235203.229256-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v5 6/8] perf tests: Use scandirat for shell script finding
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Avoid filename appending buffers by using openat, faccessat and
scandirat more widely. Turn the script's path back to a file name
using readlink from /proc/<pid>/fd/<fd>.

Read the script's description using api/io.h to avoid fdopen
conversions. Whilst reading perform additional sanity checks on the
script's contents.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/builtin-test.c  |  20 ++---
 tools/perf/tests/tests-scripts.c | 144 ++++++++++++++++++-------------
 tools/perf/tests/tests-scripts.h |   1 -
 3 files changed, 94 insertions(+), 71 deletions(-)

diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index eff3c62e9b47..162f9eb090ac 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -300,22 +300,19 @@ static int test_and_print(struct test_suite *t, int subtest)
 }
 
 struct shell_test {
-	const char *dir;
 	const char *file;
 };
 
 static int shell_test__run(struct test_suite *test, int subdir __maybe_unused)
 {
 	int err;
-	char script[PATH_MAX];
 	struct shell_test *st = test->priv;
+	char *cmd = NULL;
 
-	path__join(script, sizeof(script) - 3, st->dir, st->file);
-
-	if (verbose > 0)
-		strncat(script, " -v", sizeof(script) - strlen(script) - 1);
-
-	err = system(script);
+	if (asprintf(&cmd, "%s%s", st->file, verbose ? " -v" : "") < 0)
+		return TEST_FAIL;
+	err = system(cmd);
+	free(cmd);
 	if (!err)
 		return TEST_OK;
 
@@ -331,7 +328,7 @@ static int run_shell_tests(int argc, const char *argv[], int i, int width,
 	files = list_script_files();
 	if (!files)
 		return 0;
-	for (file = files; file->dir; file++) {
+	for (file = files; file->file; file++) {
 		int curr = i++;
 		struct test_case test_cases[] = {
 			{
@@ -345,13 +342,12 @@ static int run_shell_tests(int argc, const char *argv[], int i, int width,
 			.test_cases = test_cases,
 			.priv = &st,
 		};
-		st.dir = file->dir;
+		st.file = file->file;
 
 		if (test_suite.desc == NULL ||
 		    !perf_test__matches(test_suite.desc, curr, argc, argv))
 			continue;
 
-		st.file = file->file;
 		pr_info("%3d: %-*s:", i, width, test_suite.desc);
 
 		if (intlist__find(skiplist, i)) {
@@ -455,7 +451,7 @@ static int perf_test__list_shell(int argc, const char **argv, int i)
 	files = list_script_files();
 	if (!files)
 		return 0;
-	for (file = files; file->dir; file++) {
+	for (file = files; file->file; file++) {
 		int curr = i++;
 		struct test_suite t = {
 			.desc = file->desc
diff --git a/tools/perf/tests/tests-scripts.c b/tools/perf/tests/tests-scripts.c
index 4ebd841da05b..9b3b66dd5508 100644
--- a/tools/perf/tests/tests-scripts.c
+++ b/tools/perf/tests/tests-scripts.c
@@ -14,6 +14,7 @@
 #include <subcmd/parse-options.h>
 #include <sys/wait.h>
 #include <sys/stat.h>
+#include <api/io.h>
 #include "builtin.h"
 #include "tests-scripts.h"
 #include "color.h"
@@ -35,55 +36,69 @@ static size_t files_num = 0;
 static struct script_file *files = NULL;
 static int files_max_width = 0;
 
-static const char *shell_tests__dir(char *path, size_t size)
+static int shell_tests__dir_fd(void)
 {
-	const char *devel_dirs[] = { "./tools/perf/tests", "./tests", };
-	char *exec_path;
-	unsigned int i;
+	char path[PATH_MAX], *exec_path;
+	static const char * const devel_dirs[] = { "./tools/perf/tests/shell", "./tests/shell", };
 
-	for (i = 0; i < ARRAY_SIZE(devel_dirs); ++i) {
-		struct stat st;
+	for (size_t i = 0; i < ARRAY_SIZE(devel_dirs); ++i) {
+		int fd = open(devel_dirs[i], O_PATH);
 
-		if (!lstat(devel_dirs[i], &st)) {
-			scnprintf(path, size, "%s/shell", devel_dirs[i]);
-			if (!lstat(devel_dirs[i], &st))
-				return path;
-		}
+		if (fd >= 0)
+			return fd;
 	}
 
 	/* Then installed path. */
 	exec_path = get_argv_exec_path();
-	scnprintf(path, size, "%s/tests/shell", exec_path);
+	scnprintf(path, sizeof(path), "%s/tests/shell", exec_path);
 	free(exec_path);
-	return path;
+	return open(path, O_PATH);
 }
 
-static const char *shell_test__description(char *description, size_t size,
-                                           const char *path, const char *name)
+static char *shell_test__description(int dir_fd, const char *name)
 {
-	FILE *fp;
-	char filename[PATH_MAX];
-	int ch;
+	struct io io;
+	char buf[128], desc[256];
+	int ch, pos = 0;
 
-	path__join(filename, sizeof(filename), path, name);
-	fp = fopen(filename, "r");
-	if (!fp)
+	io__init(&io, openat(dir_fd, name, O_RDONLY), buf, sizeof(buf));
+	if (io.fd < 0)
 		return NULL;
 
 	/* Skip first line - should be #!/bin/sh Shebang */
+	if (io__get_char(&io) != '#')
+		goto err_out;
+	if (io__get_char(&io) != '!')
+		goto err_out;
 	do {
-		ch = fgetc(fp);
-	} while (ch != EOF && ch != '\n');
-
-	description = fgets(description, size, fp);
-	fclose(fp);
+		ch = io__get_char(&io);
+		if (ch < 0)
+			goto err_out;
+	} while (ch != '\n');
 
-	/* Assume first char on line is omment everything after that desc */
-	return description ? strim(description + 1) : NULL;
+	do {
+		ch = io__get_char(&io);
+		if (ch < 0)
+			goto err_out;
+	} while (ch == '#' || isspace(ch));
+	while (ch > 0 && ch != '\n') {
+		desc[pos++] = ch;
+		if (pos >= (int)sizeof(desc) - 1)
+			break;
+		ch = io__get_char(&io);
+	}
+	while (pos > 0 && isspace(desc[--pos]))
+		;
+	desc[++pos] = '\0';
+	close(io.fd);
+	return strdup(desc);
+err_out:
+	close(io.fd);
+	return NULL;
 }
 
 /* Is this full file path a shell script */
-static bool is_shell_script(const char *path)
+static bool is_shell_script(int dir_fd, const char *path)
 {
 	const char *ext;
 
@@ -91,20 +106,16 @@ static bool is_shell_script(const char *path)
 	if (!ext)
 		return false;
 	if (!strcmp(ext, ".sh")) { /* Has .sh extension */
-		if (access(path, R_OK | X_OK) == 0) /* Is executable */
+		if (faccessat(dir_fd, path, R_OK | X_OK, 0) == 0) /* Is executable */
 			return true;
 	}
 	return false;
 }
 
 /* Is this file in this dir a shell script (for test purposes) */
-static bool is_test_script(const char *path, const char *name)
+static bool is_test_script(int dir_fd, const char *name)
 {
-	char filename[PATH_MAX];
-
-	path__join(filename, sizeof(filename), path, name);
-	if (!is_shell_script(filename)) return false;
-	return true;
+	return is_shell_script(dir_fd, name);
 }
 
 /* Duplicate a string and fall over and die if we run out of memory */
@@ -120,12 +131,21 @@ static char *strdup_check(const char *str)
 	return newstr;
 }
 
-static void append_script(const char *dir, const char *file, const char *desc)
+static void append_script(int dir_fd, const char *name, char *desc)
 {
+	char filename[PATH_MAX], link[128];
 	struct script_file *files_tmp;
-	size_t files_num_tmp;
+	size_t files_num_tmp, len;
 	int width;
 
+	snprintf(link, sizeof(link), "/proc/%d/fd/%d", getpid(), dir_fd);
+	len = readlink(link, filename, sizeof(filename));
+	if (len < 0) {
+		pr_err("Failed to readlink %s", link);
+		return;
+	}
+	filename[len++] = '/';
+	strcpy(&filename[len], name);
 	files_num_tmp = files_num + 1;
 	if (files_num_tmp >= SIZE_MAX) {
 		pr_err("Too many script files\n");
@@ -142,10 +162,8 @@ static void append_script(const char *dir, const char *file, const char *desc)
 	/* Add file to end and NULL terminate the struct array */
 	files = files_tmp;
 	files_num = files_num_tmp;
-	files[files_num - 1].dir = strdup_check(dir);
-	files[files_num - 1].file = strdup_check(file);
-	files[files_num - 1].desc = strdup_check(desc);
-	files[files_num].dir = NULL;
+	files[files_num - 1].file = strdup_check(filename);
+	files[files_num - 1].desc = desc;
 	files[files_num].file = NULL;
 	files[files_num].desc = NULL;
 
@@ -154,32 +172,39 @@ static void append_script(const char *dir, const char *file, const char *desc)
 		files_max_width = width;
 }
 
-static void append_scripts_in_dir(const char *path)
+static void append_scripts_in_dir(int dir_fd)
 {
 	struct dirent **entlist;
 	struct dirent *ent;
 	int n_dirs, i;
-	char filename[PATH_MAX];
 
 	/* List files, sorted by alpha */
-	n_dirs = scandir(path, &entlist, NULL, alphasort);
+	n_dirs = scandirat(dir_fd, ".", &entlist, NULL, alphasort);
 	if (n_dirs == -1)
 		return;
 	for (i = 0; i < n_dirs && (ent = entlist[i]); i++) {
+		int fd;
+
 		if (ent->d_name[0] == '.')
 			continue; /* Skip hidden files */
-		if (is_test_script(path, ent->d_name)) { /* It's a test */
-			char bf[256];
-			const char *desc = shell_test__description
-				(bf, sizeof(bf), path, ent->d_name);
+		if (is_test_script(dir_fd, ent->d_name)) { /* It's a test */
+			char *desc = shell_test__description(dir_fd, ent->d_name);
 
 			if (desc) /* It has a desc line - valid script */
-				append_script(path, ent->d_name, desc);
-		} else if (is_directory(path, ent)) { /* Scan the subdir */
-			path__join(filename, sizeof(filename),
-				   path, ent->d_name);
-			append_scripts_in_dir(filename);
+				append_script(dir_fd, ent->d_name, desc);
+			continue;
+		}
+		if (ent->d_type != DT_DIR) {
+			struct stat st;
+
+			if (ent->d_type != DT_UNKNOWN)
+				continue;
+			fstatat(dir_fd, ent->d_name, &st, 0);
+			if (!S_ISDIR(st.st_mode))
+				continue;
 		}
+		fd = openat(dir_fd, ent->d_name, O_PATH);
+		append_scripts_in_dir(fd);
 	}
 	for (i = 0; i < n_dirs; i++) /* Clean up */
 		zfree(&entlist[i]);
@@ -188,14 +213,17 @@ static void append_scripts_in_dir(const char *path)
 
 const struct script_file *list_script_files(void)
 {
-	char path_dir[PATH_MAX];
-	const char *path;
+	int dir_fd;
 
 	if (files)
 		return files; /* Singleton - we already know our list */
 
-	path = shell_tests__dir(path_dir, sizeof(path_dir)); /* Walk  dir */
-	append_scripts_in_dir(path);
+	dir_fd = shell_tests__dir_fd(); /* Walk  dir */
+	if (dir_fd < 0)
+		return NULL;
+
+	append_scripts_in_dir(dir_fd);
+	close(dir_fd);
 
 	return files;
 }
diff --git a/tools/perf/tests/tests-scripts.h b/tools/perf/tests/tests-scripts.h
index 3a3ec6191848..3508a293aaf9 100644
--- a/tools/perf/tests/tests-scripts.h
+++ b/tools/perf/tests/tests-scripts.h
@@ -3,7 +3,6 @@
 #define TESTS_SCRIPTS_H
 
 struct script_file {
-	char *dir;
 	char *file;
 	char *desc;
 };
-- 
2.44.0.rc0.258.g7320e95886-goog

