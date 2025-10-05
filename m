Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277402C15A5
	for <llvm@lists.linux.dev>; Sun,  5 Oct 2025 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759699359; cv=none; b=pLP7WXEyyNxICSaDk6iMISYSGu4u4NkN2SysSBLEvkhRpV5Bm8FKVqtbXvQxyGSS+L3QnEV84JL+rOQiTD56+Zw3zoDv/zVyKum36xcSsVQU6LlO8F4+7Ls3pjTEcneXEZ4eqjyamHWmK3UThrxkZ9FwtLhO8s14bRI9ZtImBkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759699359; c=relaxed/simple;
	bh=d45wEUY1c4jrn84/iwX20DQE8nKTJ3WT+ZgvlVq/fR8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=EkxApCci6uxguRluE8LYWLgusq9WKK1PrOn4ie5TO0plQCxmgERf4+B7Q44MqLxJxB2IGwRRVY+ckioCfem1wpeKWT/T/XN+ZYvYMQoeeRaO4QvgcOtBzfeJIWaVIZOtCwIVA8ADvnYvF5SAf9TdC6ID3ZBE58PdTwbcYzwXye0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gKoV1Sqh; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gKoV1Sqh"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-780fb254938so3264137b3a.0
        for <llvm@lists.linux.dev>; Sun, 05 Oct 2025 14:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759699358; x=1760304158; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UwuX+qcsVkIci0z0OtUlxAA0Fd588bD/7/Leb924no=;
        b=gKoV1SqhzDyC8dCKY6P3eV6g6Mp3/2JRqRyASNCPHtBBfEBwPjSv2/polXWFGQUkdd
         vz4wzICqgql7d7vE7WtFkmhjHstOLEMgqZ2Cj7qA9CIhhZ2djnIZX2UcYJjF+sMVD0kd
         HLaOkrC3/9eaaJqODDUVYv9QplLO4CYwLe3m3SpIk62SaeT5GkpI2DUsmMizxIumxPiG
         ow7n1htsyRJq94mHSzpnDiCAPbLiiIeifjqlLt1UthR8Ykat179CtstJ2Ls96URYnvGl
         8n1EUWpt3zXPviAPnHI2RQjnAr2jcG/fQ6Do4p5UnkA1NyCPtdaUzYC2OfXiGxm61gcr
         emEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759699358; x=1760304158;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UwuX+qcsVkIci0z0OtUlxAA0Fd588bD/7/Leb924no=;
        b=LLXhm3FTc384upYpaJaxMLyJrp3AobV8l7SbhWidxjNJxCQdVhxB4CJYROCJtit4rP
         X/xHNrRNlg+5WHzErLV0JhvGXnczV0VTi6SaDaYPRaVbSQBjO/DiXEED96395Sdnv8FP
         XjM0w/dGqalHxVtFQFAH1meZuabngJpgU6bsNnPmikYA7HfNrB9kUeA86dMRPYGbP+lZ
         OEIOCdhB5L6TP+n8fuvkVsWxUHEE74t9JQlRqOTHKYUDjkXtnQ91gnabSEOGMnLGqnSp
         YgkWpvDJzDL+9MSfsTBvPzIleOEkWbvI47yzTQ6U9CkT9ZZz1qk0+CNpCmGV1T3ApHgX
         XwBw==
X-Forwarded-Encrypted: i=1; AJvYcCUFPgJPd2NFN2+9dowCKNuFV33N0M9bcWsw8lSMHEAEku1YI+kcCGckDR0B4TgQlkzjmfcf@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrrl2GFdUFp4GRmJdOgB1i3RRzRLy2GJp8Wwfp2XeT5JRvM/iF
	gelAheIBkm7JhIWosFj1rLLIkdvLvbXKbkDsyknj42/6sSIZ65WBMj3l5vlYHRIwW3qi+HQHRcc
	wFZyd3E1hLw==
X-Google-Smtp-Source: AGHT+IGvT5pslbMCXLmkI8dz33jGeGYCBPk++vUXwX3QDvVBJVh6+9SImEKQrDsiOMs+ve1hP/rqlLC1JAam
X-Received: from pgac17.prod.google.com ([2002:a05:6a02:2951:b0:b58:7d6e:e9c3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d527:b0:32b:70a1:7c84
 with SMTP id adf61e73a8af0-32b70a17d56mr10844469637.28.1759699357519; Sun, 05
 Oct 2025 14:22:37 -0700 (PDT)
Date: Sun,  5 Oct 2025 14:22:09 -0700
In-Reply-To: <20251005212212.2892175-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251005212212.2892175-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251005212212.2892175-9-irogers@google.com>
Subject: [PATCH v7 08/11] perf disasm: Remove unused evsel from annotate_args
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Collin Funk <collin.funk1@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Set in symbol__annotate but never used.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate.c | 1 -
 tools/perf/util/disasm.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index c9b220d9f924..a2e34f149a07 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -1015,7 +1015,6 @@ int symbol__annotate(struct map_symbol *ms, struct evsel *evsel,
 	struct symbol *sym = ms->sym;
 	struct annotation *notes = symbol__annotation(sym);
 	struct annotate_args args = {
-		.evsel		= evsel,
 		.options	= &annotate_opts,
 	};
 	struct arch *arch = NULL;
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 09c86f540f7f..d2cb555e4a3b 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -98,7 +98,6 @@ struct ins_ops {
 struct annotate_args {
 	struct arch		  *arch;
 	struct map_symbol	  ms;
-	struct evsel		  *evsel;
 	struct annotation_options *options;
 	s64			  offset;
 	char			  *line;
-- 
2.51.0.618.g983fd99d29-goog

