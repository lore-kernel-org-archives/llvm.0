Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E707226CF6
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909192; cv=none; b=N73jv+o9dzizA9X2aw8w5Uo1P+n6/fb4tyNf3ay80DgeFclZnZA6qOjV1NOB3fSAcImXpmd8RUeKwqSctEsyhkclwDNrtb3UZufrLiGM2eedPWV6OvnboVQWKxbt1/6024WjdrXPedLB07WEZ3bYsDrIRswYcL+w15y0LOnpcWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909192; c=relaxed/simple;
	bh=reMtgj7bhiRhPENa3OkjdqODITaMaOHCqMyeNuoIDv4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=bu0Ei6hZEfstUhAp1pTdWXKk1XpxdbljN6LxrFupEQsfHb4S0qyaUl4Uk+SZuHtIxCKeyfiTmuY3SuFyh6Y/Krpn//a384w1QMCcyaFGHuO0b7DGCx6H0KheBc7EyUh9bZhRoO34NfnuthULAenvD651XF2ygrKYKuLT6gRlhrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LuD7U5X4; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LuD7U5X4"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b47173ae6easo3852327a12.1
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909190; x=1756513990; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=doZ9j7K6Q/ofgZz5QhoA4/GKu8/BR4eF9OnVOTmqiJI=;
        b=LuD7U5X4YWsegO7GQ5+AW5yaMnwIpoKDaEl3HGGEZae7Abpvzecvfm/CAhIaSZZWfv
         A18k/AA6pyAbm9k5SB/0q2Hl8ean/OBHyMYQhIfaMZZULc6U88zK6FwD+gk0Ht7Ngu45
         1SoIv4ZoTAngM/0ws1asV+vUtEKc3TkesHemp/fVNj/iDcW53R86axr24Mz7WKBZo/aQ
         VmNx5Ckje+IIwR9pAjw0crPdlzZszSXGtnCfskwg830RKSHITkvxpuwRs0tI9/KvDnYD
         QqViYBy1GlNOo14TP4UKHK8AJqPbX6PKyoZPglLnvRhSog/OQIv1uBkI8oRKKJpuakP8
         5RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909190; x=1756513990;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=doZ9j7K6Q/ofgZz5QhoA4/GKu8/BR4eF9OnVOTmqiJI=;
        b=o9i4A5zNYAOOwi4VPgkWmMHL7/wa1Ub0Ha1mcSC1dAkTz7i7dDYMdYbxgoj5AFJzKa
         GTiXnzVZ+xmvDHN0BOADjP13U41qvwZUrTsozckRC1fh0MsH+fRGsyw3npPv7dhEvzg/
         B+pNOOK3Qvs+FUZ7qW1bqproidQhNmigeOuMhO0wmN/I/W1VlBuj+geA/uopSzfjP6pF
         SwwtqKXSW1JOChT5MCox3s23xyo7nziwKxRbDv6HqB6lCBdX5NBezZ7SxfSrLb55e6U4
         OIR+XGEHP65rIm6oAIqnmIYVNNAys2TBnrqNRqq9bVtK214AMRO6kvekq4fEKbmIPlHH
         Ij7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjlCMNKMqzYK38QogI0364jBiI3l4I5atvszbiHzDFPD+ZFCTY3W/9qCKO/hgfIMl1pwmV@lists.linux.dev
X-Gm-Message-State: AOJu0YwwU6wI+imnZGVcd7FEey+eWXd/pdY9o3m0dQQ6KjIPYzvlE9rY
	3IZg7Jdlx2VFTiQiVESlN9Z7/FgDGQthETWD76PMKcJcylX4g/VjDg9hU240PLvQHtc4UZ5V167
	gs+oy61PsYw==
X-Google-Smtp-Source: AGHT+IGBzXcz7uUMdP+OXRWsOAJbtWHQsETrwAIkMwAxbb0yxrGNNH1fXbELcmiKGSKA7OceGBgYbjqXkS1w
X-Received: from pjbtd5.prod.google.com ([2002:a17:90b:5445:b0:31f:210e:e35d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:939f:b0:240:c3d:2449
 with SMTP id adf61e73a8af0-24340d1c795mr7060450637.42.1755909190133; Fri, 22
 Aug 2025 17:33:10 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:15 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-20-irogers@google.com>
Subject: [PATCH v5 19/19] perf disasm: Remove unused evsel from annotate_args
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Set in symbol__annotate but never used.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate.c | 1 -
 tools/perf/util/disasm.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 0dd475a744b6..9548c5688fa8 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -1013,7 +1013,6 @@ int symbol__annotate(struct map_symbol *ms, struct evsel *evsel,
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
2.51.0.rc2.233.g662b1ed5c5-goog

