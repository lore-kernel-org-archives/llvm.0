Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE67A943
	for <llvm@lists.linux.dev>; Fri,  9 Jun 2023 23:54:28 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-bb2fae9b286so2782949276.3
        for <llvm@lists.linux.dev>; Fri, 09 Jun 2023 16:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686354868; x=1688946868;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cZRa8J45tSEoIBwwMfP3oeiIjnBxryB3tiHQ4mYVspA=;
        b=A0YP3D1MDS6ipDOhIWcopNNcD1QYcBlz/2xVJXWlJnEcbGaUxeiAs8tAUYkIngCOa8
         MQo2PIbwQsXAFY1yuFQGkjf3bvgbdqa3mrQBK2i0yIO5RLeYwe/tpXG6AkOgOrci1IM6
         ee3XPIDjmnxTfAdqa01/cUYTAwXqQaBt3LihZqFiSQfj+Jb56vCWeBQ0D7e3X0KHZvuN
         yynmKcETGjwSFfENJ2wUnkXz3Ho9B6qnkXADkQCciNzXPJ2rCD22RrDxLcS5y4lyZldw
         C5JPSBAZ0ooPspDHdyJ11GeQVbOA4ixy1f+h1W52hL6Td8d6Y+NofNCoJTEmAYSVrDGh
         4PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686354868; x=1688946868;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZRa8J45tSEoIBwwMfP3oeiIjnBxryB3tiHQ4mYVspA=;
        b=Omuum3mbkTHoFE3tgLBJZocDHTZcdb8tiatw6d3/bgA+7FeAvSQ25xYJUCrznnKlHO
         iGH46GiT7XruP30FUrgh5NhimKEHQ8toqW0N/g5WKkuPoVW8W0fZZ1hV6ZR1lzhIdEkA
         pIpgUEoyWmS7DaRo2N/U9Xlx4qzY/8AD7H19491dbLpV4t/K/EX9dtZF1quKG12Zr/gj
         hicuX5GSFaVUYNrB0J/B+U2HocyyUEy06v128CVFGtfHbzSgYbJeWJpsBxMQGOQ59qUr
         C/dIDMqeVY0+umk5gg6HK/zztvF4n05rliePvmcOAA3duGIg0EMNSi6JrbainLQoh30l
         tE5g==
X-Gm-Message-State: AC+VfDyiWPqeWF82W6AeoRkixgxGXD32R4KmPu3SJqj5Jn30A9GlxySJ
	K8zb4ATRi6M4E03yNnkI+ItDz0RjZ7Jf
X-Google-Smtp-Source: ACHHUZ5r3Yz2yKKHzyS3K5w8FkkkyUAesFC0U/xNjOAbG5oeaKw2Nxnz2IOd1Bgz+HxxkgCovA9JoZEHUQJh
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:55f2:1922:c44b:472d])
 (user=irogers job=sendgmr) by 2002:a05:6902:1085:b0:ba8:cbd2:61b3 with SMTP
 id v5-20020a056902108500b00ba8cbd261b3mr731327ybu.5.1686354868009; Fri, 09
 Jun 2023 16:54:28 -0700 (PDT)
Date: Fri,  9 Jun 2023 16:54:18 -0700
Message-Id: <20230609235419.204624-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Subject: [PATCH v1 1/2] perf srcline: Make addr2line configuration failure
 more verbose
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

To aid debugging why it fails. Also, combine the loops for reading a
line for the llvm/binutils cases.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/srcline.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
index b8e596528d7e..fc85cdd6c8f9 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -441,7 +441,7 @@ enum a2l_style {
 	LLVM,
 };
 
-static enum a2l_style addr2line_configure(struct child_process *a2l)
+static enum a2l_style addr2line_configure(struct child_process *a2l, const char *dso_name)
 {
 	static bool cached;
 	static enum a2l_style style;
@@ -450,6 +450,7 @@ static enum a2l_style addr2line_configure(struct child_process *a2l)
 		char buf[128];
 		struct io io;
 		int ch;
+		int lines;
 
 		if (write(a2l->in, ",\n", 2) != 2)
 			return BROKEN;
@@ -459,19 +460,29 @@ static enum a2l_style addr2line_configure(struct child_process *a2l)
 		if (ch == ',') {
 			style = LLVM;
 			cached = true;
+			lines = 1;
 		} else if (ch == '?') {
 			style = GNU_BINUTILS;
 			cached = true;
+			lines = 2;
 		} else {
-			style = BROKEN;
+			if (!symbol_conf.disable_add2line_warn) {
+				char *output;
+				size_t output_len;
+
+				io__getline(&io, &output, &output_len);
+				pr_warning("%s %s: addr2line configuration failed\n",
+					   __func__, dso_name);
+				pr_warning("\t%c%s\n", ch, output);
+			}
+			return BROKEN;
 		}
-		do {
+		while (lines) {
 			ch = io__get_char(&io);
-		} while (ch > 0 && ch != '\n');
-		if (style == GNU_BINUTILS) {
-			do {
-				ch = io__get_char(&io);
-			} while (ch > 0 && ch != '\n');
+			if (ch <= 0)
+				break;
+			if (ch == '\n')
+				lines--;
 		}
 		/* Ignore SIGPIPE in the event addr2line exits. */
 		signal(SIGPIPE, SIG_IGN);
@@ -591,12 +602,9 @@ static int addr2line(const char *dso_name, u64 addr,
 			pr_warning("%s %s: addr2line_subprocess_init failed\n", __func__, dso_name);
 		goto out;
 	}
-	a2l_style = addr2line_configure(a2l);
-	if (a2l_style == BROKEN) {
-		if (!symbol_conf.disable_add2line_warn)
-			pr_warning("%s: addr2line configuration failed\n", __func__);
+	a2l_style = addr2line_configure(a2l, dso_name);
+	if (a2l_style == BROKEN)
 		goto out;
-	}
 
 	/*
 	 * Send our request and then *deliberately* send something that can't be interpreted as
-- 
2.41.0.162.gfafddb0af9-goog

