Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952321B1AA
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909186; cv=none; b=XXugpBGMe8vFRXfVx6J2wtIjFUc5uDdVHRRb+/94jdKJGgM69uPAzivpatPdZdc7J1i616M9+C/sUgH+lc5X8P9kWjVwn4akrqMy/wrZdb3UBXDxUmaWGVY1e7cMbE0HdOslm3goi2i6a90hQyX0JIgYT4BgMLCtqc2El+L/EdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909186; c=relaxed/simple;
	bh=nNl8XeIz7rmdK8TrpkAXR0eNEHS2Szv44iDFgQEBcSY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=gkY9ZKf80NatwujTS0KyrY3zS6iB0duaX72audVPkRpqCMQ1bZsRu4oGG8pciBJytEzwfXoeM+6VAtYN4MgM5sBDildT6uegg13eriNTwLj6YkAYr31iIfGSBAaN1VCJSvTdtCiGy14/dnvgc3i46cpuwBOq81OdjYvGZGQ0TK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f2hC3vnM; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f2hC3vnM"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32505dbe21cso1611780a91.1
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909184; x=1756513984; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3v3HudEygMo5HfsORW+tvM17Hs5+yg/IP3K1nOGU0U=;
        b=f2hC3vnM9YGiH5yJp4iMEGPJcMxMBIn0QwkInWX3MUc1Uon2S+PPFqwieqLE6D2VvN
         8ebyr7NzSs/yRUCWTTTO1pgTdWzLLsF+XCt7i2CjLv/AEPr4W/FvXADyw41zAHrdD47p
         IAEV7fP0RiZG8+JghI8vvnBb4yp7X+RugZNojNCwfZt6kLGOmsCTesg+oyfA++Z6C56S
         txZaeiE8hgF1vid9MU645KUYm4q+fwQwHaPdmLVQpXreIFF9avPjSkXvclAYWHvQQ2jb
         8geNsVWT+GS88xKZIvSe3o+50TfymMNLEnVAu1tNGn6W/5eu+XU6fb7LkUrvNzyyHP00
         4KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909184; x=1756513984;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3v3HudEygMo5HfsORW+tvM17Hs5+yg/IP3K1nOGU0U=;
        b=eLHZ5H4utyi+OUBvATVteko9Zw0SAj+NwpCkcSk8568/FhD0xAZqTYPUQDC2whFwhk
         71zXNfO/iOtbvCM5TLPS9Ax2tp4EWzccEULjiAhvL+tRgPlXxwk2XZPo77SInrPY0yIK
         Ns/b+QJOvRgwMDO0ydHF3UgLVldxehTcNHKpYyt9V6arEJph3wwqRH7xsQLZrlgr8DAQ
         2Lw/JCa6PwtOMLpbV68DUA0kXAZxb6DdxHAUOOouOiVAy84edkG2ONGWwJGm7ztOUMXT
         lBGZU8pfjwGkOZwDIrB9D92ssYx8cgVg6pl08j7Bg9CvLmI9rJN5uS1Ptk3plqIUdDWF
         6+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXJVd1o0t5/1EeMCVxo00m2x8G+Hpl2xuTnntrN0rtbI6QjlMhZltwawho/qoD5OaFOHDdp@lists.linux.dev
X-Gm-Message-State: AOJu0YyOCdcOvGpC35VzM5abJh6lp283eV364VS15ElFVtNBeXa/DpC3
	QvT5qeMND8tFKcNzU5HJaHqd8Z7fqxUzwxBYhlm/84wu9viwxzX2xLd/AX4421bV1s59A62Ln22
	pDuSjRyH3oA==
X-Google-Smtp-Source: AGHT+IE1SQVBgQ2XyyMCnryqhpVlGOBtpaIhxF+fA8xAn9tAPil+l8IjtrFZbHChPmd7AUiLEKJvuiQxQry1
X-Received: from pjbnw16.prod.google.com ([2002:a17:90b:2550:b0:321:c23e:5e41])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d06:b0:321:87fa:e1f1
 with SMTP id 98e67ed59e1d1-32515ea158cmr6422850a91.22.1755909183684; Fri, 22
 Aug 2025 17:33:03 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:12 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-17-irogers@google.com>
Subject: [PATCH v5 16/19] perf disasm: Remove disasm_bpf
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
index d11625d3bdd4..3e912aadcbfd 100644
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
index 8b5131d257b0..9f96e6d44570 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -447,7 +447,6 @@ enum symbol_disassemble_errno {
 	__SYMBOL_ANNOTATE_ERRNO__START		= -10000,
 
 	SYMBOL_ANNOTATE_ERRNO__NO_VMLINUX	= __SYMBOL_ANNOTATE_ERRNO__START,
-	SYMBOL_ANNOTATE_ERRNO__NO_LIBOPCODES_FOR_BPF,
 	SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_CPUID_PARSING,
 	SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP,
 	SYMBOL_ANNOTATE_ERRNO__BPF_INVALID_FILE,
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 54b38dd696fe..f7bba5e1e15a 100644
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
@@ -1231,9 +1230,6 @@ int symbol__strerror_disassemble(struct map_symbol *ms, int errnum, char *buf, s
 			  "  --vmlinux vmlinux\n", build_id_msg ?: "");
 	}
 		break;
-	case SYMBOL_ANNOTATE_ERRNO__NO_LIBOPCODES_FOR_BPF:
-		scnprintf(buf, buflen, "Please link with binutils's libopcode to enable BPF annotation");
-		break;
 	case SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP:
 		scnprintf(buf, buflen, "Problems with arch specific instruction name regular expressions.");
 		break;
@@ -1501,11 +1497,9 @@ static int symbol__disassemble_objdump(const char *filename, struct symbol *sym,
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
2.51.0.rc2.233.g662b1ed5c5-goog

