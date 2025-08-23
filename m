Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E6F13A244
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909168; cv=none; b=GwCo/dH3uRwiSe58LD6QzD17YNoj6iTkZwyYKYkOIw8Yx7mbm7OCjS/9JpSofUY/++THGRQAlxGJHnJJLl6ygP2AluksBqgdY943CuX/3zBz18q2/yAmAy4CCMjH92PvYQjO0O/xoP67Ypf/4yddLBGqhuY6gtg1MyKlZaPDmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909168; c=relaxed/simple;
	bh=0ozmjdqmiUy38NLd3mjJiTMgTSR0mcPgWNA2BVBdmUc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=nEKRmd+9A6Rx6ttI6ds09vAeARE8My+tggaXV3OPk5XRPY/iG17NgHldXAhtJAAI2lpW9YV8vK8bjAGQkUR7izgYbNrJU3qmbzNWZ1R1nzXOU3kGpqDvuW8mSAk/RdzTZ43eMOL0i+cZi9ORynpLUz3E7lIJM1lCXztCNAnr1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5xe/v7o; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5xe/v7o"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-246088fc25cso26836635ad.1
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909165; x=1756513965; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VF5CM2vLbajn/0/hZ+iG3dArvYCDH2HTv0M3yBwbcdc=;
        b=I5xe/v7oCT6PRazAMabJ9q3liksO5+3tumlcnKpXKayOkuxy7vxTNBxcsYM2qMc7hS
         yLLRppA49oVNgWSUrHoniJDueDfB5owRVDADI5bwqOu5aSUaMYSTeJbtm9C9/PauzPM1
         P0Bnnri6W0hry5xia3G40HJPMSjzhjq4Zq+ItWQZmMm3E0q31DJ6+yllj2EdK9Qj4mGo
         agbOiarZ/2ke6yqB9WvxjLPKU2sRBMY86pYe18VPljc00QKZ8Ez4Io2PRMkYgjDZB4aP
         Ar1qkCWTPYExFPwH1gc5bq0BHWV1/Mshn46G6gb+EU9GXVQDyKqFoII8+msreDRcJTJ5
         mwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909165; x=1756513965;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VF5CM2vLbajn/0/hZ+iG3dArvYCDH2HTv0M3yBwbcdc=;
        b=fgDZgzUMPYwcF54njpRtmMm/zQbQuZl5JmeiKjTXxn3IPh/DSmTfXLni1S+XmI8ujY
         5ARj0qKMSu8MI375cW6fu7huzAAAvj2TqFRJ+jeo3dXkX/rSWfuh2LX4dRwYwnxG3yWO
         yEPdwjfJj0LJXImNmd8UQLRdEWxJP1xLOXbsT2TCn+6J0X4YDM5o7apqFWCgDsEXdxhN
         re9+lZQcLApodt/Nu0jexAVGiLnrRT61g38ExPD69CYumndriVXdN0l7SNPB98CQGe55
         tD0Dexi/yODKh+RM3wARkUxlql0poIMxp54513a4IxrYZDbgaUfQkF8IZKzSF4OAJKzh
         t7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVBSXsyPnFL+2rLOAOTVJW1+OkRXOapQ6I21kaCovJ0WZm+vm3+5SrCbRkKiwZpi85+hbqc@lists.linux.dev
X-Gm-Message-State: AOJu0YzAH+tyKwmbxtBsMngu3MlslZQaf1gFLdnim0gSGIlYxat7ipf9
	xuoQYeX5vVPJuZujtlFz2ewFezEGizgf6ABDNQK/WAf2Yz8tx7o9/qXOFEmBvJZD1CjwRuyU2N1
	hdp75Zq27Eg==
X-Google-Smtp-Source: AGHT+IHcBVHGjqZPYoRt453/JseuhLTKBct17IqGPmeEReDDCr7lrPYMm5P0Iz8qbPilxI4LujrWdfsoai5v
X-Received: from pldq21.prod.google.com ([2002:a17:902:c9d5:b0:234:9673:1d13])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22c5:b0:246:2ac3:a8ae
 with SMTP id d9443c01a7336-2462efdc71emr62128425ad.58.1755909165283; Fri, 22
 Aug 2025 17:32:45 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:04 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-9-irogers@google.com>
Subject: [PATCH v5 08/19] perf llvm: Mangle libperf-llvm.so function names
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
index bfa4ad7ea89d..116c935c06f7 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1002,7 +1002,8 @@ $(LIBSYMBOL)-clean:
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
2.51.0.rc2.233.g662b1ed5c5-goog

