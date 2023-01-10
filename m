Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1C7B422
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 22:21:13 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id x188-20020a2531c5000000b00716de19d76bso14199801ybx.19
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 14:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/FtIYr0/RheXwrssHV0cFATW8LMtUvVk/N1uI6ptIqc=;
        b=RNYP627ovo2gwEzsZZbFylrtQb+tRstmx8+kwVlpER/K5C5tNb2oBe50zVPZpE1xuZ
         NU9zXXblOxx6EAKLVYDrvaw3SP0ZyRrbegvCU8UFWhy7tdpYKJsjdqHS8Q8fCYTB2AA1
         XfxIcjNfCJVewHShT9ogfUdkxa5rGgTTPcO795wa5pyopE3PY7OwUHSfWNK2py18qEHb
         lU9rAZ5slO3ij3YjOrOQ5FnhJPYOoz0FdvRAzlSJcgOtT3Q85Tvra/8+nQofX8xCCpMS
         FEo/8EYdWVgxNvEjlwcyYar4md8dE1bKiVeg7zyJe6xTPO25BRQ85Hz4YMsQr4Ew/YJj
         ifFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FtIYr0/RheXwrssHV0cFATW8LMtUvVk/N1uI6ptIqc=;
        b=qtN3H0MyKKox8HdFldG4BVSdiJrtjV+YJIXKYn5cszxfR3LFIHTVgKKyPPV00nOUQh
         +zr5RzS84HfEzw25viW0+6q+izlrd3RNRYZB/xKWzaZ7c5CwX6fa+AFuUkeXV54kjQDR
         Br1US1q1gZ3LuSE+NDQDTHVbpk/RfEtHZ82T/QMu/DJDrzWQ2pdHTMJC5a7yVMswkvXv
         BIrdHiA7YSwGSI4VaaL3i0oxXYLgkVfZWNZz6obKrG4fbxAPeT5pjnkOaqu/ri/32Prv
         98tgociFV1SgxuVAGuWZDgUU44xMP8/PYx9/x/mIZp8HfLCAwg+EoWor2lQfzzfzcZ3G
         051g==
X-Gm-Message-State: AFqh2krD42NPx9/lBHC8L+tvc/KJY8gJEBNQrCJs8ufLcIOt3er89DNa
	btfF6D8mqSIA6akX+sAEAvfLZOECo2Jv
X-Google-Smtp-Source: AMrXdXt8x+kd9UlLPbZYhu5Ooy9hNfxVHcOZmgh4OR3ywtB1lSBt3xtVEtTcEV9ZxG+DMlVpkAwMcWwdvcU8
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:cebf:c37e:8184:56])
 (user=irogers job=sendgmr) by 2002:a25:8110:0:b0:6f6:ec71:8ede with SMTP id
 o16-20020a258110000000b006f6ec718edemr5909003ybk.422.1673389272586; Tue, 10
 Jan 2023 14:21:12 -0800 (PST)
Date: Tue, 10 Jan 2023 14:20:02 -0800
In-Reply-To: <20230110222003.1591436-1-irogers@google.com>
Message-Id: <20230110222003.1591436-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230110222003.1591436-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH v1 6/7] perf help: Use run_command_strbuf
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Christy Lee <christylee@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Leo Yan <leo.yan@linaro.org>, 
	Yang Jihong <yangjihong1@huawei.com>, Qi Liu <liuqi115@huawei.com>, 
	James Clark <james.clark@arm.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Sean Christopherson <seanjc@google.com>, Zhengjun Xing <zhengjun.xing@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Xin Gao <gaoxin@cdjrlc.com>, 
	Zechuan Chen <chenzechuan1@huawei.com>, Jason Wang <wangborong@cdjrlc.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Stephane Eranian <eranian@google.com>, 
	German Gomez <german.gomez@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove boiler plate by using library routine.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-help.c | 47 ++++++++++++---------------------------
 1 file changed, 14 insertions(+), 33 deletions(-)

diff --git a/tools/perf/builtin-help.c b/tools/perf/builtin-help.c
index 8874e1e0335b..1cb87358cd20 100644
--- a/tools/perf/builtin-help.c
+++ b/tools/perf/builtin-help.c
@@ -70,46 +70,27 @@ static const char *get_man_viewer_info(const char *name)
 static int check_emacsclient_version(void)
 {
 	struct strbuf buffer = STRBUF_INIT;
-	struct child_process ec_process;
-	const char *argv_ec[] = { "emacsclient", "--version", NULL };
-	int version;
 	int ret = -1;
 
-	/* emacsclient prints its version number on stderr */
-	memset(&ec_process, 0, sizeof(ec_process));
-	ec_process.argv = argv_ec;
-	ec_process.err = -1;
-	ec_process.stdout_to_stderr = 1;
-	if (start_command(&ec_process)) {
-		fprintf(stderr, "Failed to start emacsclient.\n");
-		return -1;
-	}
-	if (strbuf_read(&buffer, ec_process.err, 20) < 0) {
-		fprintf(stderr, "Failed to read emacsclient version\n");
-		goto out;
-	}
-	close(ec_process.err);
-
 	/*
-	 * Don't bother checking return value, because "emacsclient --version"
-	 * seems to always exits with code 1.
+	 * emacsclient may print its version number on stderr. Don't bother
+	 * checking return value, because some "emacsclient --version" commands
+	 * seem to always exits with code 1.
 	 */
-	finish_command(&ec_process);
+	run_command_strbuf("emacsclient --version 2>&1", &buffer);
 
-	if (!strstarts(buffer.buf, "emacsclient")) {
+	if (!strstarts(buffer.buf, "emacsclient"))
 		fprintf(stderr, "Failed to parse emacsclient version.\n");
-		goto out;
-	}
-
-	version = atoi(buffer.buf + strlen("emacsclient"));
+	else {
+		int version = atoi(buffer.buf + strlen("emacsclient"));
 
-	if (version < 22) {
-		fprintf(stderr,
-			"emacsclient version '%d' too old (< 22).\n",
-			version);
-	} else
-		ret = 0;
-out:
+		if (version < 22) {
+			fprintf(stderr,
+				"emacsclient version '%d' too old (< 22).\n",
+				version);
+		} else
+			ret = 0;
+	}
 	strbuf_release(&buffer);
 	return ret;
 }
-- 
2.39.0.314.g84b9a713c41-goog

