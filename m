Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78D202C50
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909178; cv=none; b=LdmkGA3KJL2BFMmPL9wvvXgaKuJPnKj7H3IJhb2mWyEmWui+dyFBwWPRTZUPgqTKj/E/OrEQCUJEqvQFtyMl9tbrwWsYVOo8o2mZtuBNoRv2Peo8UzhK9dhgnrI5nvc9Qg+lTmLnptK1CdDiNK9PcnkKdCpEMquoqdZnGTQLu8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909178; c=relaxed/simple;
	bh=oMNPPVuQWueuqeTaC6AVAq9hnK5DBHVL3OMBSxQCNXc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=c4/HpVM2bmOJuevwMuHL1J7yOyjhOMf209mjgtsTV+X8NJVHlnXEmYvM/4IhJ31bG11Hal3wda757/uU97D7dmqDPrg0pmZV9EayIvKnaoo920tXfexmfAySy9Dlgztv/FNeK39NH7RknRr8ujjKzj9XkhoMXZGkLTxbwSpJqto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PzvwxYGO; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PzvwxYGO"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b47173afd90so4385280a12.1
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909175; x=1756513975; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNiFno0XS+i9yOAQUiwWzS21Iglobe5u+DScZb3psQ8=;
        b=PzvwxYGO+nAzM2bLedH64axGV5nlI7/F2WMIw199iUb0Mw6oJitCpOdH83vwOxNhu2
         eJTd6j07yiQDf/XjKLmosRN+5pWeEQBYYGHUuxnOKILaCi12ZWFrHUoNTOc/dK/PDaQ2
         B/1cGx1HaGNHJOYpFYlOliiInBJdP/sb0E0pduI+vRukWBm0m6rBEZV5ojfGGLrQTR2G
         iqP7bKVW277NHB71zgwUTGtcLZHMX0CkreNj9CcImKMzU9zIJWi+XGFNYzFi8owT0smV
         X0C0oCBajpIk5h8zxzDZ7KTcdSfIy6u0GP7gDsrAZOuk0WeEYtAOQcBoLMFTGniSA/ro
         ut6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909175; x=1756513975;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNiFno0XS+i9yOAQUiwWzS21Iglobe5u+DScZb3psQ8=;
        b=JxBaJVi1P878DjBLCocwEtx6GhCWbLOV9rcwVkSZoTUq9pj6orM3ziQmDkD7mdiOBo
         7drwpGj4hgEI3LFtYOWDyFQojnAAaQ8yOrxqt9MbJn2+ObcfQ/5lVThNFft03/HHBVy9
         mDJs9LAJpJGYTzKIPzKLPRMHRgJXXacwi90iOV8HjG/Trdp58yzFgqxh9Mogp+9+63WF
         mPIjui6Q6o44yAAx3n/hVehumTiKwxw1sGvcMAwL4MoxFszfyN/v73kh8DzzA5LPbvTT
         priRfIdek92fdficAY5WMTnESf5ChuEagdhbXvFT9g44LcUY8gdgNMDBH1BN8/6jmLBd
         cPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyH69s2iulFqJSNTHCih51Hgl0ofrkrQF4//Sf2pB4XmANVV9rCfBVjbIKjeRztrX6p80L@lists.linux.dev
X-Gm-Message-State: AOJu0YylSjwz1KS27C5GXvCEptnudHs8ObzTtBA6dMcEu9t1yZqo48cZ
	4otkaNx4gA2hax+1r26kJV/ok+HE4alQIxHMDXybnk+kjN9wIs1bD5PKSLD62bm4d3ONfkW+miu
	LlrX+xM4zDQ==
X-Google-Smtp-Source: AGHT+IHyLv9syzy5lC6+KqrMJVbX4BQiVno/sGwJNoIqQ9CLYpfd/7+Vm5oy4fKcRhcoOhNH0ahMu23+toeX
X-Received: from plbme5.prod.google.com ([2002:a17:902:fc45:b0:235:6d5:688b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce81:b0:246:6446:8ae1
 with SMTP id d9443c01a7336-2466446a05cmr27382065ad.19.1755909174770; Fri, 22
 Aug 2025 17:32:54 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:08 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-13-irogers@google.com>
Subject: [PATCH v5 12/19] perf dso: Clean up read_symbol error handling
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

Ensure errno is set and return to caller for error handling. Unusually
for perf the value isn't negated as expected by
symbol__strerror_disassemble.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/capstone.c |  3 ++-
 tools/perf/util/dso.c      | 14 ++++++++++++--
 tools/perf/util/llvm.c     |  3 ++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/capstone.c b/tools/perf/util/capstone.c
index 5aeae261f7ee..88e270237443 100644
--- a/tools/perf/util/capstone.c
+++ b/tools/perf/util/capstone.c
@@ -12,6 +12,7 @@
 #include "symbol.h"
 #include "thread.h"
 #include <dlfcn.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
 #include <string.h>
@@ -463,7 +464,7 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
 	buf = dso__read_symbol(dso, filename, map, sym,
 			       &code_buf, &buf_len, &is_64bit);
 	if (buf == NULL)
-		return -1;
+		return errno;
 
 	/* add the function address and name */
 	scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 277c7e81f1c8..0f2051285393 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1831,6 +1831,7 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 
 	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE) {
 		pr_debug("No BPF image disassembly support\n");
+		errno = EOPNOTSUPP;
 		return NULL;
 	} else if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO) {
 #ifdef HAVE_LIBBPF_SUPPORT
@@ -1849,6 +1850,7 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 		assert(len <= info_linear->info.jited_prog_len);
 #else
 		pr_debug("No BPF program disassembly support\n");
+		errno = EOPNOTSUPP;
 		return NULL;
 #endif
 	} else {
@@ -1859,26 +1861,34 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 			.ip = start,
 		};
 		u8 *code_buf = NULL;
+		int saved_errno;
 
 		nsinfo__mountns_enter(dso__nsinfo(dso), &nsc);
 		fd = open(symfs_filename, O_RDONLY);
+		saved_errno = errno;
 		nsinfo__mountns_exit(&nsc);
-		if (fd < 0)
+		if (fd < 0) {
+			errno = saved_errno;
 			return NULL;
+		}
 
-		if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data, is_64bit) == 0) {
+		if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data, is_64bit) <= 0) {
 			close(fd);
+			errno = ENOENT;
 			return NULL;
 		}
 		buf = code_buf = malloc(len);
 		if (buf == NULL) {
 			close(fd);
+			errno = ENOMEM;
 			return NULL;
 		}
 		count = pread(fd, code_buf, len, data.offset);
+		saved_errno = errno;
 		close(fd);
 		if ((u64)count != len) {
 			free(code_buf);
+			errno = saved_errno;
 			return NULL;
 		}
 		*out_buf = code_buf;
diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index a28f130c8951..1607364ee736 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -9,6 +9,7 @@
 #include "srcline.h"
 #include "symbol.h"
 #include <dlfcn.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
 #include <unistd.h>
@@ -365,7 +366,7 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	buf = dso__read_symbol(dso, filename, map, sym,
 			       &code_buf, &buf_len, &is_64bit);
 	if (buf == NULL)
-		return -1;
+		return errno;
 
 	init_llvm();
 	if (arch__is(args->arch, "x86")) {
-- 
2.51.0.rc2.233.g662b1ed5c5-goog

