Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58E1991CA
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909161; cv=none; b=b99Ibn5EKs+Qr9P7E+S1SBTrv0fuw8OdG8lBaAl4vdAcbakMxEBTvDbOTr0POhVshYE33H3zZEQ4fjMker2tDLehs8+wHdWYowLe4tHFHGpxAzbdLfq93+5BJFH1l8NBJzg/pMlRyH3bCBs2px02QcvO8b3xOBjFVIo8Vo2SgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909161; c=relaxed/simple;
	bh=GWOtu1t/RxChg6SCutGj+2xSmA0/8/DSnYIkVcOn91A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=RCuGxlnRxTTtnfvKrEHDkWBJ+keoJL4qvqaXTTvAhWQ/18egn2bcaQeII718T5zsywvugfkJhHjU7D5eUC1Fgl20ZqhBLORMwb9OY8V/B9DT/w0zS4KyDhRt5QTDBiw+X5Eiyq3u3g4KcwdIaq8f/ZBOLfxiSFndFXZru6tqOjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3MoNUOWJ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3MoNUOWJ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-323266c83f6so2692571a91.0
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909159; x=1756513959; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGZPVvFltn2hif4rzsnR8vI4SCPhVrC0b2f8qajHQd8=;
        b=3MoNUOWJSn0RKTLE8d0VolmXoxZx23sH53pwukpGitTpAwG/d03yYet1HBna4/pllz
         vOpYwWO7VPRX9H8GfdeNn1gfIfj8TOtppEb0JcmYlTYD+D8wgrKru0Ogr3I6MFMbNrbU
         rArCYoNX+XD4yp+brGqRaRZYxvmt5uVg+0SVeHyeF4krd4W3v/dyg6gJGXXbiGLK5yOa
         rxEEWXJULzXz4/1Q6uo7PlU+gSj5SUOK7TUik1Xh77zOmnFR7SxGzi6vx660ycGSh+5b
         A6/NUN4E3rQWrbxNGr73l9AJGOL9GS9EDreiaMVhATg9VaA/mDbP9JD+ayGwMOTuGflM
         iL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909159; x=1756513959;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGZPVvFltn2hif4rzsnR8vI4SCPhVrC0b2f8qajHQd8=;
        b=G7h+8MZZwHhahXr7HsBuyJ+YwRfDKosoaW20Ao+EnrryAttlY+qBwRchL0OV0TNBkb
         BNX+S1Nl9x2zc7xrasihHGU+Cun0hH4/13xA+iR9r0Dqbj5BAIN1w4Rn20tlTPA1itPw
         vrVz7+s2mqdZb2j2JhhBxxXVbKku9WZHuszm7pBkGRa1xiTx0n0xn8sGArI0wc4YF8Uf
         xJlvKERRKxkgejWaQi2om96F3ldo5C/0oxd2WrtYzJb3PGQbFdutn4n+1Du1GlKqxXFf
         qykVIgtk3JY5JpYwDNYPv1grGu4Vcn7FiFZQo9Zd104VBkpRvgESPrOR16JBDIbxk/zR
         BddA==
X-Forwarded-Encrypted: i=1; AJvYcCUGf959SwicOTMs0h5TETjYQWCj88bkkjZNUZ86d/8//u5eeUBZ00tVSPADEcVPXLe2TB33@lists.linux.dev
X-Gm-Message-State: AOJu0YwnFQi5ZZI62yq7GTTxwlZ4Va+cf05hDIEWcdbx6Sqg6xgO9S4s
	Ao2LkGA3OEyXBJvewrp36V6Kjm3ZSdSv7+pDVzAm6dkDbFDjyF2eJReV//o1eTjDvPJu88L3z0w
	Y9bct8+tJFg==
X-Google-Smtp-Source: AGHT+IEAYyn8MnoCs7ci9R88Si+M25VoBVOTRZ+hlMPRzq35t3VjvUUYExahmk0Z8H9xhbWYZKKGEm9MENVy
X-Received: from pjbqj3.prod.google.com ([2002:a17:90b:28c3:b0:31c:2fe4:33ba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52c3:b0:2fa:17e4:b1cf
 with SMTP id 98e67ed59e1d1-3251d471af8mr5719471a91.2.1755909159149; Fri, 22
 Aug 2025 17:32:39 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:01 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-6-irogers@google.com>
Subject: [PATCH v5 05/19] perf capstone: Remove open_capstone_handle
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
index dd58e574aa52..01e47d5c8e3e 100644
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
2.51.0.rc2.233.g662b1ed5c5-goog

