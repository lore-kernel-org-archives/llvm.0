Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61ED2C08A8
	for <llvm@lists.linux.dev>; Sun,  5 Oct 2025 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759699354; cv=none; b=RrdTspLZjSYfz+/rXCcFmBcG5ReOWbuUpU4aEWwATOmub7JUJZASj08Lt90wBJJgTdy65ej8UQzv7iCR+vn2DjQOpRVwPcjRafoc2BuvB7ZxKDReQobs6rZW3RXmkHelE15byRjgaGbfUNgkCnCxuucRy1YdbmzcdfMcffJXslY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759699354; c=relaxed/simple;
	bh=Apk/dx4vry6NQH8mEaGDTQ4foAvl3cC+7BrNRcZnR4k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=mme91APXuVOjRIfLrEDdkM7oSJZS+qNYabn6/Y9XxsjULWOk1Z3TVBf5XCEcjOzuzwBc3IDD8JqybAeWdoPyPBnMNF2xxx2Hdsq/iKwHOtpWA2a6PX0ZV2VegT20ruCBxtjLf1SxlIKjvCtimZvia8ktXe/V8fYiG+/RLzQpnYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SYNv3RYL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SYNv3RYL"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b59682541d5so6457721a12.0
        for <llvm@lists.linux.dev>; Sun, 05 Oct 2025 14:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759699351; x=1760304151; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCU0ELaC9EV+pXq9bhGKOQtESKkLJzIPHgh+H1HErVM=;
        b=SYNv3RYLehQo3e+ikKwygIM9wNh9rT075whNSeSqiev7jsQE9jlUFQkRRhe2po+D2e
         /FYjy7m6rCF9kyI8UXs6e27/jYZcJjnuintzDgw3jABXQvMI2VU5/38GG/U/8zUlPxVv
         fKQXmDv9YcciBSYuvHz7kmCr0wKFl2DJh66bi9nw+dh5f/IWORw9/c1EIA9gkIUrAggy
         RwKCuWmU8Hzr0wM1cqzrNPa3dDLTEMK2DQ4a5u7aKQGOHh+pW8tgy0I0i0RbMthRaSAa
         c3428hJVv1lgrF4RyYMSotaVau5IGGxDdbhdhN6s2O77BuL5420yku9Be91x8P+/50Sk
         /PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759699351; x=1760304151;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCU0ELaC9EV+pXq9bhGKOQtESKkLJzIPHgh+H1HErVM=;
        b=MXyjo36Su4wq8MUQND5PCAVNrUz1EbELnXpGjcTF7hLYtjO4SKXkc+gabSzVQRDku6
         IeFaRpnME7qKyE/6pEYrHkTYtDzYPxF8+tNRVm+DWsvjNMenVF+RNcWoJJF7NVSjNkxy
         J+xWLUWRxy8pzdIzH4lJs0tnaWvJKYZ4diFjRzFMz+ObD28m445g4ncoOsNokK3oY6dP
         vwxQIDhBqcKlyr4ClvbuLa7h0Cs9AWnohe2AcC/vshvnaYk4uEjK27SGThpx97X+qnRs
         mUwUXzMoQLFiNsruTT+n7F3QUfqFwcISA6DuMCsNnvaV8osonifiNcgFyOYDd3Z2C+gY
         sxdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQv54W0Qjpi7Pbp6SsUmUlNZ9tNIC0EB1YrG4OtzuwmepJix58MUmVCoVSxTxhdehLTrnT@lists.linux.dev
X-Gm-Message-State: AOJu0YxAzQBHwbT4p4hNlbopTqYshY3jWyeJo0UR/RjN2RAjmMOJlyQZ
	oATzOar1XAltnSumjXlzJoi/Y+79xXOSql3wNVc2WklI+pZALp9m54DZ6wWOAIm4KcvwIw8FtPZ
	WSj2duiBftw==
X-Google-Smtp-Source: AGHT+IEObakE2dl7ZB3J7e6NcFFPXma/CZs3oBgvcFiNAqIU+hl2VJBrud9gEmmuxGfQ8861tRaCUUzuXCrN
X-Received: from plpa4.prod.google.com ([2002:a17:902:9004:b0:28e:804c:cc96])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2b04:b0:27e:ed58:25e5
 with SMTP id d9443c01a7336-28e9a5b037fmr121304265ad.24.1759699351184; Sun, 05
 Oct 2025 14:22:31 -0700 (PDT)
Date: Sun,  5 Oct 2025 14:22:06 -0700
In-Reply-To: <20251005212212.2892175-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251005212212.2892175-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251005212212.2892175-6-irogers@google.com>
Subject: [PATCH v7 05/11] perf dso: Clean up read_symbol error handling
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Collin Funk <collin.funk1@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Ensure errno is set and return to caller for error handling. Unusually
for perf the value isn't negated as expected by
symbol__strerror_disassemble.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/capstone.c |  3 ++-
 tools/perf/util/dso.c      | 15 ++++++++++++---
 tools/perf/util/llvm.c     |  3 ++-
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/capstone.c b/tools/perf/util/capstone.c
index c23df911e91c..be5fd44b1f9d 100644
--- a/tools/perf/util/capstone.c
+++ b/tools/perf/util/capstone.c
@@ -11,6 +11,7 @@
 #include "print_insn.h"
 #include "symbol.h"
 #include "thread.h"
+#include <errno.h>
 #include <fcntl.h>
 #include <string.h>
 
@@ -245,7 +246,7 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
 	buf = dso__read_symbol(dso, filename, map, sym,
 			       &code_buf, &buf_len, &is_64bit);
 	if (buf == NULL)
-		return -1;
+		return errno;
 
 	/* add the function address and name */
 	scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 0aed5c8691bd..344e689567ee 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1827,26 +1827,33 @@ static const u8 *__dso__read_symbol(struct dso *dso, const char *symfs_filename,
 		.ip = start,
 	};
 	u8 *code_buf = NULL;
+	int saved_errno;
 
 	nsinfo__mountns_enter(dso__nsinfo(dso), &nsc);
 	fd = open(symfs_filename, O_RDONLY);
+	saved_errno = errno;
 	nsinfo__mountns_exit(&nsc);
-	if (fd < 0)
+	if (fd < 0) {
+		errno = saved_errno;
 		return NULL;
-
-	if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data, is_64bit) == 0) {
+	}
+	if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data, is_64bit) <= 0) {
 		close(fd);
+		errno = ENOENT;
 		return NULL;
 	}
 	code_buf = malloc(len);
 	if (code_buf == NULL) {
 		close(fd);
+		errno = ENOMEM;
 		return NULL;
 	}
 	count = pread(fd, code_buf, len, data.offset);
+	saved_errno = errno;
 	close(fd);
 	if ((u64)count != len) {
 		free(code_buf);
+		errno = saved_errno;
 		return NULL;
 	}
 	*out_buf = code_buf;
@@ -1875,6 +1882,7 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 		 * Note, there is fallback BPF image disassembly in the objdump
 		 * version but it currently does nothing.
 		 */
+		errno = EOPNOTSUPP;
 		return NULL;
 	}
 	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO) {
@@ -1895,6 +1903,7 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 		return (const u8 *)(uintptr_t)(info_linear->info.jited_prog_insns);
 #else
 		pr_debug("No BPF program disassembly support\n");
+		errno = EOPNOTSUPP;
 		return NULL;
 #endif
 	}
diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index 0369f3adcdb6..2351393e33c5 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -7,6 +7,7 @@
 #include "namespaces.h"
 #include "srcline.h"
 #include "symbol.h"
+#include <errno.h>
 #include <fcntl.h>
 #include <unistd.h>
 #include <linux/zalloc.h>
@@ -147,7 +148,7 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	buf = dso__read_symbol(dso, filename, map, sym,
 			       &code_buf, &buf_len, &is_64bit);
 	if (buf == NULL)
-		return -1;
+		return errno;
 
 	init_llvm();
 	if (arch__is(args->arch, "x86")) {
-- 
2.51.0.618.g983fd99d29-goog

