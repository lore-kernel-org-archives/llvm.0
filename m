Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204B2236F2
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 23:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931288; cv=none; b=qsKB4I3aFi6DErNH1s/QAuKEXzj0USf1YzVSvHemoirlb8weAr0eziOzMSSRVMFjrgsp3pwPrSGK0qa93UFiLw/2aEZgHthoGvrJzR8GlNZ8SEZvdVKJpTgKjhEdz9paBQbfVmMDPUZvttf8IoeX1C1EFmYk0EcDYYP9MWnE5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931288; c=relaxed/simple;
	bh=LRLZdT5hOWA0SXwX+weES0oI2ZWCXSQ23XqvPbFD5aY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=my6aJ5Q0Oszyo6KEf7m9VSoRE3ayE4eilm7BeltRzBQUeinWnQPEwDLI6Bd0jMBiNSlQjNWA0HUqMxLg40EmVw4+HHu5W+m7lbIRZtpFPQ+SptyOvio8gPVfK75kRGeN4bmuwoMcxMOUcP9C4YUjPQwd2gtGqwqqqzu7GQ9eM58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MRDVOwdh; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MRDVOwdh"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22647ff3cf5so12029485ad.0
        for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 16:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931285; x=1745536085; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+v/iA3QAz14KzOUNaxFJb9QhGqk7bNH0V+P+kCM29I=;
        b=MRDVOwdhScPn4Ptzmte1Cam5ggG8vairoEjlAufNn0J9p2fkDB01WVLNGres/+Rzr7
         CLE51fGDsmUGKemyf0HyhdHpELeFG/RJ6qw4s/Rlh8dXx1BV+kMRGmzyTzLdYlsyaCoZ
         5ddjAjL13Th2PyDR+9dGdEh6ugc4hZCGfTBKHxIpmR3pxP6kM8Q4E1kSLQqhL/ZFkDxp
         f7bgxEGcm/zti5o7Wt973lUukvaAYNfNua62H8RGz6iW5/ambWFjWYiyv79lX6DQWO1y
         SX7RyJsL7r8zqRGb5uT4NJaaewEI53UHoyc0fTVTx334Lk5/+nE7wkB5zCdYuj4Y3eVz
         fItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931285; x=1745536085;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+v/iA3QAz14KzOUNaxFJb9QhGqk7bNH0V+P+kCM29I=;
        b=rHvibdNL+fn9SD/ePJtoSF20zKrSqvrY+UBPJD2Men5i95AUEVgjIIkCSBinesvfCV
         IjIt0451fGG8mP+/Tu0xvJlLAdTCrSZXUT1WK0KCcwiCWc/RzRSkJcbLUFWwZR1Dom+L
         uZSq3NPFu/ZfTH4FB5BTe7lRisAq5PGhIf5JXfrIxkIyMA4bqJk4yx4jWoMyIxEy1sIx
         br56CgsU5K6p98z9J+TmEM/HJBwTGOL9cP4w4WwooS2iwhCMfskQEcsrL0eRELXn2rPQ
         vy4r2gt0Wy7G4OfK8d+VUiVXatRfm0Jbwpx9AapbB8OylZIWz47gKqfAt6T4xSNGdHI+
         NC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPYN/+7JORAGNAW1OKNKOFAPy5ymQ/Va+Dn4Y9zi95t+Zz5DtSg8xMVNLj+ooF/9WJRXNg@lists.linux.dev
X-Gm-Message-State: AOJu0YxTwGR+kHoJcNffqhIfU2qQEbbmDqI9HSMg6wbZT6Iph1lcEMeJ
	LTifJFNgYrIYewwTr0vBTXUp6TiT2IeeqP6fSeZ+n4mC8/4i8OxZ7a2nX8mS3P1h9EW9AN1JKyQ
	LtyimQQ==
X-Google-Smtp-Source: AGHT+IG7ZoF5x6T+kA85kaMATkQC66Ptfdqe25x2XYwjUy5ZUI7EMa3SwBgwuXxfCajqgxBSSEbaedI1jfQj
X-Received: from plrp11.prod.google.com ([2002:a17:902:b08b:b0:223:432c:56d4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e80f:b0:223:fb3a:8647
 with SMTP id d9443c01a7336-22c53607c39mr9603665ad.41.1744931285231; Thu, 17
 Apr 2025 16:08:05 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:07:26 -0700
In-Reply-To: <20250417230740.86048-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250417230740.86048-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417230740.86048-6-irogers@google.com>
Subject: [PATCH v4 05/19] perf capstone: Remove open_capstone_handle
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

open_capstone_handle is similar to capstone_init and used only by
symbol__disassemble_capstone. symbol__disassemble_capstone_powerpc
already uses capstone_init, transition symbol__disassemble_capstone
and eliminate open_capstone_handle.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/capstone.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/tools/perf/util/capstone.c b/tools/perf/util/capstone.c
index c0a6d94ebc18..c9845e4d8781 100644
--- a/tools/perf/util/capstone.c
+++ b/tools/perf/util/capstone.c
@@ -137,33 +137,6 @@ ssize_t capstone__fprintf_insn_asm(struct machine *machine __maybe_unused,
 #endif
 }
 
-#ifdef HAVE_LIBCAPSTONE_SUPPORT
-static int open_capstone_handle(struct annotate_args *args, bool is_64bit, csh *handle)
-{
-	struct annotation_options *opt = args->options;
-	cs_mode mode = is_64bit ? CS_MODE_64 : CS_MODE_32;
-
-	/* TODO: support more architectures */
-	if (!arch__is(args->arch, "x86"))
-		return -1;
-
-	if (cs_open(CS_ARCH_X86, mode, handle) != CS_ERR_OK)
-		return -1;
-
-	if (!opt->disassembler_style ||
-	    !strcmp(opt->disassembler_style, "att"))
-		cs_option(*handle, CS_OPT_SYNTAX, CS_OPT_SYNTAX_ATT);
-
-	/*
-	 * Resolving address operands to symbols is implemented
-	 * on x86 by investigating instruction details.
-	 */
-	cs_option(*handle, CS_OPT_DETAIL, CS_OPT_ON);
-
-	return 0;
-}
-#endif
-
 #ifdef HAVE_LIBCAPSTONE_SUPPORT
 static void print_capstone_detail(cs_insn *insn, char *buf, size_t len,
 				  struct annotate_args *args, u64 addr)
@@ -309,6 +282,7 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
 	cs_insn *insn = NULL;
 	char disasm_buf[512];
 	struct disasm_line *dl;
+	bool disassembler_style = false;
 
 	if (args->options->objdump_path)
 		return -1;
@@ -333,7 +307,11 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
 
 	annotation_line__add(&dl->al, &notes->src->source);
 
-	if (open_capstone_handle(args, is_64bit, &handle) < 0)
+	if (!args->options->disassembler_style ||
+	    !strcmp(args->options->disassembler_style, "att"))
+		disassembler_style = true;
+
+	if (capstone_init(maps__machine(args->ms.maps), &handle, is_64bit, disassembler_style) < 0)
 		goto err;
 
 	needs_cs_close = true;
-- 
2.49.0.805.g082f7c87e0-goog

