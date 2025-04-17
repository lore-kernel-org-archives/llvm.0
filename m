Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF32E225401
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931294; cv=none; b=tJ6CLkwGYfiOBsXV7rmKmxQLJFnspV9VVQQexO3mNr94XYXdRgoYS9RmAPqQiL1gRE5pNQc4xw5dv6EZeF5PHptIqZVSU3FLXb69UrRokPmdSe5uj9mDxH1CyvWxS/dB2mEojtd8OUQg6lSj6exmEftjbP5K7fmnOz9HAoExAuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931294; c=relaxed/simple;
	bh=vo0fATWMVyyAZc0aPQcFuWHRfsLIbRMrgnl393mZOuY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=YcuroOJtshk4DfevGnUUK12h39jXPY2JtetpIL8Zq3RhkWm1TK4RlvQ/M5lX6DVaA3/WRc+VTv4Sx9n2qUiQlrhnGGGqGxMJvExoy2eFmvoLhNkEucQv9GRcb7dUNRoUN/UYXNjFlFbvXpWVl9wuY8O7MoE1BbA9KGU52KkQ4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qvwqAzic; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qvwqAzic"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224192ff68bso12622555ad.1
        for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931291; x=1745536091; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOWuhbgsGhCOfYjY+PJ0Yf970aP5bSbLzlrRNECM4Bs=;
        b=qvwqAzicPwJ7xmj5k+NuocppJ2PCwU7PyRSA/JrriX28N54rC8CbrojycOIFKSW/VD
         Khk+clIA61/ncMP0s14Ih5nR/wxOFmA10y+OOo5f2Ym9em/HzaGqpG8AUGlRfu8BfH6H
         /0k3MBGz7U6FQxE3Tazmq4q644jcFo7uzVmqazt1I+FLH6xoQD9qucgQGxkKc4HOFbOp
         nS7DqmEm/FfuOJdjcA+nf7d+7hUoDO3DG1tc45zyz79aEOdVwThedlRHtZSQDIeaMsn4
         EbWOBVO1vB3PXoHHoRb7Da0dHC3cjR/LsAM1VDs7WMG1/fHngWsvIDQu0/3uso9QgjsX
         TaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931291; x=1745536091;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOWuhbgsGhCOfYjY+PJ0Yf970aP5bSbLzlrRNECM4Bs=;
        b=Jg8PS4OR6SCi13RwEuYPt7RqkNsEjKpM1HHLM8v0vvyBzCqXokIi9YnlQlbrBuVAdw
         IPFJPztHFygbZw93Jt3k6C6wgA24RAL/e4v+La2fkQVPnADqApZHNlfS8p/npf+Gx7IL
         aI1HoWg+utcHCBDwvhXNnLnRaLT9BORz7M8w/TnMK9APqkamQE7Xuea3BKM1Y5MuWswc
         b6dw/8kWs1OlET2SoQzXw94bZ31fDjBqo8/BeTgLmM6AB5i3Nj9tsgbw8OPsbDdK/w1Z
         TCXI1je3sqqEMaMKlnCfgx1vZ1uar3LvDV12O/6Snro1NisykB2iPA8wcSmT+VFbv6dV
         FVtw==
X-Forwarded-Encrypted: i=1; AJvYcCXtGWemgdJDqhBfffEn9N9c5Swbj9S+5r7yyS9pSdRqatw6MqgB3mYeAiWSWNShgm7PIIpX@lists.linux.dev
X-Gm-Message-State: AOJu0YyvjiMbmfyMpCVAV8MjRhSxbtht9obguBaAyGgXrBITKJva6GDC
	Hkf8OMWr2yJL9df4x32/JmrqcEUdlP52+LqdU0D/R22SAlPT0AtSbrzOrOBhm/2bMvDKcVd/K6Z
	qL8L+Fg==
X-Google-Smtp-Source: AGHT+IHoEc6jQbq8HuRmqmXiqrWdB4nYrkkSkauIGXEi8gW5l81eNAz3y+nJ3Ah8XzFLGgTQsEEewT4YwJxl
X-Received: from pljs6.prod.google.com ([2002:a17:903:3ba6:b0:216:25a2:2ecf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d0d:b0:224:c76:5e56
 with SMTP id d9443c01a7336-22c535acd99mr8848435ad.27.1744931291201; Thu, 17
 Apr 2025 16:08:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:07:29 -0700
In-Reply-To: <20250417230740.86048-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250417230740.86048-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417230740.86048-9-irogers@google.com>
Subject: [PATCH v4 08/19] perf llvm: Mangle libperf-llvm.so function names
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

For a function like llvm_addr2line having the libperf-llvm.so exported
symbol named llvm_addr2line meant that the perf llvm_addr2line could
sometimes erroneously be returned. This led to infinite recursion and
eventual stack overflow. To avoid this conflict add a new
BUILDING_PERF_LLVMSO when libperf-llvm.so is being built and use it to
alter the behavior of MANGLE_PERF_LLVM_API, a macro that prefixes the
name when libperf-llvm.so is being built. The prefixed named avoids
the name collision.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf           |  3 ++-
 tools/perf/util/llvm-c-helpers.cpp | 29 ++++++++++++++++++-----------
 tools/perf/util/llvm-c-helpers.h   | 24 ++++++++++++++++--------
 3 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 6833dda27ffb..fc65537d5821 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1003,7 +1003,8 @@ $(LIBSYMBOL)-clean:
 	$(Q)$(RM) -r -- $(LIBSYMBOL_OUTPUT)
 
 ifdef LIBLLVM_DYNAMIC
-LIBPERF_LLVM_CXXFLAGS := $(call filter-out,-DHAVE_LIBLLVM_DYNAMIC,$(CXXFLAGS)) -DHAVE_LIBLLVM_SUPPORT
+LIBPERF_LLVM_CXXFLAGS := $(call filter-out,-DHAVE_LIBLLVM_DYNAMIC,$(CXXFLAGS))
+LIBPERF_LLVM_CXXFLAGS += -DHAVE_LIBLLVM_SUPPORT -DBUILDING_PERF_LLVMSO
 LIBPERF_LLVM_LIBS = -L$(shell $(LLVM_CONFIG) --libdir) $(LIBLLVM) -lstdc++
 
 $(OUTPUT)$(LIBPERF_LLVM): util/llvm-c-helpers.cpp
diff --git a/tools/perf/util/llvm-c-helpers.cpp b/tools/perf/util/llvm-c-helpers.cpp
index 5a6f76e6b705..8cea380be5c2 100644
--- a/tools/perf/util/llvm-c-helpers.cpp
+++ b/tools/perf/util/llvm-c-helpers.cpp
@@ -99,10 +99,12 @@ static int extract_file_and_line(const DILineInfo &line_info, char **file,
 #endif
 
 extern "C"
-int llvm_addr2line(const char *dso_name __maybe_unused, u64 addr __maybe_unused,
-		   char **file __maybe_unused, unsigned int *line __maybe_unused,
-		   bool unwind_inlines __maybe_unused,
-		   llvm_a2l_frame **inline_frames __maybe_unused)
+int MANGLE_PERF_LLVM_API(llvm_addr2line)(const char *dso_name __maybe_unused,
+                                         u64 addr __maybe_unused,
+                                         char **file __maybe_unused,
+                                         unsigned int *line __maybe_unused,
+                                         bool unwind_inlines __maybe_unused,
+                                         llvm_a2l_frame **inline_frames __maybe_unused)
 {
 #if defined(HAVE_LIBLLVM_SUPPORT) && !defined(HAVE_LIBLLVM_DYNAMIC)
 	LLVMSymbolizer *symbolizer = get_symbolizer();
@@ -177,7 +179,8 @@ int llvm_addr2line(const char *dso_name __maybe_unused, u64 addr __maybe_unused,
 		if (!handle)
 			return 0;
 
-		fn = reinterpret_cast<decltype(fn)>(dlsym(handle, "llvm_addr2line"));
+		fn = reinterpret_cast<decltype(fn)>(
+			dlsym(handle, MANGLE_PERF_LLVM_API_STR(llvm_addr2line)));
 		if (!fn)
 			pr_debug("dlsym failed for llvm_addr2line\n");
 		fn_init = true;
@@ -215,8 +218,9 @@ make_symbol_relative_string(struct dso *dso, const char *sym_name,
 #endif
 
 extern "C"
-char *llvm_name_for_code(struct dso *dso __maybe_unused, const char *dso_name __maybe_unused,
-			 u64 addr __maybe_unused)
+char *MANGLE_PERF_LLVM_API(llvm_name_for_code)(struct dso *dso __maybe_unused,
+					       const char *dso_name __maybe_unused,
+					       u64 addr __maybe_unused)
 {
 #if defined(HAVE_LIBLLVM_SUPPORT) && !defined(HAVE_LIBLLVM_DYNAMIC)
 	LLVMSymbolizer *symbolizer = get_symbolizer();
@@ -242,7 +246,8 @@ char *llvm_name_for_code(struct dso *dso __maybe_unused, const char *dso_name __
 		if (!handle)
 			return NULL;
 
-		fn = reinterpret_cast<decltype(fn)>(dlsym(handle, "llvm_name_for_code"));
+		fn = reinterpret_cast<decltype(fn)>(
+			dlsym(handle, MANGLE_PERF_LLVM_API_STR(llvm_name_for_code)));
 		if (!fn)
 			pr_debug("dlsym failed for llvm_name_for_code\n");
 		fn_init = true;
@@ -256,8 +261,9 @@ char *llvm_name_for_code(struct dso *dso __maybe_unused, const char *dso_name __
 }
 
 extern "C"
-char *llvm_name_for_data(struct dso *dso __maybe_unused, const char *dso_name __maybe_unused,
-			 u64 addr __maybe_unused)
+char *MANGLE_PERF_LLVM_API(llvm_name_for_data)(struct dso *dso __maybe_unused,
+					       const char *dso_name __maybe_unused,
+					       u64 addr __maybe_unused)
 {
 #if defined(HAVE_LIBLLVM_SUPPORT) && !defined(HAVE_LIBLLVM_DYNAMIC)
 	LLVMSymbolizer *symbolizer = get_symbolizer();
@@ -283,7 +289,8 @@ char *llvm_name_for_data(struct dso *dso __maybe_unused, const char *dso_name __
 		if (!handle)
 			return NULL;
 
-		fn = reinterpret_cast<decltype(fn)>(dlsym(handle, "llvm_name_for_data"));
+		fn = reinterpret_cast<decltype(fn)>(
+			dlsym(handle, MANGLE_PERF_LLVM_API_STR(llvm_name_for_data)));
 		if (!fn)
 			pr_debug("dlsym failed for llvm_name_for_data\n");
 		fn_init = true;
diff --git a/tools/perf/util/llvm-c-helpers.h b/tools/perf/util/llvm-c-helpers.h
index d2b99637a28a..cfcfd540cdae 100644
--- a/tools/perf/util/llvm-c-helpers.h
+++ b/tools/perf/util/llvm-c-helpers.h
@@ -13,6 +13,14 @@
 extern "C" {
 #endif
 
+/* Support name mangling so that libperf_llvm.so's names don't match those in perf. */
+#ifdef BUILDING_PERF_LLVMSO
+#define MANGLE_PERF_LLVM_API(x) PERF_LLVM_SO_ ## x
+#else
+#define MANGLE_PERF_LLVM_API(x) x
+#endif
+#define MANGLE_PERF_LLVM_API_STR(x) "PERF_LLVM_SO_" #x
+
 struct dso;
 
 struct llvm_a2l_frame {
@@ -37,12 +45,12 @@ struct llvm_a2l_frame {
  * a newly allocated array with that length. The caller is then responsible
  * for freeing both the strings and the array itself.
  */
-int llvm_addr2line(const char* dso_name,
-                   u64 addr,
-                   char** file,
-                   unsigned int* line,
-                   bool unwind_inlines,
-                   struct llvm_a2l_frame** inline_frames);
+int MANGLE_PERF_LLVM_API(llvm_addr2line)(const char *dso_name,
+					 u64 addr,
+					 char **file,
+					 unsigned int *line,
+					 bool unwind_inlines,
+					 struct llvm_a2l_frame **inline_frames);
 
 /*
  * Simple symbolizers for addresses; will convert something like
@@ -50,8 +58,8 @@ int llvm_addr2line(const char* dso_name,
  *
  * The returned value must be freed by the caller, with free().
  */
-char *llvm_name_for_code(struct dso *dso, const char *dso_name, u64 addr);
-char *llvm_name_for_data(struct dso *dso, const char *dso_name, u64 addr);
+char *MANGLE_PERF_LLVM_API(llvm_name_for_code)(struct dso *dso, const char *dso_name, u64 addr);
+char *MANGLE_PERF_LLVM_API(llvm_name_for_data)(struct dso *dso, const char *dso_name, u64 addr);
 
 #ifdef __cplusplus
 }
-- 
2.49.0.805.g082f7c87e0-goog

