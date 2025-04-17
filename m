Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA72F222560
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 23:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931316; cv=none; b=CbvS/m4m7tbTo4GJwM3yuep/Yyu8GRUq0yGWQYlGD9OBlCEnpQ/10kvGQx4H0utCVGyEgqKltNqzdrenzy0yM7Z9ThcNiB4ADWR+IHk0z9kkhUzWtinMq9tWH3DBvid9MTno8x1WjI6NoMtLdhNEtpV+l7btaDswVmiJS4gIFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931316; c=relaxed/simple;
	bh=BMIYhQe06B1m/m1VG1ijiI+0phHw0fLo69Q/i9qHTls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=EHQyA0y+dRyccXsvdFwWf6mM4T6YN4ZYMRuyGf5/2ADVVZD6RrBh6yYhMCi1I9s0+k+XdIzwfLGioCk7XS58hDxQR5mEXoO9dk3RY6gEbuv5eT14ZXKvJyJQnZs12NfQDffBfDI7eaq9VunNZNkLSRO2kCQC87g3cGvujkJ1EaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y+TDbsp8; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y+TDbsp8"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22c31b55ac6so20059275ad.0
        for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 16:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931314; x=1745536114; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWFtkFZGIqy5t/lwfSWZdekY1UZ0W7H50S3h5IILNr0=;
        b=y+TDbsp8wi5EWOwf6OqnXtQAMwnvGSEHcNO5zy3JW//RnhfH3yZehegKVyvr1mtJN0
         UrUvd9We55IT+EEtZtf8K9Ai/e7gyK3ThJo82F+Z92V+I0zbyXjuThnB90aFQKH9HJsp
         7Ub13DD6tfN3h1D9WDyQ+ttGuyHqlViYDiRJ6LNUrCKgxegZXxUpYTyxFDvDky6Js9Cp
         UL7W/a6lVVKQTWFIUi0TUeZu+ny7qEPD4B6PQ7EiIDKROEZIlNTQf7ZwPxhq0HHlC5dV
         i+nDUdC2iZTtonAUl5LbILc9Qim+OUB5HKNP6u2ILff5RdczE7WeV/uD25GTcgDBHQY3
         0D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931314; x=1745536114;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWFtkFZGIqy5t/lwfSWZdekY1UZ0W7H50S3h5IILNr0=;
        b=sD18oZD7AzEM1BIyf/Q78PJVqJFdLTdtpVi1Xhs6U/qurwsYEmQ1nFsmgkS6i0Pxee
         JaEXfRBY7cD0GoxiFZ53hGF4PqYwbtXqDEpT+zpRLANVMkMGYp7F5+NgEQYzvpjzuU/N
         mkuvZEgOXSUEOW8HeW7TIHTFm7pl1rlKD1lhAWJpfdx1rQ6zjYdpFh9KDO9u4x9GjBWt
         Vp6iH8MrT/mTfWUno1nx3B6emBpj93eS1lGUjIZpDDCoQNpvmU4hN4wDGXcRw8TUwutO
         8tO710vYOfzdozGxtzOVwSNCUE23+dVYbar910+InlqtmAFKqhc47B7vOzd+aNzcah3X
         U4WA==
X-Forwarded-Encrypted: i=1; AJvYcCVm/pXnwFKlhW2K2r9YYyjWEhVJfeVgVxXUkEqZDuNE438ycePr0kDmdaCV1LYaCGy0moF/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+E+0nDD4EMlP+jQlQ808E8HYRW8ZjuypJK8kQ5NZk3gh8w+Vf
	EsLyVSpMjQwXJcPff/g11g4VFq42PSjMtstamfiFQt4WJ08bgJGkRvAA6zeIh7tAxpH5BRXccWg
	w09CXkQ==
X-Google-Smtp-Source: AGHT+IEViYHLkFOWXw+5kwQsGXZZ/Zsx+Y2Lhd4vhaB6w7nKZkxVtdfZ8HyaZrzD+J1xMdknmkgOW1xEQGPK
X-Received: from plbaz2.prod.google.com ([2002:a17:902:a582:b0:220:eaf6:fcbf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4cd:b0:21f:35fd:1b6c
 with SMTP id d9443c01a7336-22c5364235fmr8482205ad.45.1744931314420; Thu, 17
 Apr 2025 16:08:34 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:07:40 -0700
In-Reply-To: <20250417230740.86048-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250417230740.86048-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417230740.86048-20-irogers@google.com>
Subject: [PATCH v4 19/19] perf disasm: Remove unused evsel from annotate_args
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
index 264a212b47df..a2a2849a5b79 100644
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
2.49.0.805.g082f7c87e0-goog

