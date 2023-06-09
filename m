Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BBDA943
	for <llvm@lists.linux.dev>; Fri,  9 Jun 2023 23:54:31 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-bb3cb542875so3244992276.1
        for <llvm@lists.linux.dev>; Fri, 09 Jun 2023 16:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686354870; x=1688946870;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNyUS02eW/yXFIAlgFDfwEmFoe9Pd7uSEDgKLORvHjM=;
        b=V11apG9LHOwhutH46QHmQ0gFKrfNaC6p1CizyVW65E2n8EhG+rIvmW285qgxYWdy68
         Am892SzAOwS/ktZ92R2Inm+9rHnmpjZH5EtYHOE9rLiXEl33z6EZLwsx3lkKfCfkYfNa
         dnpiTxRdkt2Aha2k3I1IdY+WUUBb6EnCjBrF+YbO1s2z1W1d4daY7/xMLd+PqX6c2ZN7
         1l4pasEPgSopAcpHBehgcFW+gl/CqZK9N+iAoO9Xm2e0ZieeV+dpSeNsvOeXcKMNRuf4
         /fEJf+7N7JW8da5CtMIl/WIre12zkDa/wtXnudrUI7oozutQxWyOqfMhHfJ4n0RSogMw
         bEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686354870; x=1688946870;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNyUS02eW/yXFIAlgFDfwEmFoe9Pd7uSEDgKLORvHjM=;
        b=cJk9RAExec69iC/VtVsvkV6qi0PKsC0MitC+94ELQGCHHh8TzUVxDpaeqnK3rmrLVx
         5nMjXG/BoWoqr6Di18agvx5Ywq59Nd0NyZRQktzJsYainXhab6W5WQ/ElPc2Vt6CEyTF
         CQx/tA7+5EIIdIcJLAVP3nXn2kodjNhp3XevEzFvtYokizGNJKD0e6SWUSxe99M8RHsV
         hdOVvE8q/c5RwW3K+Xim+HxMMqJFTwaiUSce+fb7D+lvYeyLGnOxh1p+P73KqVSMi0zh
         Vo265torEzULj7QdKmVV3mDUxG24+C2Psy+wXJU0rce69F/X4UZh4ak1GtmIW4cXDpif
         1GqA==
X-Gm-Message-State: AC+VfDxHPVIf4bppXIj09uMXKzcmA6Vh1A1DYI3MFqHadnMCEIy9gmEB
	nc9UymsMlbiEp6e9+cHn3fEMSNsx35tA
X-Google-Smtp-Source: ACHHUZ4PMyCkdCSyENQFYB0qETjtjOg/fcbawc434c4hu5aAPdXX7kCJC4yurstliqdU7VqpZ+H7i4hZQlWz
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:55f2:1922:c44b:472d])
 (user=irogers job=sendgmr) by 2002:a25:da09:0:b0:bbe:8486:5895 with SMTP id
 n9-20020a25da09000000b00bbe84865895mr1408283ybf.1.1686354870144; Fri, 09 Jun
 2023 16:54:30 -0700 (PDT)
Date: Fri,  9 Jun 2023 16:54:19 -0700
In-Reply-To: <20230609235419.204624-1-irogers@google.com>
Message-Id: <20230609235419.204624-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230609235419.204624-1-irogers@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Subject: [PATCH v1 2/2] perf srcline: Make sentinel reading for binutils
 addr2line more robust
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Changbin Du <changbin.du@huawei.com>
Content-Type: text/plain; charset="UTF-8"

The addr2line process is sent an address then multiple function,
filename:line "records" are read. To detect the end of output a ',' is
sent and for llvm-addr2line a ',' is then read back showing the end of
addrline's output. For binutils addr2line the ',' translates to
address 0 and we expect the bogus filename marker "??:0" (see
filename_split) to be sent from addr2line. For some kernels address 0
may have a mapping and so a seemingly valid inline output is given and
breaking the sentinel discovery:

```
$ addr2line -e vmlinux -f -i
,
__per_cpu_start
./arch/x86/kernel/cpu/common.c:1850
```

To avoid this problem enable the address dumping for addr2line (the -a
option). If an address of 0x0000000000000000 is read then this is the
sentinel value working around the problem above. The filename_split
still needs to check for "??:0" as bogus non-zero addresses also need
handling.

Reported-by: Changbin Du <changbin.du@huawei.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/srcline.c | 61 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
index fc85cdd6c8f9..c99a001453b4 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -406,7 +406,7 @@ static struct child_process *addr2line_subprocess_init(const char *addr2line_pat
 	const char *argv[] = {
 		addr2line_path ?: "addr2line",
 		"-e", binary_path,
-		"-i", "-f", NULL
+		"-a", "-i", "-f", NULL
 	};
 	struct child_process *a2l = zalloc(sizeof(*a2l));
 	int start_command_status = 0;
@@ -461,10 +461,10 @@ static enum a2l_style addr2line_configure(struct child_process *a2l, const char
 			style = LLVM;
 			cached = true;
 			lines = 1;
-		} else if (ch == '?') {
+		} else if (ch == '0') {
 			style = GNU_BINUTILS;
 			cached = true;
-			lines = 2;
+			lines = 3;
 		} else {
 			if (!symbol_conf.disable_add2line_warn) {
 				char *output;
@@ -516,20 +516,64 @@ static int read_addr2line_record(struct io *io,
 	if (line_nr != NULL)
 		*line_nr = 0;
 
+	/*
+	 * Read the first line. Without an error this will be either an address
+	 * like 0x1234 or for llvm-addr2line the sentinal ',' character.
+	 */
 	if (io__getline(io, &line, &line_len) < 0 || !line_len)
 		goto error;
 
-	if (style == LLVM && line_len == 2 && line[0] == ',') {
-		zfree(&line);
-		return 0;
+	if (style == LLVM) {
+		if (line_len == 2 && line[0] == ',') {
+			zfree(&line);
+			return 0;
+		}
+	} else {
+		int zero_count = 0, non_zero_count = 0;
+
+		/* The address should always start 0x. */
+		if (line_len < 2 || line[0] != '0' || line[1] != 'x')
+			goto error;
+
+		for (size_t i = 2; i < line_len; i++) {
+			if (line[i] == '0')
+				zero_count++;
+			else
+				non_zero_count++;
+		}
+		if (!non_zero_count) {
+			int ch;
+
+			if (!zero_count) {
+				/* Line was erroneous just '0x'. */
+				goto error;
+			}
+			/*
+			 * Line was 0x0..0, the sentinel for binutils. Remove
+			 * the function and filename lines.
+			 */
+			zfree(&line);
+			do {
+				ch = io__get_char(io);
+			} while (ch > 0 && ch != '\n');
+			do {
+				ch = io__get_char(io);
+			} while (ch > 0 && ch != '\n');
+			return 0;
+		}
 	}
 
+	/* Read the second function name line. */
+	if (io__getline(io, &line, &line_len) < 0 || !line_len)
+		goto error;
+
 	if (function != NULL)
 		*function = strdup(strim(line));
 
 	zfree(&line);
 	line_len = 0;
 
+	/* Read the third filename and line number line. */
 	if (io__getline(io, &line, &line_len) < 0 || !line_len)
 		goto error;
 
@@ -633,8 +677,9 @@ static int addr2line(const char *dso_name, u64 addr,
 		goto out;
 	case 0:
 		/*
-		 * The first record was invalid, so return failure, but first read another
-		 * record, since we asked a junk question and have to clear the answer out.
+		 * The first record was invalid, so return failure, but first
+		 * read another record, since we sent a sentinel ',' for the
+		 * sake of detected the last inlined function.
 		 */
 		switch (read_addr2line_record(&io, a2l_style, NULL, NULL, NULL)) {
 		case -1:
-- 
2.41.0.162.gfafddb0af9-goog

