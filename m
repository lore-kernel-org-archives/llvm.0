Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B893EA97B
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 06:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539198; cv=none; b=Hcz/dAOpcNZ/YFimxtJWwmpb6NW1d/p8K5bqdM5LGV6Tj9w5as1QgPJlOrSLxw5By6zzCr2v1kdMhKe6zoszqkE+1dty5aY8+BbVIjTEQ/iDq0172q70mhNV6VZ7cPuqVPeqQlTR26OLDbdH+xENJgIBz74QAPJy6ypHzjintSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539198; c=relaxed/simple;
	bh=aSRn2a84aJ5XKChOsQsFTIditSg7lvW/7uN1eZsfU6g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=p5Y1FFaza/9If8/vsIY41D9qdakKKNgruA1jcnw75DjQ3IGckEwUYJmip7B3j4QBzDd3QfI1TsCWIhcDdokJ1lui6BFkSUiGzNLjBq2ZNjQJttUO/eYHYBVPwyqhI4dm5SCpRqkweTVq2L3fpOstpi8eN487jl6duDIkZK2i++0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t7AkeQTB; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t7AkeQTB"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso9712144a12.1
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 23:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539196; x=1790143996; darn=lists.linux.dev;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCHS0z59fUPYMY565s32kon+1X6H9/iNUQvbm+yc4VA=;
        b=t7AkeQTBPOLS+yLaelT+dIK0hYbYH8WALaLDcy23/6cLDPl0lea/s5x+pjVRK2fcQc
         yG1w4Y8Zz8KprFjr9/ssQE0qXIoyowwnJqqTM3DQgLisn+2LAAPMCo7GR2+y2XopXqRA
         eEiCv2a72PDCJdc2SablQ2OKnTmyj612bsWQ2hLdSFYHnxTGYFVjG3VKEUGRqsRvhfGy
         Fp13v2WIozE7ZnAugisM+RdGLgbsTxexOiyHWULdtWmGJl7LiWOsmza3tuvKsX9hwsHE
         svhDTbwQurjswxws2BEPbbVx7g8bNxYcFy28QeXVJKtpQORyhDOOCcYspqJhI+dZktdD
         XDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539196; x=1790143996;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VCHS0z59fUPYMY565s32kon+1X6H9/iNUQvbm+yc4VA=;
        b=UExdIbk1D9Q7KBrxfgp+vYyXP5DOU2UY9HcC6O/eIf+jndZQta2PTJWiRhNBngBM/8
         n5eXfV4jcecm0MDSFA8eiOLM2AO9f0RyreyA77u5nNYv9tsTE+Z4q5wjlBg/K5dxpZK+
         aHSDAP/WrpMcXP9+Nx1YmGNvjzFA67eqbRGHGxFGPUEMqrSc40ndoIxDkOOXA73e2evK
         rdDL/psBYrqbVe9Hd+aUmVdoo8rGZeEtkI9E0ZgCGD0XJzavBBOBXR4AUJUPhfp74MG6
         oL5bf+tTVlQf14yi83v9eYNuWohF9R77MxWAAXwQb9Y2e18UvrwaOVNx03WYlBS0ltMn
         70EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ6q02wiaSvsL4qgdkseen/payU1MtZ+czeancuiJjdP0hTp1lRi5v/R11RKaNUo3TUUD/@lists.linux.dev
X-Gm-Message-State: AFuF++lOwN5k5P8DI+trw8B5S15MgvbiRXeWbCZ9UvOnoEFuHuJFNY8e
	F8h8+u/pWSXBxRN4G0SOnD7t8zASQJBkfyJCghPnmNbEvc1l3NsQM8JDPHHMi8IzWW466HBSwLf
	3NrAQnfG3jw==
X-Received: from dlea16-n1.prod.google.com ([2002:a05:701b:4210:10b0:144:bbd4:62e0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a11d:b0:3b3:216b:2743
 with SMTP id adf61e73a8af0-3dd5f4038f0mr3242885637.4.1789539195928; Tue, 15
 Sep 2026 23:13:15 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:11 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-3-irogers@google.com>
Subject: [PATCH 2/9] perf symbol: Fix the build when demangling with libbfd
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

cxx_demangle_sym() calls bfd_demangle() with the DMGL_PARAMS and
DMGL_ANSI flags, but nothing declares them. The
"#define PACKAGE 'perf'", "#include <bfd.h>" and the DMGL_ definitions
were left behind in symbol-elf.c when the demangling code moved to
symbol.c, and libiberty's demangle.h that defines the flags isn't
installed by every binutils package. The cplus_demangle() variant is
missing a declaration for the same reason.

The code is only built when the C++ ABI's __cxa_demangle() is
unavailable, so most builds never compile it:

  $ make BUILD_NONDISTRO=1 NO_DEMANGLE=1
  util/symbol.c:2714: error: 'DMGL_PARAMS' undeclared
  util/symbol.c:2714: error: 'DMGL_ANSI' undeclared
  util/symbol.c:2716: error: implicit declaration of 'bfd_demangle'

Move the libbfd demangling into libbfd.c, which already includes bfd.h,
and declare in symbol.c the libiberty interfaces the cplus_demangle()
variant needs.

Fixes: 4d9b5146f0d9 ("perf symbol: Move demangling code out of symbol-elf.c")
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/libbfd.c | 17 +++++++++++++++++
 tools/perf/util/libbfd.h |  9 +++++++++
 tools/perf/util/symbol.c | 18 +++++++++++++++---
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/libbfd.c b/tools/perf/util/libbfd.c
index 8ac6670a39aa..131bfedf48cd 100644
--- a/tools/perf/util/libbfd.c
+++ b/tools/perf/util/libbfd.c
@@ -72,6 +72,23 @@ static void ensure_bfd_init(void)
 	pthread_once(&bfd_init_once, perf_bfd_init);
 }
 
+/*
+ * Flags from libiberty's demangle.h. bfd.h declares bfd_demangle but not the
+ * flags to pass to it, and demangle.h isn't installed by every binutils
+ * package.
+ */
+#ifndef DMGL_PARAMS
+#define DMGL_PARAMS	(1 << 0)	/* Include function arguments. */
+#define DMGL_ANSI	(1 << 1)	/* Include const, volatile, etc. */
+#endif
+
+char *libbfd__demangle_sym(const char *str, bool params, bool modifiers)
+{
+	int flags = (params ? DMGL_PARAMS : 0) | (modifiers ? DMGL_ANSI : 0);
+
+	return bfd_demangle(/*abfd=*/NULL, str, flags);
+}
+
 static int bfd_error(const char *string)
 {
 	const char *errmsg;
diff --git a/tools/perf/util/libbfd.h b/tools/perf/util/libbfd.h
index 953886f3d62f..14171db8b112 100644
--- a/tools/perf/util/libbfd.h
+++ b/tools/perf/util/libbfd.h
@@ -31,6 +31,8 @@ int libbfd_filename__read_debuglink(const char *filename, char *debuglink, size_
 
 int symbol__disassemble_bpf_libbfd(struct symbol *sym, struct annotate_args *args);
 
+char *libbfd__demangle_sym(const char *str, bool params, bool modifiers);
+
 #else // !defined(HAVE_LIBBFD_SUPPORT)
 #include "annotate.h"
 
@@ -77,6 +79,13 @@ static inline int symbol__disassemble_bpf_libbfd(struct symbol *sym __always_unu
 	return SYMBOL_ANNOTATE_ERRNO__NO_LIBOPCODES_FOR_BPF;
 }
 
+static inline char *libbfd__demangle_sym(const char *str __always_unused,
+					 bool params __always_unused,
+					 bool modifiers __always_unused)
+{
+	return NULL;
+}
+
 #endif // defined(HAVE_LIBBFD_SUPPORT)
 
 #endif /* __PERF_LIBBFD_H */
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 3587ad243159..3206929473a2 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -27,6 +27,7 @@
 #include "dso.h"
 #include "util.h" // lsdir()
 #include "event.h"
+#include "libbfd.h"
 #include "machine.h"
 #include "map.h"
 #include "symbol.h"
@@ -2707,13 +2708,24 @@ static bool want_demangle(bool is_kernel_sym)
  * version.
  */
 #ifndef HAVE_CXA_DEMANGLE_SUPPORT
+#ifdef HAVE_CPLUS_DEMANGLE_SUPPORT
+/*
+ * Declarations from libiberty's demangle.h, the header isn't installed by
+ * every binutils package.
+ */
+#ifndef DMGL_PARAMS
+#define DMGL_PARAMS	(1 << 0)	/* Include function arguments. */
+#define DMGL_ANSI	(1 << 1)	/* Include const, volatile, etc. */
+#endif
+
+char *cplus_demangle(const char *mangled, int options);
+#endif
+
 char *cxx_demangle_sym(const char *str __maybe_unused, bool params __maybe_unused,
 		       bool modifiers __maybe_unused)
 {
 #ifdef HAVE_LIBBFD_SUPPORT
-	int flags = (params ? DMGL_PARAMS : 0) | (modifiers ? DMGL_ANSI : 0);
-
-	return bfd_demangle(NULL, str, flags);
+	return libbfd__demangle_sym(str, params, modifiers);
 #elif defined(HAVE_CPLUS_DEMANGLE_SUPPORT)
 	int flags = (params ? DMGL_PARAMS : 0) | (modifiers ? DMGL_ANSI : 0);
 
-- 
2.55.0.1032.g73a4cd73de-goog

