Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02D2512C3
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 23:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931310; cv=none; b=DNZUizfxHYcDbZa3+5p3VdXoAuSjCe/rw377Q/sPlKLFyURMLTqfINcvoHOQnQbM9bIYn23vUvzJ4M5I2omn28zOQKbeVik/H5g35dZSF5gpVeYo/iJOGIVptLKwHCHYSO3Gi9tPPwwJzQatgVZjKllqfeum0biwb6juxUPsa7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931310; c=relaxed/simple;
	bh=dVqTwm6Z5kJPYlgxaTtj66E44vbniBTbV8kGzDOLkSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=kvBftINaZXBUK412YitsaZ5ujmugsRbjzEf5hqDUhZbtl2sW34ezIP19OFVJ5LqbWF7RLeNYnPAUkZjLMExW2wtvgLouQq9N5cI/v+KUD0sKSTGNBpi8/Z0iI9vhHGxNwsFKoifm+zGj4pYt5tJV8cFZ3tW5o54MiSo9Gp8hmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FKgRrZIk; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FKgRrZIk"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-225974c6272so9697425ad.1
        for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 16:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931308; x=1745536108; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RY1r15pwpCxEu/4KBHv5AIK/eUkuBGzABOfCshTThNM=;
        b=FKgRrZIknkbt7ERoqjnme68pWBB+EBtTtCbWKUSAxNlshtEQNlHsSsFAo+5JQMH6Yx
         RclMgdMzY/VKINW8ps5J58RGn/SxDu96WkcxypXrrFZ1K4IQZelGel3cOhO+6wFALc3V
         tzL7z18yMIYLkqbLT5fXaz+pTjlmR5MHLiv9oHTgbIE3qLldkkmGBp4/vntpHj2cl6Lb
         iLlkYxTarmQIBxnQYKiPYQB6SGWgc/eCXoo4LauK4MF+jEWjItekxj+n/B+mn80Ci4bu
         gtVEc3dsyZNz7JCL75aGSXyy0EJbqC7gtFA85AeZJFzvuUx73W0ZCwjwwSlg0/W+Eviw
         kmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931308; x=1745536108;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RY1r15pwpCxEu/4KBHv5AIK/eUkuBGzABOfCshTThNM=;
        b=NJKGWSSJXAzD70NtCkO3VK3RntWJ50YG4OM+pMCD+gsNl/Qnov+DgZDljGnE3sZa5g
         Htz0ZeOAqhnWimWXr4niAuRx/8UWDxumxAzCapk9rJVsJXo65VBVeFf2HP66f19HTx8h
         CODF8HWFWHaWNzXrkf2GIJaLogxfXWzDAAXKj0Zf/VAPKfUkugH5kKT1qbyaziY/QKSG
         0bGHyS12yxjXMqANq1spfRVkdVOZxAdSG6o5+76E+wGzO1Tx04SXzedFiUVJt94h4rpA
         b0kf0HdEL7EnonagNKFp7rDHp2sQ5FPU9nnd00BJudwAyfJjL2ofb3Luc1NDhc0U2hhh
         S4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUIrghNp5tP3FLD6CFQN3UfWbUX9Mks4Je4ZulYdIyqs/ffYsnDPhrbRt2TSGfWXaYP2YZ3@lists.linux.dev
X-Gm-Message-State: AOJu0YzDCM8egskRBzCN3aqTF+oUk/J80pOMbcEoXYct0ZTU27ccnSbw
	btMSL59P8gnINF0vQG2SfQpJcwQOA5pPU0UW+SKWqAGwX5SJw/Z8cEWA0dKqnY1K4ZEkkqd5arT
	0jtt93A==
X-Google-Smtp-Source: AGHT+IF1KynYQjk+qiDtYBRZqtrA+sXYk/Qlh4FVBuUH3NSYZdwIzrbF7KXRZDSOIoNHB1eQbEczvfeazT6E
X-Received: from plsa23.prod.google.com ([2002:a17:902:b597:b0:227:e456:d436])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f78a:b0:220:cfb7:56eb
 with SMTP id d9443c01a7336-22c53f36a0fmr7932675ad.26.1744931307861; Thu, 17
 Apr 2025 16:08:27 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:07:37 -0700
In-Reply-To: <20250417230740.86048-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250417230740.86048-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417230740.86048-17-irogers@google.com>
Subject: [PATCH v4 16/19] perf disasm: Remove disasm_bpf
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
index 861e8ed4ac49..cc22cc8a5aac 100644
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
index bbb89b32f398..8b14a90a3a0c 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -446,7 +446,6 @@ enum symbol_disassemble_errno {
 	__SYMBOL_ANNOTATE_ERRNO__START		= -10000,
 
 	SYMBOL_ANNOTATE_ERRNO__NO_VMLINUX	= __SYMBOL_ANNOTATE_ERRNO__START,
-	SYMBOL_ANNOTATE_ERRNO__NO_LIBOPCODES_FOR_BPF,
 	SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_CPUID_PARSING,
 	SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP,
 	SYMBOL_ANNOTATE_ERRNO__BPF_INVALID_FILE,
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 175d9d3b5c97..683eb6aa7b53 100644
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
2.49.0.805.g082f7c87e0-goog

