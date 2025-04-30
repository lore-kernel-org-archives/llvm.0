Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B2274FF9
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035467; cv=none; b=Vepx4SLC5dKYRLoyHHRsKbCj656Z1I3zOq70AirS40gzAigfOjhBWposi0NVMpbzPeBgvUUj/pctz8TxBYRU8LPEQbjYilLLFYxeo9cQ/PDqd8kRo12PLQjQcLpB2ayHmEF859lD77jXFuvavi3rMMNjgEK2u0dPoYARM/0qek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035467; c=relaxed/simple;
	bh=wvPkR6JZ40YC3ZLi/ZNFhDlpszrlzYFVfEEp4+Utc68=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gU+KSgYpeWJ7pixIL5ZieeX/qohQi5U36V+2Hij/ceG+j+rrKneppZzDd0VMztyRtJ5LDGvITSQwfJfXp4hIeAr5Shi0GMpwLX1/KiGDqrUxikMoI5u9TpHfYZTz6NJ91c/q7IL/wES+p2zsae4cEXl4vzPxrg9I76viFklAOxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PM1aRrsu; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PM1aRrsu"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b00aa1f50d1so53668a12.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035464; x=1746640264; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=exCmcwFz1TnRVt9YW9mscke0lfHrA+2a3D89/Ss7eyo=;
        b=PM1aRrsu3+xlD/m/YNpOnebmisg+pxR1Kk1GK7ksTz5gfHqBO7FiWpbUZnC2kBZqY2
         crJhfQjOlqRvyS2DL1fS0ooYIJTr2WyuNFkiZ+yxwdG+8bvNxI4hZJnHB+yzxuXNsqeI
         62Lc3dbAGE5IQ7cdooi/7EvVMIDNidNUNr7j4Tq+SqsAGG/BHFlvAw8NI5XUMUg72eCn
         1yTRQhvPzNTySubyJ3eBjrCk4lmWIE4p7bQHbDyEnM6x0BX0lTmeN4+enx3Zu80q3XZE
         Tc/vvfYqBK6Wnvqd5AsWC05s2XLaQYL6x9wRUS60xeJ4gK/CcBUj3OHK8TpuUCYapkVV
         KSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035464; x=1746640264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exCmcwFz1TnRVt9YW9mscke0lfHrA+2a3D89/Ss7eyo=;
        b=WIRx46wxeqG1i2UTHCZ/7dN2gg1hLdlIrMg5g+w1iNX7Y8v7oJNWpEVQF1Q/lm55b4
         kqOHWVyRiStA9W30fjCpNj135NUXk8CoVq8V2lVPV+olCGSQX3KJCIP6fIWK/xYABovm
         8wWucfAGrEAoJsr/cY/KOagyFpvRCet0v9x4ACRKZba3o7xZq5SX2i9F4GlEQL5bkhHh
         Z4ytRpdsEl/FRIbMlgmtQcEvzwyzL/hCQ/b4/7Le7eL2P3f2+yP0kB8yi3v4XXMZyNo1
         ahnde+iH3xxH7f7u6I4AXiq8uELb8qZlTHQBUX/4MTrCxpSWUvAkiPp5uYEe4PHMOvnZ
         emCw==
X-Forwarded-Encrypted: i=1; AJvYcCUmakwqtUZ5t7gvuAvVpec1306I2V1lctFUDwhktUZZQfqGLbE5TdJ1L2NizTA4gNJEUmKK@lists.linux.dev
X-Gm-Message-State: AOJu0YyLlVfepA1MPSqDhzzoUzj5wVWZ2KuiIGW0uSR9mPQGS3sHdV3V
	LmvJiYlSJQ/XA+fiwkUauOjSacuZL6YGDZG+GYYq5FqHBKbWCgsNyHFGA81FIFvLhtvB/Bbztko
	PWBGjIg==
X-Google-Smtp-Source: AGHT+IHDYtyNnHjQBwlQxtxVb4VlmrdxYhNH/PCNA7NGRCgPdcAR8KCkhPOzPMdO4mNYyXsSz9a43q4TYyVy
X-Received: from pjbeu4.prod.google.com ([2002:a17:90a:f944:b0:301:1bf5:2f07])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d647:b0:2fe:955d:cdb1
 with SMTP id 98e67ed59e1d1-30a33356127mr4815552a91.23.1746035464136; Wed, 30
 Apr 2025 10:51:04 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:49:51 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-4-irogers@google.com>
Subject: [PATCH v2 03/47] perf ui: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/ui/hist.c       | 18 ++++++++----------
 tools/perf/ui/stdio/hist.c |  5 ++---
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/tools/perf/ui/hist.c b/tools/perf/ui/hist.c
index 3ffce69fc823..fcbfa6700464 100644
--- a/tools/perf/ui/hist.c
+++ b/tools/perf/ui/hist.c
@@ -233,7 +233,7 @@ static int __hpp__group_sort_idx(struct hist_entry *a, struct hist_entry *b,
 static int __hpp__sort(struct hist_entry *a, struct hist_entry *b,
 		       hpp_field_fn get_field)
 {
-	s64 ret;
+	int ret;
 	int i, nr_members;
 	struct evsel *evsel;
 	u64 *fields_a, *fields_b;
@@ -272,7 +272,7 @@ static int __hpp__sort(struct hist_entry *a, struct hist_entry *b,
 static int __hpp__sort_acc(struct hist_entry *a, struct hist_entry *b,
 			   hpp_field_fn get_field)
 {
-	s64 ret = 0;
+	int ret = 0;
 
 	if (symbol_conf.cumulate_callchain) {
 		/*
@@ -287,7 +287,7 @@ static int __hpp__sort_acc(struct hist_entry *a, struct hist_entry *b,
 		    !hist_entry__has_callchains(a) || !symbol_conf.use_callchain)
 			return 0;
 
-		ret = b->callchain->max_depth - a->callchain->max_depth;
+		ret = field_cmp(b->callchain->max_depth, a->callchain->max_depth);
 		if (callchain_param.order == ORDER_CALLER)
 			ret = -ret;
 	}
@@ -299,6 +299,7 @@ static int hpp__width_fn(struct perf_hpp_fmt *fmt,
 			 struct hists *hists)
 {
 	int len = fmt->user_len ?: fmt->len;
+	int fmt_len = (int)strlen(fmt->name);
 	struct evsel *evsel = hists_to_evsel(hists);
 
 	if (symbol_conf.event_group) {
@@ -314,10 +315,7 @@ static int hpp__width_fn(struct perf_hpp_fmt *fmt,
 		len = max(len, nr * fmt->len);
 	}
 
-	if (len < (int)strlen(fmt->name))
-		len = strlen(fmt->name);
-
-	return len;
+	return len < fmt_len ? fmt_len : len;
 }
 
 static int hpp__header_fn(struct perf_hpp_fmt *fmt, struct perf_hpp *hpp,
@@ -341,7 +339,7 @@ int hpp_color_scnprintf(struct perf_hpp *hpp, const char *fmt, ...)
 	ret = percent_color_len_snprintf(hpp->buf, hpp->size, fmt, len, percent);
 	va_end(args);
 
-	return (ret >= ssize) ? (ssize - 1) : ret;
+	return (ret >= ssize) ? (int)(ssize - 1) : ret;
 }
 
 static int hpp_entry_scnprintf(struct perf_hpp *hpp, const char *fmt, ...)
@@ -354,7 +352,7 @@ static int hpp_entry_scnprintf(struct perf_hpp *hpp, const char *fmt, ...)
 	ret = vsnprintf(hpp->buf, hpp->size, fmt, args);
 	va_end(args);
 
-	return (ret >= ssize) ? (ssize - 1) : ret;
+	return (ret >= ssize) ? (int)(ssize - 1) : ret;
 }
 
 #define __HPP_COLOR_PERCENT_FN(_type, _field, _fmttype)				\
@@ -945,7 +943,7 @@ void perf_hpp__set_user_width(const char *width_list_str)
 	perf_hpp_list__for_each_format(&perf_hpp_list, fmt) {
 		char *p;
 
-		int len = strtol(ptr, &p, 10);
+		int len = (int)strtol(ptr, &p, 10);
 		fmt->user_len = len;
 
 		if (*p == ',')
diff --git a/tools/perf/ui/stdio/hist.c b/tools/perf/ui/stdio/hist.c
index 7ac4b98e28bc..6a981f95b4ec 100644
--- a/tools/perf/ui/stdio/hist.c
+++ b/tools/perf/ui/stdio/hist.c
@@ -450,7 +450,7 @@ int __hist_entry__snprintf(struct hist_entry *he, struct perf_hpp *hpp,
 		advance_hpp(hpp, ret);
 	}
 
-	return hpp->buf - start;
+	return (int)(hpp->buf - start);
 }
 
 static int hist_entry__snprintf(struct hist_entry *he, struct perf_hpp *hpp)
@@ -612,8 +612,7 @@ static int hist_entry__fprintf(struct hist_entry *he, size_t size,
 	ret = fprintf(fp, "%s\n", bf);
 
 	if (hist_entry__has_callchains(he) && !ignore_callchains)
-		callchain_ret = hist_entry_callchain__fprintf(he, total_period,
-							      0, fp);
+		callchain_ret = (int)hist_entry_callchain__fprintf(he, total_period, 0, fp);
 
 	ret += callchain_ret;
 
-- 
2.49.0.906.g1f30a19c02-goog

