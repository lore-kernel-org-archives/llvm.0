Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A021B1BF
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567830; cv=none; b=u+woB/p2ByBRW/cLnArPxCKIHh1DZrJ7+IpDLRV8qKlXQXuZ2EvvQT5QzjhElRdfhG9WHSjyVXxeRL6XiYBsG2bZXH1bKAqim770LZuHvqhfeD1LgjVS+DMEQltBHqxua57ae5XFDuEVE1nZV35nj1OwT1SXgAKzFUcheqd1IS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567830; c=relaxed/simple;
	bh=HiDr79fP47XwAxdIV+5DIotVwJFwOZkI27dPvSasCd8=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=WaeIbqLdbyUdCvI7wWJaHoPHlrGds/Im5afni+QeXQMvncT2CQX50S+NvQQFy/GcP1KBdit1TbfBVmKjeIhF4eosT9k6UzfzxYqt6HJJl9oBFMhhznyr2z7Roq4ZGitGhv9yJ+hqf2kwl4j5Y4D4TPaHaHs4I+u6xIsf1Gquy5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aQ6Dvrhv; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aQ6Dvrhv"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e48beea5778so17574724276.1
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737567828; x=1738172628; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnFfwugrGP+xutDceieXM+J2RpmU+m6WOl3TVXWgxXg=;
        b=aQ6DvrhvfutstrQ3BtTmzcaxFtNIsRo/8A+jD6Hacd+I7D50rZQ1y05YTnN1VofAkq
         NZn4WaRoOZj9Qi1QgWKK3LzzKxxPJ5P8+gk9kufeM9OjL6j3wwTvMPDrNg3yX+oEUCmW
         SbxHuzMah0sCoWk93YitMldv29kQUP5tMKaED2P58JsvC5+IC8e3PisB8EkPaq/BYdNR
         qrHSTbrZulrz4n5c0LxrlQi99ianVXZGdiDF7oWZWdKQ8NnPRSgevGyD8ATm5+EHNNmV
         XzDle3FyW1G6cb4QhLeVm26h1fbjZLYcJnFfmXNB52cOrf1cFxSyr05oMqHrC7vAQxfZ
         9SrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567828; x=1738172628;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnFfwugrGP+xutDceieXM+J2RpmU+m6WOl3TVXWgxXg=;
        b=xNt44aSNcJFTM6U3dxwIB4mnVD4W2i166kctB54NYBW/mYPwJ8H3kbb5zfc5PkITMe
         om9VTwewVWPzipbPnxmRiFwwtb5BxYaz5J9BVoN2EKMlt4eu+NQ7zg0HHoNnkunG+Dac
         cNMG7nOYD3sDw4euO8c86UFc9xRGBmn543/Bpvi4xhWUlJSOPoy4CF0lb3oPQSBiuxIj
         6oV88B1fw2qClt8nl1lSaXPBtpcSUxNJpu/ioGJZacpe+e7WBISwz4Sdz24uhnKBiY2P
         bRoCh3XCrOBEO4YRDOx6IGR4ZemYCF2LsgQ4V9FxluYDtKuI0dN54mkgR63RC3Nocm+S
         K7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZfTEtxzF6LkXivx4y02VWQ+NZm1tW/sAAAR/63zt3CqSwje5wfCAAW6f9kWTw0DnAi7h@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn5vVTk1d4e0Kt+aKeZWDP6YzaDx7i2DyEmAXZGBOUfrGSbZtp
	/5yXZM1Qv6xvDLH9pZWXZK5tN62KlgYwV+16LrdTP3a7xm35MRZ25BI7yXVgpA/IVKiSEOT6DzA
	PUNiS2Q==
X-Google-Smtp-Source: AGHT+IGDW+VNC2I24v7j/el8+7OGxfjMW+p+QeEe5IN2AYkiRD2ZzpAOO1qo8IKIdt8znQOJcYUv6/sID15c
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a0d:c387:0:b0:6e7:e493:2db6 with SMTP id
 00721157ae682-6f73417e510mr135397b3.3.1737567828128; Wed, 22 Jan 2025
 09:43:48 -0800 (PST)
Date: Wed, 22 Jan 2025 09:43:06 -0800
In-Reply-To: <20250122174308.350350-1-irogers@google.com>
Message-Id: <20250122174308.350350-17-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122174308.350350-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Subject: [PATCH v3 16/18] perf disasm: Remove disasm_bpf
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

BPF disassembly was handled in here by libbfd. The LLVM and capstone
disassemblers now support BPF JIT disassembly. As libbfd support was
removed the functions here no longer did anything remove them and
associated error values.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build        |  1 -
 tools/perf/util/annotate.h   |  1 -
 tools/perf/util/disasm.c     | 12 +++---------
 tools/perf/util/disasm_bpf.c | 29 -----------------------------
 tools/perf/util/disasm_bpf.h | 12 ------------
 5 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 tools/perf/util/disasm_bpf.c
 delete mode 100644 tools/perf/util/disasm_bpf.h

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index eb00c599e179..4b757d157f13 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -14,7 +14,6 @@ perf-util-y += copyfile.o
 perf-util-y += ctype.o
 perf-util-y += db-export.o
 perf-util-y += disasm.o
-perf-util-y += disasm_bpf.o
 perf-util-y += env.o
 perf-util-y += event.o
 perf-util-y += evlist.o
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index 0ba5846dad4d..e704a9c913f7 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -438,7 +438,6 @@ enum symbol_disassemble_errno {
 	__SYMBOL_ANNOTATE_ERRNO__START		= -10000,
 
 	SYMBOL_ANNOTATE_ERRNO__NO_VMLINUX	= __SYMBOL_ANNOTATE_ERRNO__START,
-	SYMBOL_ANNOTATE_ERRNO__NO_LIBOPCODES_FOR_BPF,
 	SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_CPUID_PARSING,
 	SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP,
 	SYMBOL_ANNOTATE_ERRNO__BPF_INVALID_FILE,
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 99b9c21e02b0..ebd86691acf8 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -17,7 +17,6 @@
 #include "capstone.h"
 #include "debug.h"
 #include "disasm.h"
-#include "disasm_bpf.h"
 #include "dso.h"
 #include "dwarf-regs.h"
 #include "env.h"
@@ -1230,9 +1229,6 @@ int symbol__strerror_disassemble(struct map_symbol *ms, int errnum, char *buf, s
 			  "  --vmlinux vmlinux\n", build_id_msg ?: "");
 	}
 		break;
-	case SYMBOL_ANNOTATE_ERRNO__NO_LIBOPCODES_FOR_BPF:
-		scnprintf(buf, buflen, "Please link with binutils's libopcode to enable BPF annotation");
-		break;
 	case SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP:
 		scnprintf(buf, buflen, "Problems with arch specific instruction name regular expressions.");
 		break;
@@ -1500,11 +1496,9 @@ static int symbol__disassemble_objdump(const char *filename, struct symbol *sym,
 	struct child_process objdump_process;
 	int err;
 
-	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO)
-		return symbol__disassemble_bpf(sym, args);
-
-	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE)
-		return symbol__disassemble_bpf_image(sym, args);
+	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE)
+		return -1;
 
 	err = asprintf(&command,
 		 "%s %s%s --start-address=0x%016" PRIx64
diff --git a/tools/perf/util/disasm_bpf.c b/tools/perf/util/disasm_bpf.c
deleted file mode 100644
index a891a0b909a7..000000000000
--- a/tools/perf/util/disasm_bpf.c
+++ /dev/null
@@ -1,29 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-#include "util/annotate.h"
-#include "util/disasm_bpf.h"
-#include "util/symbol.h"
-#include <linux/zalloc.h>
-#include <string.h>
-
-int symbol__disassemble_bpf(struct symbol *sym __maybe_unused, struct annotate_args *args __maybe_unused)
-{
-	return SYMBOL_ANNOTATE_ERRNO__NO_LIBOPCODES_FOR_BPF;
-}
-
-int symbol__disassemble_bpf_image(struct symbol *sym, struct annotate_args *args)
-{
-	struct annotation *notes = symbol__annotation(sym);
-	struct disasm_line *dl;
-
-	args->offset = -1;
-	args->line = strdup("to be implemented");
-	args->line_nr = 0;
-	args->fileloc = NULL;
-	dl = disasm_line__new(args);
-	if (dl)
-		annotation_line__add(&dl->al, &notes->src->source);
-
-	zfree(&args->line);
-	return 0;
-}
diff --git a/tools/perf/util/disasm_bpf.h b/tools/perf/util/disasm_bpf.h
deleted file mode 100644
index 2ecb19545388..000000000000
--- a/tools/perf/util/disasm_bpf.h
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-#ifndef __PERF_DISASM_BPF_H
-#define __PERF_DISASM_BPF_H
-
-struct symbol;
-struct annotate_args;
-
-int symbol__disassemble_bpf(struct symbol *sym, struct annotate_args *args);
-int symbol__disassemble_bpf_image(struct symbol *sym, struct annotate_args *args);
-
-#endif /* __PERF_DISASM_BPF_H */
-- 
2.48.1.262.g85cc9f2d1e-goog

