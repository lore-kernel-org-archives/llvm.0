Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07111E8823
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 17:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737394353; cv=none; b=JBZ6qDnDWzgDdk7mEbplB4iYm9F5mjuGm1+njVTyhAed5LurJwBngKdZKU40AlxcsZ9KasiyTIJMeKd4HBmRTCGtsSfF1TAU3P5EDCzYYFZ7lFElCCEzmOCM4cQREOsq1WubGaBJcHF3Jxs0NqPPhL2lQ/dJF2KGvB77+HVbfoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737394353; c=relaxed/simple;
	bh=ksmTITiwDHRKN7AM1iSFOtcCcIcP7GGHu1o6+CqXZco=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=AixREV8XF1AcplFuexEprVMBg40rs7X5fNok0WcVmrItXWO1zYl3XLfjUcDSM2kx8XAs1yPc4LAoRH8CSY09FdGdzOiTMsQcPTXa/hhQhefFoSp3Rw1MT3yEy6o3rLrGrrSd32yTORpFdbK5Z/YuQAMwoHGM+cEU2KjSxdilakY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qsMBm1qW; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qsMBm1qW"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e39fd56398cso10961274276.1
        for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 09:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737394349; x=1737999149; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtzTzHqLOrR4WcyKkQw1nPTI/K9PhaOnccVbKtmGOUc=;
        b=qsMBm1qWWoiFf3f7k5BEtb7qK56k+czRRa2D27FUkpT/DbCcrf0MuWjubYzyV30/52
         +7ZBQIo+59uc8iZfusip9zglXojJ1Ek/TjfEIPK8NvRPjI/k6rzzPe5LUheQBcrBshd/
         +IydXE84/E/A6a2yy9tftLfzX79718ML1p3JqWy18jaB8j841/pk6rZNH4MtCLIKbNML
         312PsdmQjUlgGdrVxOid1zrOv4xo4I0ITyG6QYdUWxZtyMP0hwLoAs4KKefrXExGtGRi
         pPbd9X2eIK+5IBEgmEkkwI7qWd1xNr3FFrLIYI0BsesWcufg42hd0liCkKMm2JV3fRA3
         t5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737394349; x=1737999149;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtzTzHqLOrR4WcyKkQw1nPTI/K9PhaOnccVbKtmGOUc=;
        b=W2STJLv5vqxbOzb6NWupUmNXoLWHD9U3FreT/uzUGnUxkM6X1x7t50kmTHhMZYdd2x
         9VhyuEvy7c2YMH7YBF2+DtA38wL0R4xA91b9n0QMejU24suHqaHQGGUZn6nPheywtZZb
         SKoTetegolLvdCqTWqQf2sFiHBAL0ijqUVcGKWEXmEF3vErAto28IOP1UCfJN1oDHX6W
         +BWTCElju9IHsEWNxQkY4Au1b2f/GBg+b9cQkw8iw1+zLVzUWoy6sUe2FSKvFSB/N/By
         La3MW+eybKpRo0QSElmUn4Fpn3De8lxwJYzbQhyvBHMAWL5OTpon3pvsgxzZeCsBqxms
         yX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1cSbOG3V0h4/Y3o3kUD0BQcVlfcEYhiAghVkOlGv7QYMvgS0/sX99vDv6P7LefxLyMpwA@lists.linux.dev
X-Gm-Message-State: AOJu0YylJLPFlZkXGvi3wmveo4wNfQjoLOk6uAqRYX1Ogqjl5vzNHNNu
	GQFI7rnhCiGvl5FjKwEVYlm1lGl7owwG39k6iyQRcs3uIwgnuHblkms14sbdAzeqTUDrVzlLT5y
	9imcy8A==
X-Google-Smtp-Source: AGHT+IHIzB+rzKdJa/y5Df3JyN6/QJXl88D/lTU1G5FjQMVdybu4eav6ixEQn5oya5VjsDod/0fpWDvIHW8v
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:fc95:312:c7ce:d18e])
 (user=irogers job=sendgmr) by 2002:a05:6902:309:b0:e46:4def:f62e with SMTP id
 3f1490d57ef6-e57b132e742mr29263276.6.1737394349425; Mon, 20 Jan 2025 09:32:29
 -0800 (PST)
Date: Mon, 20 Jan 2025 09:32:06 -0800
In-Reply-To: <20250120173208.344231-1-irogers@google.com>
Message-Id: <20250120173208.344231-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250120173208.344231-1-irogers@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Subject: [PATCH v1 3/5] perf capstone: Remove open_capstone_handle
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Changbin Du <changbin.du@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
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
2.48.0.rc2.279.g1de40edade-goog

