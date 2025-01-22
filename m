Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A41C3BE8
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 06:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737527163; cv=none; b=YvbAa4A3Ftwt1jzJ3XZn94jrRz4j/Yg7EbQSTuNFIbKg5aLAsx3mPm/5tgzcc+1yurceY4dnJ4wV60/r60NjZg4qHo7yq6Z0dCUXNh9T6AOqObxmxNyfoH+wpyE7ujhJ90tG+/c8waw8W0OohkMC9VTcoOGf6715U8ZLaLoESdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737527163; c=relaxed/simple;
	bh=4eVzUx7LyXLmyBqZ04/qHfp1ubXNS/OOuZG0/Fwht+I=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=gas2DLZ5m7LAYd4R3sY4xSwUudys6obFK7bMcHxnDdltJub6lpJLeHiZFiFJkCDEn1JkGrzjkgr9zDmW7psIZYkLINQG3HqDZgRRv40OYVUjxL7k6oq5nNh5VFA4RKA0zo6IA/njznRpEKDzcpVZfYERFzLnp76MgOw95syR/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z7mMM/Gm; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z7mMM/Gm"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e575f472438so14406040276.1
        for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 22:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737527161; x=1738131961; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKqawTnGAxAu0q/wc+BOpGtG2cpu0MmUyGjHNjJM5iE=;
        b=z7mMM/GmBt2lcTbnGZAPiqEWu8uRw710mvylx7KJRC7Yaij9TEJj1zphrWXcmvIVaE
         2rkObi8X/YEODka6oJXAu+nDZsCXsjuvc1uXVv7umN/1tiiG6IYOG26GMdS3E1N/N/4Q
         asGBLer35F7rqmluGwFWHklJN8A1F14xgjguNEgJT4RKlKb8sC98OOKou4sPjZv7WpRz
         QacJwavP0bBSm1szSM2NQCa+GecBdS5uAz5t3dWjfDgrvWsKY/Vj+6M1a+/RKHEDLV85
         yJqdBv1vZkw26dccQeqoKDFMCoSBG3FkAxBa1se/q7Vo827HRAQzMT3qkEytNsGqUONl
         O97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737527161; x=1738131961;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKqawTnGAxAu0q/wc+BOpGtG2cpu0MmUyGjHNjJM5iE=;
        b=mMeOtskODp3E2TEIxIod+Ed74CEuwpvIev6pz2ZiHXzLMFexKoGcsM+VKaQ3ZSHo85
         oMfrLWALTJ8M/tbHgsg5FqDnLg0Szvm7S39SGojqC1PcPagmiZISnsU31+ptOTcqZfG4
         2CU0GZyc1vXitkCQ/F2vCJuPB5QnNO2CeBUCw0dgezlwwl9TMRDxBU/TRzoerINf9//N
         mSb3dgTir1hrgZh8dLFs4qxZfz0MlhZjUHUL5E0z5bJNJOuByjsBYxSxliu9wA60jz5H
         hRHJsaxpvWvfR3QG03DrB2jnQATaMnSAF7cgq8FOuoxzGoMjVNk1qiuMeie4w2IL07s7
         X9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUg0/frXgLwaR8zDzFdDYHVcozv2+EX1Q+l6uR2FiXdPw9B6gETDTQgILVu/ZUKxzud7u6+@lists.linux.dev
X-Gm-Message-State: AOJu0YxKXZGPxKtZaHJAsBraaey9gandp3HzjY2vTjUg2vv7mhE8H2bU
	ObrhGozTDnfQOWKlLZ0k/WVohrrDPVd9wkESm4WLS2nCuLNTDwosftmGiPXAHBM79Ki+61+tXEZ
	c2pRaHw==
X-Google-Smtp-Source: AGHT+IEIfcJLtTBEZluRA1nwsuELe3zQ6ijw/DfjYoqYE5QW7fzSo8dNRVRcgtzpL8L2iIcD9YGQFvcEtgOh
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a25:c181:0:b0:e57:3e87:8c1b with SMTP id
 3f1490d57ef6-e57b1337eacmr35774276.6.1737527160752; Tue, 21 Jan 2025 22:26:00
 -0800 (PST)
Date: Tue, 21 Jan 2025 22:23:31 -0800
In-Reply-To: <20250122062332.577009-1-irogers@google.com>
Message-Id: <20250122062332.577009-17-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Subject: [PATCH v2 16/17] perf disasm: Remove disasm_bpf
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
2.48.0.rc2.279.g1de40edade-goog

