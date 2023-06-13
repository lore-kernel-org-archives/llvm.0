Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB3A7F
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 03:48:23 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-bc6a920e69aso3872634276.0
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 20:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686628103; x=1689220103;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFZEItTTBrSMUTBa58hKToUNkL4hMjjE5NbhujtdO6I=;
        b=sugIE8oskjJ0EeMybjZLw2QY8Hop8AEO4OtW23PCZWE3F2bKKMHhNiXsuJibFMMwGY
         o9JgVx3RwVyXpJif3Mj0k++i5lcshtCZnCpjD/0lbvoSGBi706rw/3HTUpwfpFDvvt6l
         R6JaGfUsg2ChbI9Lc4oNoQv9vp5k7VhrG92rk80H8sY6fT26z8Ca/LkSYbkAvWc+QHUc
         BND3MS/YPcPWMpbzXKIwqGGX3fonvC56Y6UQmkLh82amrlb3pdC3yS4MZuJZs68mxOWk
         Cv0L66ytK2vloI75LBX8XZkCUE0i8sfwHJkGWso6uGWxJuyaKFCWKdf09TQYNwDpwhPA
         Cn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686628103; x=1689220103;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TFZEItTTBrSMUTBa58hKToUNkL4hMjjE5NbhujtdO6I=;
        b=QOm0W6jTNSvrP2swAf+3vwAz2bDot6Drne2/LZZpP2IpPRCVP92NTvpwLma5R3yPKP
         lCqKvKpGFczy2u1LxqD9j1ysF2U3RL3jK5pKKNhL3NpW9oXz91UwgYS9dPws0TuKEFUD
         2vFOuU3QNx+GWDYreB3dqKZj8ljx1HHaccelyYbXwW2UX3r+2i9mehaj0WxybhK866M3
         99yviQamSZHsv4q6qocjziWR3QFXMnXqEEGuWzN77xW7oZ0h2AU41IRrWSfHVcP6bUN+
         ZlbXSXLtEqEkdHLxRNe+nCKugiQdiuf9QOIL3s0CrZEl+D0yV0G+QxaK6+mK51PEcRrp
         1G8g==
X-Gm-Message-State: AC+VfDziGz5tVAmmXI1a/ZReFnkCwMeeu4hdWYY6mNcbIlXCtIo2shst
	kda4MqGHcdrbgK9Eau8fXpCz+qitDz6z
X-Google-Smtp-Source: ACHHUZ79nD4tHJp4BftcjKhgpKXuJELFAbzCZiWZNM9q+2bGeEAnsJjQvM5m0L1KgjOvrfxsRqfOhuz5toHp
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a704:56d6:f79d:33e7])
 (user=irogers job=sendgmr) by 2002:a25:361f:0:b0:bc8:c749:eede with SMTP id
 d31-20020a25361f000000b00bc8c749eedemr299027yba.7.1686628102944; Mon, 12 Jun
 2023 20:48:22 -0700 (PDT)
Date: Mon, 12 Jun 2023 20:48:16 -0700
In-Reply-To: <20230613034817.1356114-1-irogers@google.com>
Message-Id: <20230613034817.1356114-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230613034817.1356114-1-irogers@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Subject: [PATCH v2 1/2] perf srcline: Make addr2line configuration failure
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
index aec596a0b0bb..d477332586b2 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -443,7 +443,7 @@ enum a2l_style {
 	LLVM,
 };
 
-static enum a2l_style addr2line_configure(struct child_process *a2l)
+static enum a2l_style addr2line_configure(struct child_process *a2l, const char *dso_name)
 {
 	static bool cached;
 	static enum a2l_style style;
@@ -452,6 +452,7 @@ static enum a2l_style addr2line_configure(struct child_process *a2l)
 		char buf[128];
 		struct io io;
 		int ch;
+		int lines;
 
 		if (write(a2l->in, ",\n", 2) != 2)
 			return BROKEN;
@@ -461,19 +462,29 @@ static enum a2l_style addr2line_configure(struct child_process *a2l)
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
+				char *output = NULL;
+				size_t output_len;
+
+				io__getline(&io, &output, &output_len);
+				pr_warning("%s %s: addr2line configuration failed\n",
+					   __func__, dso_name);
+				pr_warning("\t%c%s", ch, output);
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
@@ -593,12 +604,9 @@ static int addr2line(const char *dso_name, u64 addr,
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

