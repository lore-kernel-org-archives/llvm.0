Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463A31BE86E
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 06:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737527171; cv=none; b=bOtVPzAgACpBNJIP8Bq6bOVkBY9+T5+81On36YytydH9AkIQrgBFISSWxwKZAJVgbnAZRR5wYwk07+iVJKCXerCLfXpon3Al/iXZO+GyrLvxr2uiHDYhjPk/jiCH+7ZbQjH1wCJrcTNURT4B32IuPrxSJifFI/8onbL3aWUhSt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737527171; c=relaxed/simple;
	bh=BfQOAR1G+at7pRYGYXzHQjPEnrcQ33cHSvtWSYC7XKw=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=JGvCcguSzaWaWEH5Qpy9rGyJ5EvBV3e1f8iwGPHQmfiHF3Nz3we0H+shHZg35yKFfv35zhb4jExaQLmm26laSNWGSmkpYJs1ZxnkE/r+yCYp8o3U/bfIor6SpG92OghzY42MRIoMt29EQJpo5iKjTDLQckKfobJ7Ucg1N/nycCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rt99QeRJ; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rt99QeRJ"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e5738e8d116so12459915276.0
        for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 22:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737527169; x=1738131969; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgqdWXIgH31oO69HT02RtwzG7MxuXhHOOr55YpEQGAs=;
        b=rt99QeRJhoM4EVii8c7IY4zt55nCa9+6RkJEtgSshEVlOX3tbRe3K8Gvh8T8JDRpp4
         bzORwmxOGWSF2BH+hvCU3a8JS5OsEs/MPoYpHExZk0tBAp6ckq3QSV1da9Ow1XCI4Zc5
         48/zIA2AesVuPqUxkQkY5vQ+ZzuoyBFYdXjO763qOsYmV8MZw6aNNsme8SxJBPZkQ8J1
         bO9Q8qjW9kBQTBNKCLhSm/654qWrSh9dNJHyJOP7fpGXWICtHHo3yoroIUaUYxrpUvmP
         vICQEriK9vgltab8Zeuc9UYUQta5l6rCaqDpNkX/40TRn0W8LdCK3B5TV7TgWt7yByMy
         jbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737527169; x=1738131969;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgqdWXIgH31oO69HT02RtwzG7MxuXhHOOr55YpEQGAs=;
        b=SJdDRGR5IxFjLe9t9D87RlHDZfZXR9dwK9chsBxUo4oTVasi+lE6QROyafTxj0XNFX
         JKYmfGXFQlupMmYqVZBYPuGpvxFC5PsPyy7YHxf61FRHxBzGEbkBVVtH9n6QJWslg0Lm
         vus99/bfnBoceLZpFPkXAemzqShfQwI6mKLlFJiLfkJP3g2YWmSdYXDf66AkkATt1Yrq
         0da16lirYoD/OWitbMUqLMrzbb9Nk8Uyfb7phyCcA39ic0T0KWxuUykD6OjKno5VWr2S
         SfLBMJ43EvkW+9equ08N8iOQm6LBgI3xuhzujG96WYhd8P8sb20UTf4q2AUKxa1EiM2/
         pNDg==
X-Forwarded-Encrypted: i=1; AJvYcCXHOBSnpAw5EIHJZDcyGSbVTYQ9NovRmp7Tbfhm/Ds9X6Hi3wlZaLYxHUy4QDHy9tH24UiS@lists.linux.dev
X-Gm-Message-State: AOJu0YyN7wUlXwKfJllgQsw9Qqqw4nsV0KssCxsH+imfKnxAjkeJ4kLq
	CCyqll2UzXLV1mJeuYHPnlvvvhaCDBBlZwtn9/Nfir5yz0RbeCNCeJ1jVSc/wdFVYK7a4Yy6ToO
	bm9Y9dA==
X-Google-Smtp-Source: AGHT+IF6rwzVNy8tbQ12mHzbRHmKpJHEzsK35EPLx3KJfYalflkJcjMfzIoyWZyP5IcEbo2YvBdof+rOLPE0
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a05:690c:3005:b0:6e9:f188:8638 with SMTP
 id 00721157ae682-6f6eb9475efmr341777b3.7.1737527169492; Tue, 21 Jan 2025
 22:26:09 -0800 (PST)
Date: Tue, 21 Jan 2025 22:23:32 -0800
In-Reply-To: <20250122062332.577009-1-irogers@google.com>
Message-Id: <20250122062332.577009-18-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Subject: [PATCH v2 17/17] perf disasm: Make ins__scnprintf and ins__is_nop static
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
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

Reduce the scope of ins__scnprintf and ins__is_nop that aren't used
outside of disasm.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.c | 6 +++---
 tools/perf/util/disasm.h | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index ebd86691acf8..b2dfd40588ef 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -246,8 +246,8 @@ static int ins__raw_scnprintf(struct ins *ins, char *bf, size_t size,
 	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name, ops->raw);
 }
 
-int ins__scnprintf(struct ins *ins, char *bf, size_t size,
-		   struct ins_operands *ops, int max_ins_name)
+static int ins__scnprintf(struct ins *ins, char *bf, size_t size,
+			  struct ins_operands *ops, int max_ins_name)
 {
 	if (ins->ops->scnprintf)
 		return ins->ops->scnprintf(ins, bf, size, ops, max_ins_name);
@@ -824,7 +824,7 @@ static struct ins_ops ret_ops = {
 	.scnprintf = ins__raw_scnprintf,
 };
 
-bool ins__is_nop(const struct ins *ins)
+static bool ins__is_nop(const struct ins *ins)
 {
 	return ins->ops == &nop_ops;
 }
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 2cb4e1a6bd30..09c86f540f7f 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -110,13 +110,10 @@ struct arch *arch__find(const char *name);
 bool arch__is(struct arch *arch, const char *name);
 
 struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl);
-int ins__scnprintf(struct ins *ins, char *bf, size_t size,
-		   struct ins_operands *ops, int max_ins_name);
 
 bool ins__is_call(const struct ins *ins);
 bool ins__is_jump(const struct ins *ins);
 bool ins__is_fused(struct arch *arch, const char *ins1, const char *ins2);
-bool ins__is_nop(const struct ins *ins);
 bool ins__is_ret(const struct ins *ins);
 bool ins__is_lock(const struct ins *ins);
 
-- 
2.48.0.rc2.279.g1de40edade-goog

