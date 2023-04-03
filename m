Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830D8191
	for <llvm@lists.linux.dev>; Mon,  3 Apr 2023 18:41:03 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-545d3b026a8so249115367b3.7
        for <llvm@lists.linux.dev>; Mon, 03 Apr 2023 11:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680547262;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxpnc6V+BLhZie01D44ojVhVFOFzbhA9j9GSFH/Nu8Y=;
        b=hwj88vaJ4+Y4t44Pc7JAEIdjdu8O+kDcQlAMsCQw7f3eC4J4s2p1hGBaWc/NXwC63O
         DsyOegPMB/uCFpPEuRNW+gZBhzRnTCzpSZVLrEZFjyuRWjIyzuTBHnYw1Pv8070uFG26
         qhGj4p3dV5TmAtSKqpGa17nztcr9TOGMDgRtAgghoJ+7Bdx8ZyceLKefYRf7FyiPEJIu
         +OYg+ZOltwIrfH0g5uNmwX6r+ImNZfZ/Z6cKXUUzQFIs8bCAGgaUTOmooJ/N8f5Ncilq
         f1qVdKHUurqvdGC+d6KWT+Z/nOGsLwKH+2aRDRlAB97AhRt13ViY1G4vgKxve0i50N6j
         IP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547262;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxpnc6V+BLhZie01D44ojVhVFOFzbhA9j9GSFH/Nu8Y=;
        b=druG+cAH68DIqXxpfy9OPSMNE8mq8gWkUEWk7QRW5XTxq1/2ekatnCZBSCzbIAuBDE
         V6QGOhHNoTpL7+zYUvc99MENRCW4Ihz4hlb/A4oescUDjwNasqruiO5ljyZJuE/YVwEn
         N/s5OsbacVKh/+UP0eAJO1zPgW7ZN3uAUcsOjSwk3IIpRgrq4P2Ocy1vdtU7TxMmKto5
         rhnZVe0FmmcH8Fl1jyyNHYjv287RLjIP6xYhGwR00OHlt4vTUgZymynHAV/cGfSe9SUp
         WqNc4EVe78mP8QI/ZpTA5Aoo3Vp6EdW9AekdxBGqCOsgBYzUVlNcKIrKsqtpopaPhUNk
         zG0Q==
X-Gm-Message-State: AAQBX9ehCyiBE1KZ7cyrLWCw0FhbQKgsEfr4N6mUoHcvO0cALjA1RkXJ
	sIY6INa69xfaii5Hy+Vseljb8bLUGJ74
X-Google-Smtp-Source: AKy350a5kQmmVSvp0tyGx5e/hXylOZJGTBzQf0fmA0bgB9ai4hvhQLfXnGtmA6gY28gBxX+rjE3YN9CRxmVL
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:9dc:a977:817d:341])
 (user=irogers job=sendgmr) by 2002:a81:b20a:0:b0:541:7237:6e6b with SMTP id
 q10-20020a81b20a000000b0054172376e6bmr14ywh.0.1680547261957; Mon, 03 Apr 2023
 11:41:01 -0700 (PDT)
Date: Mon,  3 Apr 2023 11:40:31 -0700
In-Reply-To: <20230403184033.1836023-1-irogers@google.com>
Message-Id: <20230403184033.1836023-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230403184033.1836023-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v2 2/4] perf srcline: Simplify addr2line subprocess
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Don't wrap stdin and stdout of subprocess with streams, use the api/io
library for buffering.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/srcline.c | 103 ++++++++++++++------------------------
 1 file changed, 38 insertions(+), 65 deletions(-)

diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
index f0a96a834e4b..5339ab4c5e12 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -10,6 +10,8 @@
 #include <linux/string.h>
 #include <linux/zalloc.h>
 
+#include <api/io.h>
+
 #include "util/dso.h"
 #include "util/debug.h"
 #include "util/callchain.h"
@@ -366,12 +368,6 @@ void dso__free_a2l(struct dso *dso)
 
 #else /* HAVE_LIBBFD_SUPPORT */
 
-struct a2l_subprocess {
-	struct child_process addr2line;
-	FILE *to_child;
-	FILE *from_child;
-};
-
 static int filename_split(char *filename, unsigned int *line_nr)
 {
 	char *sep;
@@ -393,28 +389,18 @@ static int filename_split(char *filename, unsigned int *line_nr)
 	return 0;
 }
 
-static void addr2line_subprocess_cleanup(struct a2l_subprocess *a2l)
+static void addr2line_subprocess_cleanup(struct child_process *a2l)
 {
-	if (a2l->addr2line.pid != -1) {
-		kill(a2l->addr2line.pid, SIGKILL);
-		finish_command(&a2l->addr2line); /* ignore result, we don't care */
-		a2l->addr2line.pid = -1;
-	}
-
-	if (a2l->to_child != NULL) {
-		fclose(a2l->to_child);
-		a2l->to_child = NULL;
-	}
-
-	if (a2l->from_child != NULL) {
-		fclose(a2l->from_child);
-		a2l->from_child = NULL;
+	if (a2l->pid != -1) {
+		kill(a2l->pid, SIGKILL);
+		finish_command(a2l); /* ignore result, we don't care */
+		a2l->pid = -1;
 	}
 
 	free(a2l);
 }
 
-static struct a2l_subprocess *addr2line_subprocess_init(const char *addr2line_path,
+static struct child_process *addr2line_subprocess_init(const char *addr2line_path,
 							const char *binary_path)
 {
 	const char *argv[] = {
@@ -422,54 +408,34 @@ static struct a2l_subprocess *addr2line_subprocess_init(const char *addr2line_pa
 		"-e", binary_path,
 		"-i", "-f", NULL
 	};
-	struct a2l_subprocess *a2l = zalloc(sizeof(*a2l));
+	struct child_process *a2l = zalloc(sizeof(*a2l));
 	int start_command_status = 0;
 
-	if (a2l == NULL)
-		goto out;
-
-	a2l->to_child = NULL;
-	a2l->from_child = NULL;
+	if (a2l == NULL) {
+		pr_err("Failed to allocate memory for addr2line");
+		return NULL;
+	}
 
-	a2l->addr2line.pid = -1;
-	a2l->addr2line.in = -1;
-	a2l->addr2line.out = -1;
-	a2l->addr2line.no_stderr = 1;
+	a2l->pid = -1;
+	a2l->in = -1;
+	a2l->out = -1;
+	a2l->no_stderr = 1;
 
-	a2l->addr2line.argv = argv;
-	start_command_status = start_command(&a2l->addr2line);
-	a2l->addr2line.argv = NULL; /* it's not used after start_command; avoid dangling pointers */
+	a2l->argv = argv;
+	start_command_status = start_command(a2l);
+	a2l->argv = NULL; /* it's not used after start_command; avoid dangling pointers */
 
 	if (start_command_status != 0) {
 		pr_warning("could not start addr2line (%s) for %s: start_command return code %d\n",
 			addr2line_path, binary_path, start_command_status);
-		goto out;
-	}
-
-	a2l->to_child = fdopen(a2l->addr2line.in, "w");
-	if (a2l->to_child == NULL) {
-		pr_warning("could not open write-stream to addr2line (%s) of %s\n",
-			addr2line_path, binary_path);
-		goto out;
-	}
-
-	a2l->from_child = fdopen(a2l->addr2line.out, "r");
-	if (a2l->from_child == NULL) {
-		pr_warning("could not open read-stream from addr2line (%s) of %s\n",
-			addr2line_path, binary_path);
-		goto out;
+		addr2line_subprocess_cleanup(a2l);
+		return NULL;
 	}
 
 	return a2l;
-
-out:
-	if (a2l)
-		addr2line_subprocess_cleanup(a2l);
-
-	return NULL;
 }
 
-static int read_addr2line_record(struct a2l_subprocess *a2l,
+static int read_addr2line_record(struct io *io,
 				 char **function,
 				 char **filename,
 				 unsigned int *line_nr)
@@ -494,7 +460,7 @@ static int read_addr2line_record(struct a2l_subprocess *a2l,
 	if (line_nr != NULL)
 		*line_nr = 0;
 
-	if (getline(&line, &line_len, a2l->from_child) < 0 || !line_len)
+	if (io__getline(io, &line, &line_len) < 0 || !line_len)
 		goto error;
 	if (function != NULL)
 		*function = strdup(strim(line));
@@ -502,7 +468,7 @@ static int read_addr2line_record(struct a2l_subprocess *a2l,
 	zfree(&line);
 	line_len = 0;
 
-	if (getline(&line, &line_len, a2l->from_child) < 0 || !line_len)
+	if (io__getline(io, &line, &line_len) < 0 || !line_len)
 		goto error;
 
 	if (filename_split(line, line_nr == NULL ? &dummy_line_nr : line_nr) == 0) {
@@ -546,13 +512,17 @@ static int addr2line(const char *dso_name, u64 addr,
 		     struct inline_node *node,
 		     struct symbol *sym __maybe_unused)
 {
-	struct a2l_subprocess *a2l = dso->a2l;
+	struct child_process *a2l = dso->a2l;
 	char *record_function = NULL;
 	char *record_filename = NULL;
 	unsigned int record_line_nr = 0;
 	int record_status = -1;
 	int ret = 0;
 	size_t inline_count = 0;
+	int len;
+	char buf[128];
+	ssize_t written;
+	struct io io;
 
 	if (!a2l) {
 		if (!filename__has_section(dso_name, ".debug_line"))
@@ -578,13 +548,16 @@ static int addr2line(const char *dso_name, u64 addr,
 	 * though, because it may be genuinely unknown, in which case we'll get two sets of
 	 * "??"/"??:0" lines.
 	 */
-	if (fprintf(a2l->to_child, "%016"PRIx64"\n,\n", addr) < 0 || fflush(a2l->to_child) != 0) {
+	len = snprintf(buf, sizeof(buf), "%016"PRIx64"\n,\n", addr);
+	written = len > 0 ? write(a2l->in, buf, len) : -1;
+	if (written != len) {
 		if (!symbol_conf.disable_add2line_warn)
 			pr_warning("%s %s: could not send request\n", __func__, dso_name);
 		goto out;
 	}
+	io__init(&io, a2l->out, buf, sizeof(buf));
 
-	switch (read_addr2line_record(a2l, &record_function, &record_filename, &record_line_nr)) {
+	switch (read_addr2line_record(&io, &record_function, &record_filename, &record_line_nr)) {
 	case -1:
 		if (!symbol_conf.disable_add2line_warn)
 			pr_warning("%s %s: could not read first record\n", __func__, dso_name);
@@ -594,7 +567,7 @@ static int addr2line(const char *dso_name, u64 addr,
 		 * The first record was invalid, so return failure, but first read another
 		 * record, since we asked a junk question and have to clear the answer out.
 		 */
-		switch (read_addr2line_record(a2l, NULL, NULL, NULL)) {
+		switch (read_addr2line_record(&io, NULL, NULL, NULL)) {
 		case -1:
 			if (!symbol_conf.disable_add2line_warn)
 				pr_warning("%s %s: could not read delimiter record\n",
@@ -632,7 +605,7 @@ static int addr2line(const char *dso_name, u64 addr,
 	}
 
 	/* We have to read the records even if we don't care about the inline info. */
-	while ((record_status = read_addr2line_record(a2l,
+	while ((record_status = read_addr2line_record(&io,
 						      &record_function,
 						      &record_filename,
 						      &record_line_nr)) == 1) {
@@ -656,7 +629,7 @@ static int addr2line(const char *dso_name, u64 addr,
 
 void dso__free_a2l(struct dso *dso)
 {
-	struct a2l_subprocess *a2l = dso->a2l;
+	struct child_process *a2l = dso->a2l;
 
 	if (!a2l)
 		return;
-- 
2.40.0.348.gf938b09366-goog

