Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1910E7
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 00:49:15 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id w5-20020a253005000000b00aedd4305ff2so20601492ybw.13
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 17:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680223754;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spG6zzO9g3fs5SXpot8q/2pK6ppWq86BL6g1AzlYlI8=;
        b=YDgFT/UrDT40A0mDZesfEQ/18wK9sghzlxZyTzqDXJtagBsUXXW7uOHai3aXA+7z9S
         Z51z50bOdAOZ8tOfzQqho705eBRCnPx6P8AoG25bnWd8lKORMgJcfkAhQ5rC6ZVxxvsT
         LbscONL7fa3MASMs8uquM61pwvdWV8mRwQ404jRkWqzN6cgMSTcRdcPqhjv7pIbJLjTV
         lfX9lYOJDAiLblUzxkG/f/C6Ww4RXfPbn82NAtJRwgA0b+YMxUU5kVcf4DGkr60g6pCj
         W4niAtw6HwFKiSoooyZxDrmF/sXF9KPl8atICH9rwNHalrpjJlLnOk5UOpirjegwXpOu
         ukVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680223754;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spG6zzO9g3fs5SXpot8q/2pK6ppWq86BL6g1AzlYlI8=;
        b=pgAjMGyg6HnXtQw/s7Ixwc544DuC7mSx++AFFXREpWfzfoKHqaDrjB3UDZv3Fxra4Q
         1a5uSml/H+HElqsYN71aWRMQc5HwQkFcJKnbuS4Sm+KSn9sVVLOxw9mpA+vR+ZNmcNUk
         EZ8tdtO35Cl3E6j9xa/FtmLs30iwO/+hCYH9nrreqYzL6qCkU3gY4w+0pFj+6J1j7cYS
         QgLFUznrDAa5CyygrT5P9pJ4QhXsu/bxdKdTjQQw8LcCxD/dJKpjriy8TY+BQx05+tB3
         c0Y8Kr5HsywFhx4YvbrUeuFkV32bE8BF4ZuMw/P1B4f8GCwY8BYKH/uPEDv60zj2cALr
         TCtw==
X-Gm-Message-State: AAQBX9eMw2pByAfBV7T7DQ7SQljwQAUcyZ/ssZj4oKFma2kGBXZo5XZC
	G6L1mQ75pHHu+QhP+glseN2a844Kvt3K
X-Google-Smtp-Source: AKy350YKhXH+IKNk7Jv7yNdb04XZfK5AsWImdFuWAxZk8IvkJBcCpajhlUVxiR93uF/jRtxrE+YNpTLeEw4E
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:11ea:eb75:e48c:2c04])
 (user=irogers job=sendgmr) by 2002:a05:6902:1501:b0:b6d:80ab:8bb6 with SMTP
 id q1-20020a056902150100b00b6d80ab8bb6mr16975618ybu.1.1680223754659; Thu, 30
 Mar 2023 17:49:14 -0700 (PDT)
Date: Thu, 30 Mar 2023 17:48:41 -0700
In-Reply-To: <20230331004844.1592789-1-irogers@google.com>
Message-Id: <20230331004844.1592789-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230331004844.1592789-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v1 1/4] tools api: Add io__getline
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Reads a line to allocated memory up to a newline following the getline
API.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/api/io.h        | 40 +++++++++++++++++++++++++++++++++++++++
 tools/perf/tests/api-io.c | 36 +++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/tools/lib/api/io.h b/tools/lib/api/io.h
index 777c20f6b604..d874e8fa8b07 100644
--- a/tools/lib/api/io.h
+++ b/tools/lib/api/io.h
@@ -7,7 +7,9 @@
 #ifndef __API_IO__
 #define __API_IO__
 
+#include <errno.h>
 #include <stdlib.h>
+#include <string.h>
 #include <unistd.h>
 
 struct io {
@@ -112,4 +114,42 @@ static inline int io__get_dec(struct io *io, __u64 *dec)
 	}
 }
 
+/* Read up to and including the first newline following the pattern of getline. */
+static inline ssize_t io__getline(char **line_out, size_t *line_len_out, struct io *io)
+{
+	char buf[128];
+	int buf_pos = 0;
+	char *line = NULL;
+	size_t line_len = 0;
+	int ch = 0;
+
+	/* TODO: reuse previously allocated memory. */
+	free(*line_out);
+	while (ch != '\n') {
+		ch = io__get_char(io);
+
+		if (ch < 0)
+			break;
+
+		if (buf_pos == sizeof(buf)) {
+			line = realloc(line, line_len + sizeof(buf));
+			if (!line)
+				return -ENOMEM;
+			memcpy(&line[line_len], buf, sizeof(buf));
+			line_len += sizeof(buf);
+			buf_pos = 0;
+		}
+		buf[buf_pos++] = (char)ch;
+	}
+	line = realloc(line, line_len + buf_pos + 1);
+	if (!line)
+		return -ENOMEM;
+	memcpy(&line[line_len], buf, buf_pos);
+	line[line_len + buf_pos] = '\0';
+	line_len += buf_pos;
+	*line_out = line;
+	*line_len_out = line_len;
+	return line_len;
+}
+
 #endif /* __API_IO__ */
diff --git a/tools/perf/tests/api-io.c b/tools/perf/tests/api-io.c
index e91cf2c127f1..0ff39cdfcb01 100644
--- a/tools/perf/tests/api-io.c
+++ b/tools/perf/tests/api-io.c
@@ -289,6 +289,40 @@ static int test_get_dec(void)
 	return ret;
 }
 
+static int test_get_line(void)
+{
+	char path[PATH_MAX];
+	struct io io;
+	char test_string[1024];
+	char *line = NULL;
+	size_t i, line_len = 0;
+	size_t buf_size = 128;
+	int ret = 0;
+
+	for (i = 0; i < 512; i++)
+		test_string[i] = 'a';
+	test_string[512] = '\n';
+	for (i = 513; i < 1023; i++)
+		test_string[i] = 'b';
+	test_string[1023] = '\0';
+
+	if (setup_test(path, test_string, buf_size, &io))
+		return -1;
+
+	EXPECT_EQUAL((int)io__getline(&line, &line_len, &io), 513);
+	EXPECT_EQUAL((int)strlen(line), 513);
+	for (i = 0; i < 512; i++)
+		EXPECT_EQUAL(line[i], 'a');
+	EXPECT_EQUAL(line[512], '\n');
+	EXPECT_EQUAL((int)io__getline(&line, &line_len, &io), 510);
+	for (i = 0; i < 510; i++)
+		EXPECT_EQUAL(line[i], 'b');
+
+	free(line);
+	cleanup_test(path, &io);
+	return ret;
+}
+
 static int test__api_io(struct test_suite *test __maybe_unused,
 			int subtest __maybe_unused)
 {
@@ -300,6 +334,8 @@ static int test__api_io(struct test_suite *test __maybe_unused,
 		ret = TEST_FAIL;
 	if (test_get_dec())
 		ret = TEST_FAIL;
+	if (test_get_line())
+		ret = TEST_FAIL;
 	return ret;
 }
 
-- 
2.40.0.348.gf938b09366-goog

